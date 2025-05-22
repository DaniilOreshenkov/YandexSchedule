import SwiftUI

struct TabBarView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(R.IconYP.main)
                        .renderingMode(.template)
                }
            SettingView()
                .tabItem {
                    Image(R.IconYP.settings)
                        .renderingMode(.template)
                }
        }
        .accentColor(isDarkMode ? Color.whiteYP : Color.blackYP)
        .overlay(
            Divider()
                .offset(y: -49), alignment: .bottom
        )
    }
}

#Preview {
    TabBarView()
}
