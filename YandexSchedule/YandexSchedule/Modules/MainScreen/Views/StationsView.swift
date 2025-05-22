import SwiftUI
import OpenAPIURLSession

//struct StationsView: View {
//    @State private var data: [Components.Schemas.Station] = []
//    @StateObject var viewModel: SearchViewModel
//    @State private var stations: [Station] = []
//    @State private var isLoading = true
//    @State private var searchText = ""
//    @Binding var isOrigin: Bool
//    @Environment(\.dismiss) var dismiss
//    @Binding var navigationPath: NavigationPath
//    
////    var filteredStations: [Station] {
////        if searchText.isEmpty {
////            return stations
////        } else {
////            return stations.filter { station in
////                station.title.localizedCaseInsensitiveContains(searchText)
////            }
////        }
////    }
//    
//    var body: some View {
//            VStack {
//                if isLoading {
//                    ProgressView("Загрузка станций...")
//                } else {
//                    SearchBar(searchText: $viewModel.searchText)
//                        .padding(.leading)
//                        .padding(.trailing)
//                        .padding(.bottom)
//                    List(stations, id: \.self){ station in
//                        Button(action: {
//                            navigationPath.removeLast(navigationPath.count)
//                        }) {
//                            HStack {
////                                Text(station.titlePopular)
////                                Spacer()
////                                Image(.arrowRightIcon)
//                            }
//                        }
//                    }
//                    .listStyle(PlainListStyle())
//                }
//            }
//            .navigationTitle("Выбор станции")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: BackButton())
//        }
//        
//        
//        //        List(viewModel.cities, id: \.self) { item in
//        ////            if item.station_type_name == "вокзал" && ((item.popular_title?.isEmpty) != nil) {
//        ////                Text("\(String(describing: item.popular_title ?? ""))")
//        ////                    .onTapGesture{
//        ////                        switch selectionType {
//        ////                        case .originCity:
//        ////                            viewModel.originCity = item.title ?? ""
//        ////                        case .destinationCity:
//        ////                            viewModel.destinationCity = item.title ?? ""
//        ////                        }
//        ////                        viewModel.isShowingOriginSearch = false
//        ////                        print(viewModel.nameCityOne)
//        ////                    }
//        ////            }
//        //        }
//        //        .onAppear {
//        //            //                stations()
//        //        }
//        //        .navigationBarTitleDisplayMode(.inline)
//}
//
//
