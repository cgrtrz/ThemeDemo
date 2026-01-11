import SwiftUI

@Observable
final class SettingsViewModel {
    var selectedTheme: ThemeModel

    private let storage: ThemeStoring

    init(storage: ThemeStoring = ThemeStore()) {
        self.storage = storage
        self.selectedTheme = storage.loadTheme()
    }

    func changeTheme(to newTheme: ThemeModel) {
        guard selectedTheme != newTheme else { return }
        selectedTheme = newTheme
        storage.saveTheme(newTheme)
    }
}
