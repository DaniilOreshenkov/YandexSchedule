import Foundation
import OpenAPIURLSession

final class ServerManager {
    
    static let shared = ServerManager()
    
    private var serverURL: URL?
    
    private init() {}
    
    enum MockScenario {
        case success
        case noInternet
        case serverError
    }
    
//    func fetchSchedules(from origin: String, to destination: String, scenario: MockScenario = .success, completion: @escaping (Result<[Transport], ErrorModel>) -> Void) {
//        // Симуляция задержки сети
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            switch scenario {
//            case .success:
//                completion(.success(R.Mock.carriers))
//            case .noInternet:
//                completion(.failure(.noInternet))
//            case .serverError:
//                completion(.failure(.serverError("Сервер временно недоступен")))
//            }
//        }
//    }
    
    func getServer() -> YRSServer {
        do {
            serverURL = try Servers.Server1.url()
        } catch {
            print("Error getting server URL: \(error)")
        }
        
        guard let serverURL = serverURL else {
            print("Failed to get server URL, even after catch.")
            return YRSServer(client: Client(
                serverURL: URL(fileURLWithPath: ""),
                transport: URLSessionTransport()),
                             apikey: "")
        }
        
        let client = Client(
            serverURL: serverURL ,
            transport: URLSessionTransport()
        )
        
        let service = YRSServer(
            client: client,
            apikey: "53e0755f-99cf-4e1f-a2ca-e7de92c611f0"
        )
        
        return service
    }
    
    func stations(lat: Double,lng: Double) {
        let server = getServer()
        Task {
            
            let response = try await server.getNearestStations(lat: lat, lng: lng, distance: 50)
        }
    }
    func stations() {
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
        
        Task {
            
            let nearestStations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            nearestStations.stations
        }
    }}
