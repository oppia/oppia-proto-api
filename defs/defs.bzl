"""
Defines Starlark macros that are used to define protos and set up Bazel build directories (and
automatically define Buf & Buildifier lint tests).
"""

load("@com_github_bazelbuild_buildtools//buildifier:buildifier.bzl", "buildifier_test")
load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")

# Configured lint warnings for Buildifier linter tests & autofixing configuration.
BUILDIFIER_LINT_WARNINGS = [
    "+out-of-order-load",
    "+unsorted-dict-items",
]

def oppia_proto_library(name, relative_parent_dir_path, **kwargs):
    """
    Defines an Oppia API-compatible proto library, and a lint test with the same name ending in
    "_lint_test"."

    Args:
        name: str. The name of the library being defined.
        relative_parent_dir_path: str. The relative directory path to the containing Bazel package.
        **kwargs: additional parameters passed into proto_library.
    """

    proto_library(
        name = name,
        import_prefix = relative_parent_dir_path,  # Make directory prefix match declared package.
        strip_import_prefix = "",  # Strip the default file prefix so that it may be redefined.
        **kwargs
    )

    buf_lint_test(
        name = "%s_lint_test" % name,
        config = "//defs:buf.yaml",
        targets = [name],
    )

def define_buildifier_tests():
    """
    Defines a Bazel lint test for this package with the name "bazel_lint_check_test".
    """

    buildifier_test(
        name = "bazel_lint_check_test",
        srcs = native.glob(["WORKSPACE"]) + native.glob(["BUILD"]) + native.glob(["*.bazel"]) + native.glob(["*.bzl"]),
        lint_mode = "warn",
        lint_warnings = BUILDIFIER_LINT_WARNINGS,
        verbose = True,
    )
