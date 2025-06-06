import SwiftUI
import WebKit

struct UserAgreementView: View {
    @Binding var isTabBarHidden: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        HStack {
                   Button(action: {
                       dismiss()
                       isTabBarHidden = false
                   }) {
                       Image(systemName: "chevron.left")
                           .foregroundColor(.blackYP)
                           .font(.system(size: 20, weight: .regular))
                   }
                   Spacer()
                   Text("Пользовательское соглашение")
                       .font(.headline)
                       .padding(.bottom, 5)
                   Spacer()
               }
               .navigationBarBackButtonHidden(true)
               .padding(.horizontal, 10)
               
               NavigationView {
                   WebView(url: URL(string: YPUserAgreement.YPUAUrl.stringValue)!)
               }
//        NavigationStack {
//            WebView(url: URL(string: YPUserAgreement.YPUAUrl.stringValue)!)
//                .navigationTitle("Пользовательское соглашение")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: BackButton())
//        }
    }
}
#Preview {
    UserAgreementView(isTabBarHidden:.constant(true))
}


