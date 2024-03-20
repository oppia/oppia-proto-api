"""
Libraries that define endpoint API protos for interacting with Oppia's backend.
"""

load("//defs:defs.bzl", "define_buildifier_tests", "oppia_proto_library")

oppia_proto_library(
    name = "android_proto",
    srcs = ["android.proto"],
    relative_parent_dir_path = "org/oppia/proto/v1/api",
    visibility = ["//:api_visibility"],
    deps = [
        "//org/oppia/proto/v1/structure:structure_proto",
        "//org/oppia/proto/v1/versions:versions_proto",
    ],
)

define_buildifier_tests()
