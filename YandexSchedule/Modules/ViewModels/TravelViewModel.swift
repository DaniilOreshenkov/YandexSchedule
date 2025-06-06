import Foundation
import SwiftUI

class TravelViewModel: ObservableObject {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    
    @Published var originCity: String = "" {
        didSet { updateSearchButtonVisibility() }
    }
    @Published var destinationCity: String = "" {
        didSet { updateSearchButtonVisibility() }
    }
    
    @Published var isSearchButtonVisible: Bool = false
    @Published var isOrigin: Bool = true
    
    @Published var navigationPath = NavigationPath()
    
    @Published var cities = R.Mock.cities
//    @Published var cities = [City]() // проверка ошибки
    
    @Published var stations: [Station] = []
    
    @Published var citySearchText = ""
    @Published var stationSearchText = ""
    
    // Выбранный город и список его станций
    @Published var selectedCity: City? = nil
    @Published var carriers = R.Mock.carriers
    
    @Published var error: ErrorModel?
    
    var filteredCities: [City] {
        if citySearchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.name.localizedCaseInsensitiveContains(citySearchText) }
        }
    }
    
    var filteredStations: [Station] {
        if stationSearchText.isEmpty {
            return stations
        } else {
            return selectedCity?.stations.filter {
                $0.name.localizedCaseInsensitiveContains(stationSearchText)
            } ?? []
        }
    }
    
    func swapCities() {
        (originCity, destinationCity) = (destinationCity, originCity)
    }
    
    func selectStation(_ station: Station, isOrigin: Bool) {
        guard let selectedCity else { return }
        let fullName = "\(selectedCity.name) (\(station.name))"
        if isOrigin {
            originCity = fullName
        } else {
            destinationCity = fullName
        }
    }
    
    func setStations(_ stations: [Station]) {
        self.stations = stations
    }
    
    func selectCity(_ city: City) {
        selectedCity = city
        stations = city.stations
    }
    
    private func updateSearchButtonVisibility() {
        isSearchButtonVisible = !originCity.isEmpty && !destinationCity.isEmpty
    }
    
//    func searchSchedules(scenario: ServerManager.MockScenario = .success) {
//        guard !originCity.isEmpty, !destinationCity.isEmpty else {
//            error = .unknown("Выберите города отправления и прибытия")
//            return
//        }
//        
//        ServerManager.shared.fetchSchedules(from: originCity, to: destinationCity, scenario: scenario) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let schedules):
//                    self?.carriers = schedules
//                    self?.error = nil
//                case .failure(let errorModel):
//                    self?.error = errorModel
//                }
//            }
//        }
//    }
}
