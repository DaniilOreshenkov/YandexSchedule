import SwiftUI

enum ErrorModel: Equatable, Error {
    case noInternet
    case serverError
    
    var title: String {
        switch self {
        case .noInternet:
            return "Нет интернета"
        case .serverError:
            return "Ошибка сервера"
        }
    }
    var image: ImageResource {
        switch self {
        case .noInternet:
            return .noInternet
        case .serverError:
            return .serverError
        }
    }
}
