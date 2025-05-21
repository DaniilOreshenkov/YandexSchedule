//
//  SettingsScreen.swift
//  YandexSchedule
//
//  Created by Daniil Oreshenkov on 16.05.2025.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var isOtherFeatureEnabled = false
    @State private var isPresenting = false
    
    var body: some View {
        VStack {
            VStack {
                Toggle(
                    "Темная тема",
                    isOn: $isOtherFeatureEnabled)
                .toggleStyle(.switch)
                .tint(Color(R.ColorYP.blue))
                .padding()
                HStack {
                    Text("Пользовательское соглашение")
                    Spacer()
                    Button {
                        isPresenting = true
                    } label: {
                        Image(ImageResource.arrowRightIcon)
                    }
                }
                
            }
            .padding()
            Spacer()
            VStack(spacing: 12) {
                Text("Приложение использует API «Яндекс.Расписания»")
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12))
            .padding()
        }
    }
}

#Preview {
    SettingsScreen()
}

//import WebKit
//
//struct WebView: UIViewRepresentable {
//    let url: URL
//
//    func makeUIView(context: Context) -> WKWebView {
//        return WKWebView()
//    }
//
//    func updateUIView(_ webView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        webView.load(request)
//    }
//}
