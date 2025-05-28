import SwiftUI

struct CarrierInfoView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Image(.RZHD_1)
                .padding()
            
            Text("ОАО \u{00AB}РЖД\u{00BB}")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackDynamic)
            VStack(alignment: .leading) {
                Text("E-mail:")
                    .foregroundColor(.blackDynamic)
                Text("info@rzhd.ru")
                    .foregroundColor(.blueYP)
            }
            VStack(alignment: .leading) {
                Text("Телефон:")
                    .foregroundColor(.blackDynamic)
                Text("+7 (495) 123-45-67")
                    .foregroundColor(.blueYP)
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Информация о перевозчике")
        .navigationBarItems(leading: BackButton())
        Spacer()
    }
}

#Preview {
    CarrierInfoView()
}
