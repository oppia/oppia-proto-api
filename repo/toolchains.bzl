"""
Defines Starlark macros that are used to set up dependency toolcahins needed to build the Oppia
proto API project (such as for cases when another Bazel workspace depends on this project). See the
importing instructions in the README for more details.
"""

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@rules_buf//buf:repositories.bzl", "rules_buf_dependencies", "rules_buf_toolchains")
load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")
load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
load("//repo:versions.bzl", "BUF_VERSION", "GO_VERSION")

def initializeToolchainsForWorkspace():
    """
    Initializes the toolchains needed to be able to build the Oppia proto API project.

    Note that this must be called after loading in this toolchains file, for example:

        load("//repo:toolchains.bzl", "initializeToolchainsForWorkspace")
        initializeToolchainsForWorkspace()

    Note also that this can't be called until the dependencies themselves are loaded (see deps.bzl).
    """

    # Set up the toolchains for rules_go.
    go_rules_dependencies()
    go_register_toolchains(version = GO_VERSION)

    # Set up the dependencies for Gazelle.
    gazelle_dependencies()

    # Set up the toolchains for rules_proto.
    rules_proto_dependencies()
    rules_proto_toolchains()

    # Set up the toolchains for rules_java.
    rules_java_dependencies()
    rules_java_toolchains()

    # Set up the toolchains for rules_buf.
    rules_buf_dependencies()
    rules_buf_toolchains(version = "v%s" % BUF_VERSION)

    # Set up the dependencies for proto build tools (including Buildifier).
    protobuf_deps()
