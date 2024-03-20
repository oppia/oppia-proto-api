"""
Defines Starlark macros that are used to import the dependencies needed to build the Oppia proto API
project (such as for cases when another Bazel workspace depends on this project). See the importing
instructions in the README for more details.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//repo:versions.bzl", "MAVEN_DEPENDENCY_VERSIONS")

def _setUpHttpArchiveDependency(name):
    metadata = MAVEN_DEPENDENCY_VERSIONS[name]
    sha = metadata["sha"]
    strip_prefix = metadata.get("strip_prefix")
    url = metadata["url"]
    version = metadata["version"]

    formatted_strip_prefix = strip_prefix.format(version) if not (strip_prefix == None) else None

    http_archive(
        name = name,
        urls = [url.format(version)],
        sha256 = sha,
        strip_prefix = formatted_strip_prefix,
    )

def initializeDepsForWorkspace():
    """
    Loads the dependencies needed to be able to build the Oppia proto API project.

    Note that this must be called after loading in this deps file, for example:

        load("//repo:deps.bzl", "initializeDepsForWorkspace")
        initializeDepsForWorkspace()

    Note also that toolchains may need to be set up after loading this dependencies (see
    toolchains.bzl).
    """

    # Set up all dependencies (the order doesn't matter here since it's just downloading corresponding
    # HTTP archives).
    for dependency_name in MAVEN_DEPENDENCY_VERSIONS.keys():
        _setUpHttpArchiveDependency(name = dependency_name)
