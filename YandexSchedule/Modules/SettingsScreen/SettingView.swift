import SwiftUI

struct SettingView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @Binding var isTabBarHidden: Bool
    @State private var isUserAgreementActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 32) {
                    Toggle("Темная тема", isOn: $isDarkMode)
                        .tint(Color.blueYP)
                    HStack {
                        Button {
                            isTabBarHidden = true
                            isUserAgreementActive = true
                        } label: {
                            HStack {
                                Text("Пользовательское соглашение")
                                Spacer()
                                Image(.arrowRightIcon)
                            }
                            .foregroundColor(isDarkMode ? .whiteYP : .blackYP)
                        }
                        .navigationDestination(isPresented: $isUserAgreementActive){
                            UserAgreementView(isTabBarHidden: $isTabBarHidden)
                        }
                    }
                }
                .padding()
                Spacer()
                VStack(spacing: 12) {
                    Text("Приложение использует API «Яндекс.Расписания»")
                    Text("Версия 1.0 (beta)")
                }
                .font(.system(size: 12))
                .padding(.bottom, 58)
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


#Preview {
    SettingView(isTabBarHidden: .constant(false))
}
