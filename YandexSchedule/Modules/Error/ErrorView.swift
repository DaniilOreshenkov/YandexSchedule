import SwiftUI

struct ErrorView: View {
    private var errors: ErrorModel
    
    init(errors: ErrorModel) {
        self.errors = errors
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(errors.image)
                .resizable()
                .frame(width: 223, height: 223)
                .clipShape(RoundedRectangle(cornerRadius: 70))
            Text(errors.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackDynamic)
            Spacer()
        }
    }
}

#Preview {
    ErrorView(errors: ErrorModel.noInternet)
}
