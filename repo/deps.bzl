"""
Defines Starlark macros that are used to import the dependencies needed to build the Oppia proto API
project (such as for cases when another Bazel workspace depends on this project). See the importing
instructions in the README for more details.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

# Note to developers: Please keep this dict sorted by key to make it easier to find dependencies.
_DEPENDENCY_VERSIONS = {
    "rules_python": {
        "sha": "934c9ceb552e84577b0faf1e5a2f0450314985b4d8712b2b70717dc679fdc01b",
        "url": "https://github.com/bazelbuild/rules_python/releases/download/{0}/rules_python-{0}.tar.gz",
        "version": "0.3.0",
    },
    "com_google_protobuf": {
        "sha": "c6003e1d2e7fefa78a3039f19f383b4f3a61e81be8c19356f85b6461998ad3db",
        "strip_prefix": "protobuf-{0}",
        "url": "https://github.com/protocolbuffers/protobuf/archive/v{0}.tar.gz",
        "version": "3.17.3",
    },
    "rules_proto": {
        # Note that rules_proto doesn't have any shipped versions, so the workspace needs to pin to a
        # specific commit hash.
        "sha": "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
        "strip_prefix": "rules_proto-{0}",
        "url": "https://github.com/bazelbuild/rules_proto/archive/{0}.tar.gz",
        "version": "97d8af4dc474595af3900dd85cb3a29ad28cc313",
    },
    "rules_java": {
        "sha": "220b87d8cfabd22d1c6d8e3cdb4249abd4c93dcc152e0667db061fb1b957ee68",
        "url": "https://github.com/bazelbuild/rules_java/releases/download/{0}/rules_java-{0}.tar.gz",
        "version": "0.1.1",
    },
    "io_bazel_rules_go": {
        "sha": "2b1641428dff9018f9e85c0384f03ec6c10660d935b750e3fa1492a281a53b0f",
        "url": "https://github.com/bazelbuild/rules_go/releases/download/{0}/rules_go-{0}.zip",
        "version": "v0.29.0",
    },
    "bazel_gazelle": {
        "sha": "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
        "url": "https://github.com/bazelbuild/bazel-gazelle/releases/download/{0}/bazel-gazelle-{0}.tar.gz",
        "version": "v0.24.0",
    },
    "com_github_bazelbuild_buildtools": {
        "sha": "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        "strip_prefix": "buildtools-{0}",
        "url": "https://github.com/bazelbuild/buildtools/archive/refs/tags/{0}.tar.gz",
        "version": "4.2.2",
    },
}

def _setUpHttpArchiveDependency(name):
    metadata = _DEPENDENCY_VERSIONS[name]
    sha = metadata["sha"]
    strip_prefix = metadata.get("strip_prefix")
    url = metadata["url"]
    version = metadata["version"]

    formatted_strip_prefix = strip_prefix.format(version) if not (strip_prefix == None) else None

    http_archive(
        name = name,
        urls = [url.format(version)],
        sha256 = sha,
        strip_prefix = formatted_strip_prefix,
    )

def _setUpPython():
    _setUpHttpArchiveDependency(name = "rules_python")

def _setUpProtobuf():
    _setUpHttpArchiveDependency(name = "com_google_protobuf")

def _setUpRulesProto():
    _setUpHttpArchiveDependency(name = "rules_proto")

def _setUpRulesJava():
    _setUpHttpArchiveDependency(name = "rules_java")

def _setUpIoBazelRulesGo():
    _setUpHttpArchiveDependency(name ="io_bazel_rules_go")

def _setUpBazelGazell():
    _setUpHttpArchiveDependency(name ="bazel_gazelle")

def _setUpBazelBuildTools():
    _setUpHttpArchiveDependency(name ="com_github_bazelbuild_buildtools")

def initializeDepsForWorkspace():
    """
    Loads the dependencies needed to be able to build the Oppia proto API project.

    Note that this must be called after loading in this deps file, for example:

        load("//repo:deps.bzl", "initializeDepsForWorkspace")
        initializeDepsForWorkspace()

    Note also that toolchains may need to be set up after loading this dependencies (see
    toolchains.bzl).
    """

    # Set up Python (as a prerequisite dependency for Protobuf).
    _setUpPython()

    _setUpProtobuf()

    # Set up rules_proto to allow defining proto libraries.
    _setUpRulesProto()

    # Set up rules_java to enable the Java proto & Java proto lite rules.
    _setUpRulesJava()

    _setUpIoBazelRulesGo()

def initializeGoDeps():
    go_rules_dependencies()
    go_register_toolchains(version = "1.17.2")

def initializeBazelGazell():
    _setUpBazelGazell()
    gazelle_dependencies()

def initializeProtobuf():
    protobuf_deps()

def initializeBazelBuildTools():
    _setUpBazelBuildTools()
