"""
This file lists and imports all external dependencies needed to build Oppia Proto API.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Set up Python (as a prerequisite dependency for Protobuf).

PYTHON_SHA256_HASH = "934c9ceb552e84577b0faf1e5a2f0450314985b4d8712b2b70717dc679fdc01b"
PYTHON_VERSION = "0.3.0"

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/releases/download/{0}/rules_python-{0}.tar.gz".format(PYTHON_VERSION),
    sha256 = PYTHON_SHA256_HASH,
)

# Set up proto & its toolchain.

PROTOBUF_SHA256_HASH = "c6003e1d2e7fefa78a3039f19f383b4f3a61e81be8c19356f85b6461998ad3db"
PROTOBUF_VERSION = "3.17.3"

http_archive(
    name = "com_google_protobuf",
    sha256 = PROTOBUF_SHA256_HASH,
    strip_prefix = "protobuf-%s" % PROTOBUF_VERSION,
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v%s.tar.gz" % PROTOBUF_VERSION]
)

# Set up rules_proto to allow defining proto libraries.

# Note that rules_proto doesn't have any shipped versions, so the workspace needs to pin to a
# specific commit hash.
RULES_PROTO_VERSION = "97d8af4dc474595af3900dd85cb3a29ad28cc313"
RULES_PROTO_SHA256_HASH = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208"

http_archive(
    name = "rules_proto",
    sha256 = RULES_PROTO_SHA256_HASH,
    strip_prefix = "rules_proto-%s" % RULES_PROTO_VERSION,
    urls = ["https://github.com/bazelbuild/rules_proto/archive/%s.tar.gz" % RULES_PROTO_VERSION],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

# Set up rules_java to enable the Java proto & Java proto lite rules.
RULES_JAVA_VERSION = "0.1.1"
RULES_JAVA_SHA256_HASH = "220b87d8cfabd22d1c6d8e3cdb4249abd4c93dcc152e0667db061fb1b957ee68"

http_archive(
    name = "rules_java",
    sha256 = RULES_JAVA_SHA256_HASH,
    url = "https://github.com/bazelbuild/rules_java/releases/download/{0}/rules_java-{0}.tar.gz".format(RULES_JAVA_VERSION),
)

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")
rules_java_dependencies()
rules_java_toolchains()
