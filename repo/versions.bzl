"""
Defines third-party dependencies and their versions.
"""

# Note to developers: Please keep this dict sorted by key to make it easier to find dependencies.
MAVEN_DEPENDENCY_VERSIONS = {
    "bazel_gazelle": {
        "sha": "92329a7dbb26d0beacc43da669211546ea6627582793f4dd5f28837fde3a5c08",
        "url": "https://github.com/bazelbuild/bazel-gazelle/releases/download/v{0}/bazel-gazelle-v{0}.tar.gz",
        "version": "0.50.0",
    },
    "com_github_bazelbuild_buildtools": {
        "sha": "f3b800e9f6ca60bdef3709440f393348f7c18a29f30814288a7326285c80aab9",
        "strip_prefix": "buildtools-{0}",
        "url": "https://github.com/bazelbuild/buildtools/archive/refs/tags/v{0}.tar.gz",
        "version": "8.5.1",
    },
    "com_google_protobuf": {
        "sha": "7c3ebd7aaedd86fa5dc479a0fda803f602caaf78d8aff7ce83b89e1b8ae7442a",
        "strip_prefix": "protobuf-{0}",
        "url": "https://github.com/protocolbuffers/protobuf/releases/download/v{0}/protobuf-{0}.tar.gz",
        "version": "28.3",
    },
    "io_bazel_rules_go": {
        "sha": "86d3dc8f59d253524f933aaf2f3c05896cb0b605fc35b460c0b4b039996124c6",
        "url": "https://github.com/bazelbuild/rules_go/releases/download/v{0}/rules_go-v{0}.zip",
        "version": "0.60.0",
    },
    "rules_buf": {
        "sha": "4a024a411996967c3a3f49b04765bd016169a2c79be3dc78aa62bfa2643850ef",
        "strip_prefix": "rules_buf-{0}",
        "url": "https://github.com/bufbuild/rules_buf/releases/download/v{0}/rules_buf-{0}.tar.gz",
        "version": "0.5.2",
    },
    "rules_java": {
        "sha": "4018e97c93f97680f1650ffd2a7530245b864ac543fd24fae8c02ba447cb2864",
        "url": "https://github.com/bazelbuild/rules_java/releases/download/{0}/rules_java-{0}.tar.gz",
        "version": "7.3.1",
    },
    "rules_proto": {
        "sha": "14a225870ab4e91869652cfd69ef2028277fc1dc4910d65d353b62d6e0ae21f4",
        "strip_prefix": "rules_proto-{0}",
        "url": "https://github.com/bazelbuild/rules_proto/releases/download/{0}/rules_proto-{0}.tar.gz",
        "version": "7.1.0",
    },
    "rules_python": {
        "sha": "c68bdc4fbec25de5b5493b8819cfc877c4ea299c0dcb15c244c5a00208cde311",
        "strip_prefix": "rules_python-{0}",
        "url": "https://github.com/bazelbuild/rules_python/releases/download/{0}/rules_python-{0}.tar.gz",
        "version": "0.31.0",
    },
}

BUF_VERSION = "1.14.0"
GO_VERSION = "1.23.0"
