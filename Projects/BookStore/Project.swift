import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project(
    name: "BookStore",
    organizationName: "com.kyhyeon",
    targets: Project.frameworkTargets(
        name: "BookStore",
        platform: .iOS
    )
)
