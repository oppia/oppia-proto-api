# oppia-proto-api
Published required API for the Oppia backend.

## Versioning
Versioning starts getting a bit complicated when considering the backend VersionedModels, the model structures themselves, schema structures, proto structures, the API, snapshots of the API, and other things. To try and keep things simple, this design intends to define a _separate_ set of versions that are specific to this API. How these map to Oppia backend's many versions is an implementation detail not actually relevant to this design.

### API version
The API itself is versioned and has separate releases. To keep things simple, it has a major & minor version (e.g. 1.0). The major version is represented directly in the directory structure (e.g. 'v1') since the repository could, in the future, house multiple major versions (which is necessary for the backend to maintain long-term backward compatibility with older API versions). The major version is only incremented if a breaking change must be introduced into the API (generally this will only come when we want to make substantial changes to the API/redesign it).

The API's minor version essentially counts the number of releases that major version has been changed. This means we increment the minor version anytime we make a compatible change to the API, and then release it. The main benefit of having distinct releases is it allows the backend & frontends to opt into taking on a particular version of the API. Due to the backward/forward interoperability nature of protobuf, it's unlikely there will ever be an incompatibility so long as structure versions are respected (see below), and even in those cases there should be potential for graceful failures. Note that the minor version is only ever represented in the release numbers and never in code form since it only serves the purpose of cataloging.

### Content versions
Content versions are meant to be the version of the entity itself corresponding to a particular structure (such as a topic, skill, or exploration). These are used to track whether there are content updates for a particular structure. These are expected to map exactly to the versions stored in the corresponding structure's VersionedModel in the backend, but how this versioning behaves is up to the backend so long as it's monotonically increasing and positive.

### Structure versions
Structure versions correspond to groups of proto structures themselves. These are unique versions to the proto structures and are **not** shared with schema structure versions in the backend. Generally, these only need to be incremented when a proto structure is updated in such a way that the default data will break existing logical assumptions (thus requiring a data migration). Proto structures should never be updated in an incompatible way (without incrementing the major version--see the API version section above), but sometimes data migrations are necessary and these versions help track when those need to occur. Unlike schema versions in the backend, these are likely to not increment as often since most proto changes can be safely ignored by older clients.

Note that one aspect of this is a bit complicated: some of the substructures are shared across high-level structures (such as SubtitledHtml, or other language-based substructures). To ensure these are properly tracked, some substructures are grouped into their own combined version to track changes. The following are the list of structure types whose versions are tracked:
- TopicSummaryStructureVersion
- RevisionCardStructureVersion
- ConceptCardStructureVersion
- ExplorationStructureVersion
- QuestionStructureVersion
- StateStructureVersion
- LanguageProtosVersion
- ImageStructureVersion

#### A note on interaction versioning
I did want to briefly note that it was discovered during the creation of this PR & structure versions that separate versioning for interactions is not actually needed since, per the strong typing of State's substructures, the structures of individual interactions & how they relate to the exploration/question experience is implied as part of State's structure version. This does not mean the backend won't need additional version tracking for interactions in order to compute compatibility with specific proto State structure versions, but it does serendipitously simplify version tracking at the sub-State level a bit.

## Support
If you have any feature requests or bug reports, please log them on our [issue tracker](https://github.com/oppia/oppia-proto-api/issues/new?title=Describe%20your%20feature%20request%20or%20bug%20report%20succinctly&body=If%20you%27d%20like%20to%20propose%20a%20feature,%20describe%20what%20you%27d%20like%20to%20see.%0A%0AIf%20you%27re%20reporting%20a%20bug,%20please%20be%20sure%20to%20include%20the%20expected%20behaviour,%20the%20observed%20behaviour,%20and%20steps%20to%20reproduce%20the%20problem.%20Console%20copy-pastes%20and%20any%20background%20on%20the%20environment%20would%20also%20be%20helpful.%0A%0AThanks!).
 
Please report security issues directly to admin@oppia.org.

## Licence
The Oppia-Proto-API code is released under the [Apache v2 license](https://github.com/oppia/oppia-proto-api/blob/master/LICENSE).
