import SwiftUI

struct CitiesListView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @StateObject var viewModel: TravelViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            if viewModel.filteredCities.isEmpty && viewModel.citySearchText.isEmpty {
                ErrorView(errors: .noInternet)
            } else {
                SearchBar(searchText: $viewModel.citySearchText)
                    .padding([.leading, .trailing, .bottom])
                if viewModel.filteredCities.isEmpty {
                    Spacer()
                    Text("Город не найден")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                } else {
                    List(viewModel.filteredCities, id: \.self) { city in
                        Button {
                            viewModel.citySearchText = ""
                            viewModel.selectCity(city)
                            viewModel.navigationPath.append(2)
                        } label: {
                            HStack {
                                Text(city.name)
                                    .foregroundColor(isDarkMode ? Color.whiteYP : Color.blackYP)
                                Spacer()
                                Image(.arrowRightIcon)
                                    .foregroundColor(isDarkMode ? Color.whiteYP : Color.blackYP)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .toolbar(.hidden, for: .tabBar)
    }
}
