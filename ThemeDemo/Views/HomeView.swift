import SwiftUI

struct HomeView: View {
    @Environment(SettingsViewModel.self) private var settingsVM
    @Environment(\.colorScheme) private var colorScheme

    private var isSystem: Bool {
        settingsVM.selectedTheme.name.lowercased() == "system"
    }

    private var themeDisplayName: String {
        let base = settingsVM.selectedTheme.name.capitalized
        guard isSystem else { return base }
        let current = (colorScheme == .dark) ? "Dark" : "Light"
        return "\(base) (\(current))"
    }

    var body: some View {
        VStack(spacing: 16) {

            header

            previewCard
                .tint(.accentColor)

            sampleRowCard

            Spacer(minLength: 8)

            NavigationLink {
                SettingsView()
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
        }
        .navigationTitle("Home")
        .padding()
    }

    // MARK: - UI

    private var header: some View {
        VStack(spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text("Current Theme:")
                    .font(.title3).bold()

                Spacer()

                Text(themeDisplayName)
                    .font(.title3).fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var previewCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: "paintpalette.fill")
                    .font(.title3.weight(.semibold))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.accentColor)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Live Preview")
                        .font(.headline)
                    Text("Materials and tint follow the app theme.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            Divider().opacity(0.5)

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Controls")
                        .font(.subheadline.weight(.semibold))

                    ProgressView(value: 0.72)
                        .tint(.accentColor)

                    Text("No custom colors — system adapts automatically.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer(minLength: 12)

                Button {
                    // demo action
                } label: {
                    Text("Preview")
                        .frame(minWidth: 88)
                }
                .buttonStyle(.bordered)
                .tint(.accentColor)
            }
        }
        .padding(14)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(.primary.opacity(0.12), lineWidth: 1)
        )
    }

    private var sampleRowCard: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.accentColor.opacity(0.15))
                Image(systemName: "moon.stars.fill")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.accentColor)
            }
            .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 2) {
                Text("Appearance")
                    .font(.subheadline.weight(.semibold))
                Text("Follows your selection")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(themeDisplayName)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
#Preview {
    HomeView()
        .environment(SettingsViewModel())
}
