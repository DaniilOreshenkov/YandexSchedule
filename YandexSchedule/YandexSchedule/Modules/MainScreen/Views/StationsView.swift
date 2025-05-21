import SwiftUI
import OpenAPIURLSession

struct StationsView: View {
    @State private var data: [Components.Schemas.Station] = []
    @StateObject var viewModel: SearchViewModel
    @State private var stations: [Station] = []
    @State private var isLoading = true
    @State private var searchText = ""
    @Binding var isOrigin: Bool
    @Environment(\.dismiss) var dismiss
    @Binding var navigationPath: NavigationPath
    
    var filteredStations: [Station] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { station in
                station.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
            VStack {
                if isLoading {
                    ProgressView("Загрузка станций...")
                } else {
                    SearchBar(searchText: $viewModel.searchText)
                        .padding(.leading)
                        .padding(.trailing)
                        .padding(.bottom)
                    List(filteredStations, id: \.self){ station in
                        Button(action: {
                           
                            switch isOrigin {
                            case true:
                                viewModel.originCity = station
                            case false:
                                viewModel.destinationCity = station
                            }
                            navigationPath.removeLast(navigationPath.count)
                        }) {
                            HStack {
                                Text(station.titlePopular)
                                Spacer()
                                Image(.arrowRightIcon)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Выбор станции")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .onAppear {
                Getstations() // Загружаем станции при появлении экрана
            }
            
        }
        
        
        //        List(viewModel.cities, id: \.self) { item in
        ////            if item.station_type_name == "вокзал" && ((item.popular_title?.isEmpty) != nil) {
        ////                Text("\(String(describing: item.popular_title ?? ""))")
        ////                    .onTapGesture{
        ////                        switch selectionType {
        ////                        case .originCity:
        ////                            viewModel.originCity = item.title ?? ""
        ////                        case .destinationCity:
        ////                            viewModel.destinationCity = item.title ?? ""
        ////                        }
        ////                        viewModel.isShowingOriginSearch = false
        ////                        print(viewModel.nameCityOne)
        ////                    }
        ////            }
        //        }
        //        .onAppear {
        //            //                stations()
        //        }
        //        .navigationBarTitleDisplayMode(.inline)
}
extension StationsView {
    func Getstations() {
        var serverURL: URL?
        
        do {
            serverURL = try Servers.Server1.url()
        } catch {
            print("Error getting server URL: \(error)")
        }
        
        guard let serverURL = serverURL else {
            print("Failed to get server URL, even after catch.")
            return
        }
        
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = YRSServer(
            client: client,
            apikey: "53e0755f-99cf-4e1f-a2ca-e7de92c611f0"
        )
        //        Task {
        //                        let nearestStations = try await service.getNearestStations(
        //                            lat: viewModel.city.lat,
        //                            lng: viewModel.city.lng,
        //                            distance: 50
        //                        )
        //
        //                        guard let stations = nearestStations.stations else {
        //                            return
        //                        }
        //                                self.data = stations
        //        }
        Task {
            do {
                let nearestStations = try await service.getNearestStations(
                    lat: viewModel.city.lat,
                    lng: viewModel.city.lng,
                    distance: 50
                )
                
                guard let stationsData = nearestStations.stations else {
                    print("No stations found")
                    isLoading = false // Остановка загрузки, даже если станций нет
                    return
                }
                
                // Преобразование данных Components.Schemas.Station в City (предполагаем, что у вас есть способ преобразования)
                for station in stationsData {
                    if station.station_type_name == "вокзал" && ((station.popular_title?.isEmpty) != nil) {
                        // TODO: Замените на фактическое преобразование, если оно необходимо
                        self.stations.append(Station(code: station.code ?? "", title: station.title ?? "", titlePopular: station.popular_title ?? ""))
                    }
                }
                
                self.data = stationsData
                isLoading = false // Остановка загрузки после успешного получения данных
            } catch {
                print("Error fetching stations: \(error)")
                isLoading = false // Остановка загрузки при ошибке
            }
        }
        
    }
}


