import OpenAPIRuntime
import OpenAPIURLSession

final class YRSServer: YRSServerProtocol{
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getFlightSchedules(from: String, to: String) async throws -> FlightSchedules {
        let response = try await client.getFlightSchedules(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    func getThread(uid: String) async throws -> Thread {
        let response = try await client.getThread(query: .init(
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
    
    func getScheduleByRoute(station: String) async throws -> Schedule {
        let response = try await client.getScheduleByRoute(query: .init(
            apikey: apikey,
            station: station))
        return try response.ok.body.json
    }
    
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestCity {
        let response = try await client.getNearestSettlement(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
    
    func getCarrier(code: String) async throws -> Carrier {
        let response = try await client.getCarrier(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
    
    func getStationsList() async throws -> StationsList {
        let response = try await client.get(query: .init(
            apikey: apikey
        ))
        
        return try response.ok.body.html
    }
    
    func getCopyright() async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
