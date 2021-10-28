"""
Libraries that define endpoint API protos for interacting with Oppia's backend.
"""

load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "android_proto",
    srcs = ["android.proto"],
    import_prefix = "org/oppia/proto/v1/api",  # Make directory prefix match declared package.
    strip_import_prefix = "",  # Strip the default file prefix so that it may be redefined.
    visibility = ["//:api_visibility"],
    deps = [
        "//proto/v1/structure:structure_proto",
        "//proto/v1/versions:versions_proto",
    ],
)
