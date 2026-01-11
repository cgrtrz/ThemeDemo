import SwiftUI

struct SettingsView: View {
    
    @Environment(SettingsViewModel.self) var vm: SettingsViewModel
    
    var body: some View {
        List {
            Section(header: Text("Theme")) {
                ForEach(ThemeModel.allCases) { theme in
                    HStack {
                        Text(theme.name.capitalized)
                        
                        Spacer()
                        
                        if vm.selectedTheme == theme {
                            Image(systemName: "checkmark")
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        vm.changeTheme(to: theme)
                    }
                }
            }
        }
        .navigationTitle("Settings")
        
    }
}

#Preview {
    NavigationStack {
        SettingsView()
            .environment(SettingsViewModel())
    }
}
