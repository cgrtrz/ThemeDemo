import SwiftUI

enum ThemeModel: String, Identifiable, CaseIterable {
    case light
    case dark
    case system
    
    var id: String { name }
    
    var name: String {
        switch self {
        case .light: return "light"
        case .dark: return "dark"
        case .system: return "system"
        }
    }
    
    var theme: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .system: return nil
        }
    }
}


