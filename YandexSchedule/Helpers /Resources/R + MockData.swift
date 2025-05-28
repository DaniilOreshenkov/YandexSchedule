import Foundation
import SwiftUICore

extension R {
    enum Mock {
        static var cities: [City] = [
            City(name: "Москва", stations: [Station(name: "Белорусский вокзал"),
                                            Station(name: "Казанский вокзал"),
                                            Station(name: "Киевский вокзал"),
                                            Station(name: "Курский вокзал"),
                                            Station(name: "Павелецкий вокзал"),
                                            Station(name: "Рижский вокзал"),
                                            Station(name: "Савеловский вокзал"),
                                            Station(name: "Ярославский вокзал")]),
            
            City(name: "Санкт-Петербург", stations: [Station(name: "Московский вокзал"),
                                                     Station(name: "Ладожский вокзал"),
                                                     Station(name: "Витебский вокзал"),
                                                     Station(name: "Финляндский вокзал"),
                                                     Station(name: "Балтийский вокзал")]),
            
            City(name: "Сочи", stations: [Station(name: "Сочинский вокзал"),
                                          Station(name: "Адлерский вокзал")]),
            
            City(name: "Саратов", stations: [Station(name: "Саратов-Пассажирский")]),
            
            City(name: "Красноярск", stations: [Station(name: "Красноярск-Пассажирский")]),
            
            City(name: "Омск", stations: [Station(name: "Омск-1"), Station(name: "Омск-2")]),
            
            City(name: "Краснодар", stations: [Station(name: "Краснодар-Пассажирский")]),
            
            City(name: "Новосибирск", stations: [Station(name: "Новосибирск-Пассажирский")])
        ]
        
        static var carriers: [Transport] = [
            Transport(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 20, date: Date()),
            Transport(carrierName: "ФГК", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 15, date: Date()),
            Transport(carrierName: "Урал логистика", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 18, date: Date()),
            Transport(carrierName: "РЖД", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 19, date: Date()),
            Transport(carrierName: "ФГК", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 14, date: Date()),
            Transport(carrierName: "Урал логистика", carrierLogo: Image("rzhd"), startTime: Date(), endTime: Date(), timeInRoute: 17, date: Date())
        ]
        
        static var carriersInfo: [CarrierInfo] = [
            CarrierInfo(logo: Image("RZHD"), name: "ОАО \u{00AB}РЖД\u{00BB}", phoneNumber: "+7 (495) 123-45-67", email: "info@rzhd.ru")
        ]
    }
}
