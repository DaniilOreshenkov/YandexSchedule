import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(R.IconYP.main)
                        .renderingMode(.template)
                }
            SettingsScreen()
                .tabItem {
                    Image(R.IconYP.settings)
                        .renderingMode(.template)
                }
        }
        .accentColor(Color(R.ColorYP.blackDynamic))
        .overlay(
            Divider()
                .offset(y: -49), alignment: .bottom
        )
    }
}

#Preview {
    TabBarView()
}
