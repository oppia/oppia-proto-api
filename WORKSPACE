"""
The top-level WORKSPACE definition for the Oppia proto API Bazel workspace.
"""

load("//repo:deps.bzl", "initializeDepsForWorkspace")

initializeDepsForWorkspace()

load("//repo:deps.bzl", "initializeGoDeps")
initializeGoDeps()

load("//repo:deps.bzl", "initializeBazelGazell")
initializeBazelGazell()

load("//repo:deps.bzl", "initializeProtobuf")
initializeProtobuf()

load("//repo:deps.bzl", "initializeBazelBuildTools")
initializeBazelBuildTools()

load("//repo:toolchains.bzl", "initializeToolchainsForWorkspace")

initializeToolchainsForWorkspace()
