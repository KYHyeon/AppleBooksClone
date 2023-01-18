import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project(
    name: "App",
    organizationName: "com.kyhyeon",
    targets: Project.appTargets(
        name: "App",
        platform: .iOS,
        dependencies: [.project(target: "BookStore", path: .relativeToRoot("Projects/BookStore"))]
    )
)
