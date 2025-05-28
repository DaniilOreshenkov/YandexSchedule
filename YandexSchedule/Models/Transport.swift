import SwiftUI

struct Transport: Identifiable {
    let id = UUID()
    let carrierName: String
    let carrierLogo: Image
    let startTime: Date
    let endTime: Date
    let timeInRoute: Int
    let date: Date
}
