//
//  SettingsScreen.swift
//  YandexSchedule
//
//  Created by Daniil Oreshenkov on 16.05.2025.
//

import SwiftUI

struct SettingView: View {
    @AppStorage(Constant.isDarkMode.stringValue) var isDarkMode: Bool = false
    
    @State private var isPresenting = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 32) {
                    Toggle("Темная тема", isOn: $isDarkMode)
                        .tint(Color.blueYP)
                    HStack {
                        NavigationLink {
                            UserAgreementView()
                        } label: {
                            HStack {
                                Text("Пользовательское соглашение")
                                Spacer()
                                Image(.arrowRightIcon)
                            }
                            .foregroundColor(isDarkMode ? .whiteYP : .blackYP)
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
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    SettingView()
}


