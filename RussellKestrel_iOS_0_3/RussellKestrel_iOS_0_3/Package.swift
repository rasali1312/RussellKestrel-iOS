// swift-tools-version: 5.9
import PackageDescription
import AppleProductTypes

let package = Package(
    name: "RussellKestrel",
    platforms: [.iOS(.v16)],
    products: [
        .iOSApplication(
            name: "Russell Kestrel",
            targets: ["AppModule"],
            bundleIdentifier: "com.russell.kestrelviewer",
            teamIdentifier: "",
            displayVersion: "0.3",
            bundleVersion: "3",
            appIcon: .placeholder(icon: .camera),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [.phone, .pad],
            supportedInterfaceOrientations: [.portrait, .landscapeLeft, .landscapeRight],
            additionalInfoPlistContentFilePath: "Sources/RussellKestrel/Resources/Info.plist"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/videolan/vlckit.git", exact: "4.0.0-a22")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [.product(name: "VLCKit", package: "vlckit")],
            path: "Sources/RussellKestrel",
            exclude: ["Resources/Info.plist"],
            resources: [.process("Resources")]
        )
    ]
)
