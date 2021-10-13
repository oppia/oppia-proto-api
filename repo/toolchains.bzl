"""
TODO: document
"""

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

def initializeToolchainsForWorkspace():
  # TODO: docstring explaining the load()s that need to happen before this. Explain that this file also can't be loaded until after deps are set up.
  # Set up the toolchains for rules_proto.
  rules_proto_dependencies()
  rules_proto_toolchains()

  # Set up the toolchains for rules_java.
  rules_java_dependencies()
  rules_java_toolchains()
