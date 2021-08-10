"""
TODO: fill in
"""

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

java_library(
    name = "android_java_protos",
    visibility = ["//visibility:public"],
    exports = [
      "//proto/v1/api:android_java_proto",
      "//proto/v1/structure:structure_java_proto",
    ],
)

java_library(
    name = "android_java_lite_protos",
    visibility = ["//visibility:public"],
    exports = [
      "//proto/v1/api:android_java_proto_lite",
      "//proto/v1/structure:structure_java_proto_lite",
    ],
)
