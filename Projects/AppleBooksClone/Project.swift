import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project(
    name: "AppleBooksClone",
    organizationName: "com.kyhyeon",
    targets: Project.appTargets(
        name: "AppleBooksClone",
        platform: .iOS,
        dependencies: [.project(target: "BookStore", path: .relativeToRoot("Projects/BookStore"))]
    )
)
