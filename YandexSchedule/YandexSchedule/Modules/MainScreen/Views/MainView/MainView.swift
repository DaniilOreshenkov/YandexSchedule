import SwiftUI
import OpenAPIURLSession
//
//struct MainView: View {
//    @State private var navigationPath = NavigationPath()
//    @State private var isOrigin: Bool = true
//    @State private var isNoOrigin: Bool = false
//    @StateObject var viewModel = SearchViewModel()
//    
//    var body: some View {
//        NavigationStack(path: $navigationPath) {
//            VStack {
//                HStack(spacing: 16) {
//                    VStack(spacing: 0) {
//                        NavigationLink(value: 1) {
//                            CitySelectionView(
//                                city: viewModel.originCity.title,
//                                placeholder: "Откуда",
//                                viewModel: viewModel
//                            )
//                        }
//                        
//                        NavigationLink(value: 2) {
//                            CitySelectionView(
//                                city: viewModel.destinationCity.title,
//                                placeholder: "Куда",
//                                viewModel: viewModel
//                            )
//                        }
//                        
//                    }
//                    .background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .navigationDestination(for: Int.self) { tag in
//                        switch tag {
//                        case 1:
//                            CitiesView(viewModel: viewModel, navigationPath: $navigationPath, isOrigin: $isOrigin)
//                        case 2:
//                            CitiesView(viewModel: viewModel, navigationPath: $navigationPath, isOrigin: $isNoOrigin)
//                        case 3:
//                            SchedulesView()
//                        default:
//                            Text("Неизвестный экран")
//                        }
//                    }
//                    
//                    swapCitiesButton
//                }
//                .padding()
//                .background(Color(R.ColorYP.blue))
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .padding()
//            }
//        }
//        
//        if viewModel.isSearchButtonVisible {
//            Button(action: {
//                viewModel.navigationPath.append(3)
//                getSchedles()
//            }) {
//                Text("Найти")
//                    .padding()
//                    .background(Color.green)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//    }
//}
//
//private extension MainView {
//    var swapCitiesButton: some View {
//        Button(action: {
//            viewModel.swapCitiesButton()
//        }, label: {
//            ZStack {
//                Circle()
//                    .foregroundColor(Color(R.ColorYP.white))
//                Image(systemName: "arrow.2.squarepath")
//            }
//        })
//        .frame(width: 36, height: 36)
//    }
//    
//    func getSchedles() {
//        var serverURL: URL?
//        
//        do {
//            serverURL = try Servers.Server1.url()
//        } catch {
//            print("Error getting server URL: \(error)")
//        }
//        
//        guard let serverURL = serverURL else {
//            print("Failed to get server URL, even after catch.")
//            return
//        }
//        
//        
//        let client = Client(
//            serverURL: serverURL,
//            transport: URLSessionTransport()
//        )
//        
//        let service = YRSServer(
//            client: client,
//            apikey: "53e0755f-99cf-4e1f-a2ca-e7de92c611f0"
//        )
//        //        Task {
//        //                        let nearestStations = try await service.getNearestStations(
//        //                            lat: viewModel.city.lat,
//        //                            lng: viewModel.city.lng,
//        //                            distance: 50
//        //                        )
//        //
//        //                        guard let stations = nearestStations.stations else {
//        //                            return
//        //                        }
//        //                                self.data = stations
//        //        }
//        Task {
//            let one = try await service.getFlightSchedules(from: viewModel.originCity.code, to: viewModel.destinationCity.code)
//            let two = try await service.getThread(uid: "SU-1827A_c26_agent")
//            print(two)
//        }
//    }
//}

//
//#Preview {
//    MainView()
//}
