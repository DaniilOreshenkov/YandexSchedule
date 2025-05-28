import SwiftUI

struct FromToInView: View {
    @StateObject private var viewModel = TravelViewModel()
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                HStack(spacing: 16) {
                    VStack(spacing: 0) {
                        Button {
                            isTabBarHidden = true
                            viewModel.isOrigin = true
                            viewModel.navigationPath.append(1)
                        } label: {
                            CitySelectionView(
                                city: viewModel.originCity,
                                placeholder: "Откуда",
                                viewModel: viewModel
                            )
                        }
                        
                        Button {
                            isTabBarHidden = true
                            viewModel.isOrigin = false
                            viewModel.navigationPath.append(1)
                        } label: {
                            CitySelectionView(
                                city: viewModel.destinationCity,
                                placeholder: "Куда",
                                viewModel: viewModel
                            )
                        }
                    }
                    .background(.whiteYP)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .navigationDestination(for: Int.self) { tag in
                        switch tag {
                        case 1:
                            CitiesListView(viewModel: viewModel)
                        case 2:
                            StationsListView(
                                viewModel: viewModel)
                        case 3:
                            ScheduleListView(
                                viewModel: viewModel,
                                isTabBarHidden: $isTabBarHidden,
                                from: viewModel.originCity,
                                to: viewModel.destinationCity
                            )
                        case 4:
                            CarrierInfoView()
                        case 5:
                            FilterView()
                        default:
                            Text("Неизвестный экран")
                        }
                    }
                    
                    swapCitiesButton
                }
                .padding()
                .background(Color.blueYP)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            
            if viewModel.isSearchButtonVisible {
                Button(action: {
                    viewModel.navigationPath.append(3)
                    isTabBarHidden = true
                }) {
                    Text("Найти")
                        .font(.system(size: 17, weight: .bold))
                        .background(Color.blueYP)
                        .foregroundColor(Color.whiteYP)
                        .frame(width: 150, height: 60)
                }
                .background(Color.blueYP)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .onChange(of: viewModel.navigationPath) { oldValue, newValue in
            if newValue.count == 0 {
                isTabBarHidden = false
            }
        }
    }
}

private extension FromToInView {
    var swapCitiesButton: some View {
        Button(action: {
            viewModel.swapCities()
        }, label: {
            ZStack {
                Circle()
                    .foregroundColor(Color.whiteYP)
                Image(systemName: "arrow.2.squarepath")
                    .foregroundStyle(.blueYP)
            }
        })
        .frame(width: 36, height: 36)
    }
}

#Preview {
    FromToInView(isTabBarHidden: .constant(true))
}
