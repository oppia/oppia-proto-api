"""
Libraries that define proto versions used by API & structural protos for client-server
compatibility.
"""

load("//defs:defs.bzl", "define_buildifier_tests", "oppia_proto_library")

oppia_proto_library(
    name = "versions_proto",
    srcs = [
        "api_versions.proto",
        "structure_versions.proto",
    ],
    relative_parent_dir_path = "org/oppia/proto/v1/versions",
    visibility = [
        "//:api_visibility",
        "//:proto_impl_visibility",
    ],
    deps = [
        "@com_google_protobuf//:descriptor_proto",
    ],
)

define_buildifier_tests()
