import Foundation

// MARK: - Yandex Rasp API Protocol

protocol YRSServerProtocol {
    // MARK: - Поиск маршрутов
    func getFlightSchedules(from: String, to: String) async throws -> FlightSchedules
    func getScheduleByRoute(station: String) async throws -> Schedule
    
    // MARK: - Ближайшие объекты
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestCity

    // MARK: - Инфо по маршруту и перевозчику
    func getThread(uid: String) async throws -> Thread
    func getCarrier(code: String) async throws -> Carrier

    // MARK: - Прочее
    func getStationsList() async throws -> StationsList
    func getCopyright() async throws -> Copyright
}
