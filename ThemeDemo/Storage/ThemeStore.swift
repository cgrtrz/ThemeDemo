import Foundation

protocol ThemeStoring {
    func loadTheme() -> ThemeModel
    func saveTheme(_ theme: ThemeModel)
}

final class ThemeStore: ThemeStoring {
    private let defaults: UserDefaults
    private let key = "app_theme"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func loadTheme() -> ThemeModel {
        let raw = defaults.string(forKey: key)
        return ThemeModel(rawValue: raw ?? "") ?? .system
    }

    func saveTheme(_ theme: ThemeModel) {
        defaults.set(theme.rawValue, forKey: key)
    }
}
