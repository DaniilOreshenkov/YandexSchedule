import SwiftUI

struct StationsListView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    @StateObject var viewModel: TravelViewModel
    
    var body: some View {
        VStack {
            if viewModel.filteredStations.isEmpty && viewModel.stationSearchText.isEmpty {
                ErrorView(errors: .serverError)
            } else {
                SearchBar(searchText: $viewModel.stationSearchText)
                    .padding([.leading, .trailing, .bottom])
                
                List(viewModel.filteredStations, id: \.self) { station in
                    Button {
                        viewModel.stationSearchText = ""
                        viewModel.selectStation(station, isOrigin: viewModel.isOrigin)
                        
                        viewModel.navigationPath.removeLast(viewModel.navigationPath.count)
                    } label: {
                        HStack {
                            Text(station.name)
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
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .toolbar(.hidden, for: .tabBar)
    }
}
