import Foundation
import SwiftUI
import SwiftUICore
import OpenAPIURLSession

enum SelectionType {
    case originCity
    case destinationCity
}

enum CityType {
    case origin // "Откуда"
    case destination // "Куда"
}

class SearchViewModel: ObservableObject {
    
    @Published var originCity: Station = Station(code: "", title: "", titlePopular: "") {
        didSet {
            updateSearchButtonVisibility()
        }
    }
    
    @Published var destinationCity: Station = Station(code: "", title: "", titlePopular: "") {
        didSet {
            updateSearchButtonVisibility()
        }
    }
    
    @Published var city = City(title: "", lat: 0, lng: 0) 
    
    @Published var isSearchButtonVisible: Bool = false
    
    //Navigation
    
    @Published var navigationPath = NavigationPath()
    @Published var selectionType: SelectionType?
    var selectedCityType: CityType? = nil
    //
    @Published var cities: [City]
//    @Published var showCities: Bool = false
//    @Published var data: [Components.Schemas.Station] = []
//    @Published var server = ServerManager.shared
    
    @Published var isOriginStationSelected = true
    @Published var nameCityOne = "Откуда"
    @Published var searchText = ""
    
    var filteredItems: [City] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { city in
                city.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    init(cities: [City]) {
        self.cities = cities
    }
    
    func swapCitiesButton() {
        let temp = originCity
        originCity = destinationCity
        destinationCity = temp
    }
    
    func getCity(_ item: City) -> SearchViewModel {
        city = item
        return self
    }
    
    private func updateSearchButtonVisibility() {
        isSearchButtonVisible = !originCity.code.isEmpty && !destinationCity.code.isEmpty
    }
}
