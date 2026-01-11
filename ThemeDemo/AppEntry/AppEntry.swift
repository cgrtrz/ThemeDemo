import SwiftUI

@main
struct AppEntry: App {
    
    @State var settingsVM: SettingsViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .preferredColorScheme(settingsVM.selectedTheme.theme)
            .environment(settingsVM)
        }
    }
}
