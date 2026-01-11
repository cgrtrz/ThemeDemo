# Theme Demo (SwiftUI)

A simple iOS demo app that demonstrates **app-wide theme management** using **SwiftUI**, **MVVM**, and **UserDefaults persistence**.

Users can switch between **System**, **Light**, and **Dark** appearance modes. The selected theme is saved and automatically applied across the app.

---

## Features

- System / Light / Dark theme selection
- App-wide appearance handling via `preferredColorScheme`
- Persistent theme storage with `UserDefaults`
- Clean MVVM architecture
- Live preview on the Home screen
- Fully system-driven colors and materials (no custom color overrides)

---

## Architecture

The project follows a clean **MVVM-based folder structure** aligned with SwiftUI best practices:

```
ThemeDemo
 └─ ThemeDemo
    ├─ AppEntry
    │  └─ AppEntry.swift
    ├─ Models
    │  └─ ThemeModel.swift
    ├─ Storage
    │  └─ ThemeStore.swift
    ├─ ViewModels
    │  └─ SettingsViewModel.swift
    ├─ Views
    │  ├─ HomeView.swift
    │  └─ SettingsView.swift
    └─ Resources
       └─ Assets.xcassets
```

### Layer Responsibilities

- **AppEntry**: Application entry point and root configuration
- **Models**: Domain models (e.g. theme representation)
- **Storage**: Persistence layer (`UserDefaults` abstraction)
- **ViewModels**: Business logic and state management
- **Views**: SwiftUI views (UI only)
- **Resources**: Assets and app resources

This structure ensures clear separation of concerns, maintainability, and scalability.

---

## Theme Management

### Theme Model

Themes are represented using a type-safe enum:

```swift
enum ThemeModel: String, CaseIterable {
    case system
    case light
    case dark
}
```

### Applying the Theme

The selected theme is applied at the **app root** using:

```swift
.preferredColorScheme(...)
```

| Selected Theme | Applied Value |
| --- | --- |
| System | `nil` (follows device settings) |
| Light | `.light` |
| Dark | `.dark` |

When **System** is selected, the app automatically adapts to device appearance changes.

---

## Home Screen Preview

The Home screen includes a lightweight preview area that visually reflects the current theme:

- System materials (`.thinMaterial`, `.regularMaterial`)
- Accent color behavior
- Buttons, progress views, and cards adapting instantly

When **System** is selected, the UI displays the active appearance:

```
System (Light)
System (Dark)
```

This makes theme behavior clear without adding visual clutter.

---

## UserDefaults Persistence

Theme persistence is handled via a dedicated storage layer:

```swift
protocol ThemeStoring {
    func loadTheme() -> ThemeModel
    func saveTheme(_ theme: ThemeModel)
}
```

The `ThemeStore` implementation:

- Centralizes all `UserDefaults` access
- Provides safe fallback values
- Keeps ViewModels free from storage details

---

## Navigation

- Uses `NavigationStack`
- Navigation is defined at the app root level
- Avoids nested navigation to prevent animation issues
- Compatible with system appearance changes

---

## Design Principles

- No hardcoded colors
- Uses system colors and materials only
- Respects system Light/Dark behavior
- Minimal UI with clear feedback
- Optimized for clarity and maintainability

---

## Screenshots

<p align="center">
  <img src="Screenshots/home_light.png" width="260" />
  <img src="Screenshots/home_dark.png" width="260" />
  <img src="Screenshots/settings.png" width="260" />
</p>

---

## Demo Video

[https://github.com/USERNAME/ThemeDemo/assets/XXXXXXXX/theme-demo.mp4](https://private-user-images.githubusercontent.com/150048476/534389317-a272aea6-b978-4680-9b02-3bd530719c7b.mov?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjgxNjI4OTUsIm5iZiI6MTc2ODE2MjU5NSwicGF0aCI6Ii8xNTAwNDg0NzYvNTM0Mzg5MzE3LWEyNzJhZWE2LWI5NzgtNDY4MC05YjAyLTNiZDUzMDcxOWM3Yi5tb3Y_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwMTExJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDExMVQyMDE2MzVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1iZDQ0MThjMDNkNmE1Nzc3YTE1ZjVhOGYwMDdlYWY3Mzk4MDFkNWVkN2E5NmVjNjgxMTM2NThlZWM1OTkwMTIwJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.yKSbWgze0FOX61FjToy-GvRPYTkUxVi0J7XSqpvmNxY)

---

## Requirements

- iOS 17+
- SwiftUI
- Xcode 15+

---

## License

This project is intended for learning and portfolio demonstration purposes.

