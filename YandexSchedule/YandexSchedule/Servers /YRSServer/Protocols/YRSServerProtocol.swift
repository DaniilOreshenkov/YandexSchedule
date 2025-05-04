import Foundation

protocol YRSServerProtocol {
    func getFlightSchedules(from: String, to: String) async throws -> FlightSchedules
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getThread(uid: String) async throws -> Thread
    func getScheduleByRoute(station: String) async throws -> Schedule
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestCity
    func getCarrier(code: String) async throws -> Carrier
    func getStationsList() async throws -> StationsList
    func getCopyright() async throws -> Copyright
}
