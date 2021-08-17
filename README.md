# oppia-proto-api
Published common proto API for the Oppia server/client.

This API governs the transfer of data between the Oppia Python server and the Android app. 

### API Versions
Each version of this API is formatted as a major & minor version (e.g. 1.0) and corresponds to a separate release.

- The major version is represented directly in the directory structure (e.g. 'v1'), and is only incremented if a breaking change must be introduced into the API. (Note that this repository might house multiple major versions, in order to maintain long-term backward compatibility with older API versions.)
- The minor version is incremented whenever a compatible change to the API is released. It is only ever represented in the release numbers, and never in code form.

Because protobuf is backward/forward interoperable, incompatibilities are unlikely as long as proto versions are respected (though, even in those cases, there should be potential for graceful failures). 

### Content Versions
Content versions represent the version of the corresponding entity instance (e.g. a topic, skill, or exploration). These are used to track whether a particular structure has content updates. They map to the versions stored in the corresponding structure's VersionedModel in the backend.

### Proto Versions
Proto versions correspond to the proto structures defined in this repository. They only need to be incremented when a proto structure is updated in such a way that the default data will break existing logical assumptions (thus requiring a data migration). Such upgrades should always happen in a compatible way (except for major API version upgrades -- see the "API Version" section above).

Two notes:

1. Some proto versions correspond to **groups** of substructures (such as SubtitledHtml, or other language-based substructures), because these substructures are shared across high-level structures.
2. There is no need to version interactions separately. This is because their structure and how they relate to the exploration/question experience is implied as part of State's structure version.

The following are the list of structure types whose versions are tracked:
- TopicSummaryProtoVersion
- RevisionCardProtoVersion
- ConceptCardProtoVersion
- ExplorationProtoVersion
- QuestionProtoVersion
- StateProtoVersion
- LanguageProtosVersion
- ImageProtoVersion

## Support
If you have any feature requests or bug reports, please log them on our [issue tracker](https://github.com/oppia/oppia-proto-api/issues/new?title=Describe%20your%20feature%20request%20or%20bug%20report%20succinctly&body=If%20you%27d%20like%20to%20propose%20a%20feature,%20describe%20what%20you%27d%20like%20to%20see.%0A%0AIf%20you%27re%20reporting%20a%20bug,%20please%20be%20sure%20to%20include%20the%20expected%20behaviour,%20the%20observed%20behaviour,%20and%20steps%20to%20reproduce%20the%20problem.%20Console%20copy-pastes%20and%20any%20background%20on%20the%20environment%20would%20also%20be%20helpful.%0A%0AThanks!).
 
Please report security issues directly to admin@oppia.org.

## Licence
The Oppia-Proto-API code is released under the [Apache v2 license](https://github.com/oppia/oppia-proto-api/blob/master/LICENSE).
