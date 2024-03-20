"""
Top-level definitions for Oppia's proto API project. Only libraries that are part of the project's
public, importable API should be defined here (and all such libraries should be defined here and
nowhere else).
"""

load("@com_github_bazelbuild_buildtools//buildifier:buildifier.bzl", "buildifier")
load("@rules_java//java:defs.bzl", "java_lite_proto_library", "java_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("//defs:defs.bzl", "BUILDIFIER_LINT_WARNINGS", "define_buildifier_tests")

package_group(
    name = "api_visibility",
    packages = [
        "//",
    ],
)

package_group(
    name = "proto_impl_visibility",
    packages = [
        "//org/oppia/proto/...",
    ],
)

# The protos needed to interact with Oppia's proto API. This is meant to be used in cases when these
# protos are used by domain-specific protos in downstream projects.
# NOTE TO DEVELOPERS: 'deps' specifically needs to be used (versus just 'exports') since downstream
# proto_library targets otherwise won't pull in the protos, and language libraries need it to
# actually generate corresponding proto code.
proto_library(
    name = "android_protos",
    visibility = ["//visibility:public"],
    deps = [
        "//org/oppia/proto/v1/api:android_proto",
        "//org/oppia/proto/v1/structure:structure_proto",
        "//org/oppia/proto/v1/versions:versions_proto",
    ],
)

# The Java versions of the protos needed to interact with Oppia's proto API.
java_proto_library(
    name = "android_java_protos",
    visibility = ["//visibility:public"],
    deps = [":android_protos"],
)

# The Java lite versions of the protos needed to interact with Oppia's proto API.
java_lite_proto_library(
    name = "android_java_lite_protos",
    visibility = ["//visibility:public"],
    deps = [":android_protos"],
)

buildifier(
    name = "fix_bazel_lint_problems",
    lint_mode = "fix",
    lint_warnings = BUILDIFIER_LINT_WARNINGS,
)

define_buildifier_tests()
