"""
Libraries that define core lesson structure protos.
"""

load("//defs:defs.bzl", "define_buildifier_tests", "oppia_proto_library")

oppia_proto_library(
    name = "structure_proto",
    srcs = [
        "concept_card.proto",
        "exploration.proto",
        "image.proto",
        "languages.proto",
        "objects.proto",
        "question.proto",
        "revision_card.proto",
        "state.proto",
        "topic_summary.proto",
    ],
    relative_parent_dir_path = "org/oppia/proto/v1/structure",
    visibility = [
        "//:api_visibility",
        "//:proto_impl_visibility",
    ],
    deps = [
        "//org/oppia/proto/v1/versions:versions_proto",
    ],
)

define_buildifier_tests()
