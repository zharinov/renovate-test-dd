// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "users",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.3.0"),
        .package(url: "https://github.com/vapor/fluent-mysql.git", from: "3.0.1"),
        .package(url: "https://github.com/vapor/jwt.git", from: "3.0.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor-community/sendgrid-provider.git", from: "3.0.6"),
        .package(url: "https://github.com/vapor-community/lingo-vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/skelpo/JWTDataProvider.git", from: "1.0.0"),
        .package(url: "https://github.com/skelpo/JWTVapor.git", from: "0.13.0"),
        .package(url: "https://github.com/skelpo/SkelpoMiddleware.git", from: "1.4.0"),

                .package(url: "https://github.com/0x7fs/CountedSet", .branch("master")),
        .package(url: "https://github.com/avito-tech/GraphiteClient.git", .exact(   "0.1.0"   )),
        .package(url: "https://github.com/IBM-Swift/BlueSignals.git", .exact("1.0.16")),
        .package(url: "https://github.com/beefon/Shout", .branch("UpdateSocket")),
        .package(url: "https://github.com/daltoniam/Starscream.git", .exact("3.0.6")),
        .package(url: "https://github.com/httpswift/swifter.git", .exact("1.4.6")),
        . package ( url : "https://github.com/weichsel/ZIPFoundation/" ,
        /*foobar*/ from : "0.9.6")
        .package(url: "https://github.com/apple/swift-package-manager.git", .branch("swift-5.0-branch")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FluentMySQL", "JWT", "CryptoSwift", "SendGrid", "LingoVapor", "JWTDataProvider", "JWTVapor", "SkelpoMiddleware"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                    ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
