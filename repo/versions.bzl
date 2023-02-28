"""
Defines third-party dependencies and their versions.
"""

# Note to developers: Please keep this dict sorted by key to make it easier to find dependencies.
MAVEN_DEPENDENCY_VERSIONS = {
    "bazel_gazelle": {
        "sha": "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
        "url": "https://github.com/bazelbuild/bazel-gazelle/releases/download/v{0}/bazel-gazelle-v{0}.tar.gz",
        "version": "0.24.0",
    },
    "com_github_bazelbuild_buildtools": {
        "sha": "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        "strip_prefix": "buildtools-{0}",
        "url": "https://github.com/bazelbuild/buildtools/archive/refs/tags/{0}.tar.gz",
        "version": "4.2.2",
    },
    "com_google_protobuf": {
        "sha": "c6003e1d2e7fefa78a3039f19f383b4f3a61e81be8c19356f85b6461998ad3db",
        "strip_prefix": "protobuf-{0}",
        "url": "https://github.com/protocolbuffers/protobuf/archive/v{0}.tar.gz",
        "version": "3.17.3",
    },
    "io_bazel_rules_go": {
        "sha": "8e968b5fcea1d2d64071872b12737bbb5514524ee5f0a4f54f5920266c261acb",
        "url": "https://github.com/bazelbuild/rules_go/releases/download/v{0}/rules_go-v{0}.zip",
        "version": "0.28.0",  # Last version compatible with Bazel 4.0.0.
    },
    "rules_buf": {
        "sha": "523a4e06f0746661e092d083757263a249fedca535bd6dd819a8c50de074731a",
        "strip_prefix": "rules_buf-{0}",
        "url": "https://github.com/bufbuild/rules_buf/archive/refs/tags/v{0}.zip",
        "version": "0.1.1",
    },
    "rules_java": {
        "sha": "220b87d8cfabd22d1c6d8e3cdb4249abd4c93dcc152e0667db061fb1b957ee68",
        "url": "https://github.com/bazelbuild/rules_java/releases/download/{0}/rules_java-{0}.tar.gz",
        "version": "0.1.1",
    },
    "rules_proto": {
        # Note that rules_proto doesn't have any shipped versions, so the workspace needs to pin to a
        # specific commit hash.
        "sha": "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
        "strip_prefix": "rules_proto-{0}",
        "url": "https://github.com/bazelbuild/rules_proto/archive/{0}.tar.gz",
        "version": "97d8af4dc474595af3900dd85cb3a29ad28cc313",
    },
    "rules_python": {
        "sha": "934c9ceb552e84577b0faf1e5a2f0450314985b4d8712b2b70717dc679fdc01b",
        "url": "https://github.com/bazelbuild/rules_python/releases/download/{0}/rules_python-{0}.tar.gz",
        "version": "0.3.0",
    },
}

BUF_VERSION = "1.14.0"
GO_VERSION = "1.17.2"
