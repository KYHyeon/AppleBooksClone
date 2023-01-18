import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    public static func appTargets(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.kyhyeon.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies
        )
        let testTarget = testTarget(name: name, platform: platform, dependencies: [])
        return [mainTarget, testTarget]
    }
    
    public static func frameworkWithDemoTarget(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> [Target] {
        let frameworkTarget = frameworkTargets(name: name, platform: platform)
        let appTarget = appTargets(name: "\(name)Demo", platform: platform, dependencies: [.target(name: name)] + dependencies)
        return [frameworkTarget] + appTarget
    }
    
    private static func frameworkTargets(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> Target {
        let frameworkTarget = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "com.kyhyeon.\(name)",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            dependencies: dependencies
        )
        return frameworkTarget
    }
    
    private static func testTarget(name: String, platform: Platform, dependencies: [TargetDependency]) -> Target {
        return Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.kyhyeon.\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)] + dependencies
        )
    }
}
