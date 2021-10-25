"""
Defines Starlark macros that are used to set up dependency toolcahins needed to build the Oppia
proto API project (such as for cases when another Bazel workspace depends on this project). See the
importing instructions in the README for more details.
"""

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

def initializeToolchainsForWorkspace():
    """
    Initializes the toolchains needed to be able to build the Oppia proto API project.

    Note that this must be called after loading in this toolchains file, for example:

        load("//repo:toolchains.bzl", "initializeToolchainsForWorkspace")
        initializeToolchainsForWorkspace()

    Note also that this can't be called until the dependencies themselves are loaded (see deps.bzl).
    """

    # Set up the toolchains for rules_proto.
    rules_proto_dependencies()
    rules_proto_toolchains()

    # Set up the toolchains for rules_java.
    rules_java_dependencies()
    rules_java_toolchains()
