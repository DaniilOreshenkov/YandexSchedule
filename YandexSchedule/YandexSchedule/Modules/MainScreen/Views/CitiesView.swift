import SwiftUI

//struct CitiesView: View {
//    @StateObject var viewModel: SearchViewModel
//    @Binding var navigationPath: NavigationPath
//    @Binding var isOrigin: Bool
//    @Environment(\.dismiss) var dismiss
//    
////    var filteredItems: [City] {
////        if viewModel.searchText.isEmpty {
////            return viewModel.cities
////        } else {
//////            return viewModel.cities.filter { city in
//////                city.title.localizedCaseInsensitiveContains(viewModel.searchText)
////            }
////        }
////    }
//    
//    var body: some View {
//        VStack{
//            SearchBar(searchText: $viewModel.searchText)
//                .padding(.leading)
//                .padding(.trailing)
//                .padding(.bottom)
//            if  viewModel.filteredItems.isEmpty {
//                Spacer()
//                Text("Город не найден")
//                    .font(.system(size: 24, weight: .bold, design: .default)) 
//                Spacer()
//            } else {
//                List(viewModel.filteredItems, id: \.self) { item in
//                    NavigationLink {
//                        StationsView(viewModel: viewModel.getCity(item), isOrigin: $isOrigin, navigationPath:  $navigationPath)
//                    } label: {
//                        HStack {
////                            Text(item.title)
//                            Spacer()
//                            Image(.arrowRightIcon)
//                                .padding(.trailing, 8)
//                        }
//                    }
//                    .padding(.trailing, -32)
//                    .listRowSeparator(.hidden)
//                }
//                .listStyle(.inset)
//            }
//        }
//        .navigationTitle("Выбор города")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: BackButton())
//    }
//}
//
//struct BackButton: View {
//    @Environment(\.dismiss) var dismiss
//    var body: some View {
//        Button {
//            dismiss()
//        } label: {
//            Image(ImageResource.arrowLeftIcon)
//        }
//    }
//}
