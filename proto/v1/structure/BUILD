"""
TODO: fill in
"""

load("@rules_java//java:defs.bzl", "java_lite_proto_library", "java_proto_library")
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
        "versions.proto",
    ],
    visibility = ["//:proto_impl_visibility"],
)

java_proto_library(
    name = "structure_java_proto",
    visibility = ["//:api_visibility"],
    deps = [":structure_proto"],
)

java_lite_proto_library(
    name = "structure_java_proto_lite",
    visibility = ["//:api_visibility"],
    deps = [":structure_proto"],
)
