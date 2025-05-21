import SwiftUI

struct CitySelectionView: View {
    let city: String
    let placeholder: String
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        HStack {
            Text(city.isEmpty ? placeholder : city)
                .foregroundColor(city.isEmpty ? .gray : .black)
                .font(.system(size: 17))
                .padding()
            Spacer()
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

