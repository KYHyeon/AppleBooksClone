import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project(
    name: "BookStore",
    organizationName: "com.kyhyeon",
    targets: Project.frameworkWithDemoTarget(
        name: "BookStore",
        platform: .iOS
    )
)
