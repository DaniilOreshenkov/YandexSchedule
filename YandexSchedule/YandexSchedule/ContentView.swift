//
//  ContentView.swift
//  YandexSchedule
//
//  Created by Daniil Oreshenkov on 04.05.2025.
//

import SwiftUI
import OpenAPIURLSession

//struct ContentView: View {
//    
//    @State private var number = 0
//
//       var body: some View {
//           TabBarView()
//       }
//}
struct Park: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ParkDetails: View {
    var park: Park
    
    var body: some View {
        Text(park.name)
            .font(.title)
            .navigationTitle(park.name)
    }
}

struct ContentView: View {
    private let parks = [
        Park(name: "Yosemite"),
        Park(name: "Sequoia"),
        Park(name: "Joshua Tree")
    ]
    
    var body: some View {
        TabBarView()
    }
}

#Preview {
    ContentView()
}
