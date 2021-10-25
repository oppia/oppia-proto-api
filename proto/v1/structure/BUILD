"""
Libraries that define core lesson structure protos.
"""

load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
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
    import_prefix = "org/oppia/proto/v1/structure",  # Make directory prefix match declared package.
    strip_import_prefix = "",  # Strip the default file prefix so that it may be redefined.
    visibility = [
        "//:api_visibility",
        "//:proto_impl_visibility",
    ],
    deps = [
        "//proto/v1/versions:versions_proto",
    ],
)
