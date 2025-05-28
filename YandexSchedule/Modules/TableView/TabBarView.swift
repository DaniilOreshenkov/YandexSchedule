import SwiftUI

struct TabBarView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @State private var isTabBarHidden = false
    @State private var selectedTabIndex = 0
    
    var body: some View {
        ZStack {
            if selectedTabIndex == 0 {
                FromToInView(isTabBarHidden: $isTabBarHidden)
                    .transition(.move(edge: .leading))
            } else {
                SettingView(isTabBarHidden: $isTabBarHidden)
                    .transition(.move(edge: .trailing))
            }
            
            if !isTabBarHidden {
                VStack {
                    Spacer()
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                    HStack {
                        TabBarButton(
                            icon: .mainIcon,
                            isSelected: selectedTabIndex == 0
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTabIndex = 0
                                isTabBarHidden = false
                            }
                        }
                        TabBarButton(
                            icon: .settingsIcon,
                            isSelected: selectedTabIndex == 1
                        ) {
                            withAnimation(.easeInOut) {
                                selectedTabIndex = 1
                                isTabBarHidden = false
                            }
                        }
                    }
                    .frame(height: 60)
                    .padding(.vertical, 8)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    TabBarView()
}


