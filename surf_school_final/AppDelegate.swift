import SwiftUI





final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        setUpCustomNavBarAppearance()
        
        return true
    }
}

// MARK: - UI setUp

extension AppDelegate {
    private func setUpCustomNavBarAppearance() {
        let backgroundColor = UIColor(Color.black)
        let titleColor = UIColor.white

        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor, .font: UIFont(name: "IBMPlexSans-Bold", size: 24)!]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor, .font: UIFont(name: "IBMPlexSans-Bold", size: 24)!]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

}
