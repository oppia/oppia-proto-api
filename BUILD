"""
TODO: fill in
"""

load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_java//java:defs.bzl", "java_lite_proto_library", "java_proto_library")

package_group(
    name = "api_visibility",
    packages = [
        "//",
    ],
)

package_group(
    name = "proto_impl_visibility",
    packages = [
        "//proto/...",
    ],
)

# Note that  'deps' specifically needs to be used (versus just 'exports') since downstream
# proto_library targets otherwise won't pull in the protos, and language libraries need it to
# actually generate corresponding proto code.
proto_library(
    name = "android_protos",
    visibility = ["//visibility:public"],
    deps = [
      "//proto/v1/api:android_proto",
      "//proto/v1/structure:structure_proto",
    ],
)

java_proto_library(
    name = "android_java_protos",
    visibility = ["//visibility:public"],
    deps = [":android_protos"],
)

java_lite_proto_library(
    name = "android_java_lite_protos",
    visibility = ["//visibility:public"],
    deps = [":android_protos"],
)
