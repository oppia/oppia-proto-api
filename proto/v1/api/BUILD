"""
This library contains the proto_library(), java_lite_proto_library() and java_proto_library rules.
The proto_library() rule creates a proto file library for the android API
proto file to be used in multiple languages.
The java_lite_proto_library() rule takes in a proto_library target and generates Java code.
The java_proto_library() rule takes in a proto_library target and generates Java code.
"""

load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "android_proto",
    srcs = ["android.proto"],
    visibility = ["//:api_visibility"],
    strip_import_prefix = "",  # Strip the default file prefix so that it may be redefined.
    import_prefix = "org/oppia/proto/v1/api",  # Make directory prefix match declared package.
    deps = [
      "//proto/v1/structure:structure_proto"
    ],
)
