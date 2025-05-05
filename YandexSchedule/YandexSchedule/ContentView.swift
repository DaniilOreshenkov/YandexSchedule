//
//  ContentView.swift
//  YandexSchedule
//
//  Created by Daniil Oreshenkov on 04.05.2025.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Click") {
                stations()
            }
        }
        .padding()
    }
}
extension ContentView {
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
            print(nearestStations)
        }
    }
}

#Preview {
    ContentView()
}
