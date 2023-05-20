//
//  APICall.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import Foundation
import Combine

class PrayerTimesFetcher: ObservableObject {
    @Published var timings: Timings?
    var cancellationToken: AnyCancellable?
    
    func getPrayerTimes(for city: String, in country: String) {
        let urlString = "https://api.aladhan.com/v1/timingsByCity?city=\(city)&country=\(country)&method=2"
        guard let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURLString) else { return }
              
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")  // Example header
        
        cancellationToken = URLSession.shared.dataTaskPublisher(for: request)  // Use request here
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .replaceError(with: APIResponse(data: DataResponse(timings: Timings(Fajr: "", Dhuhr: "", Asr: "", Maghrib: "", Isha: "", Sunrise: ""))))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] response in
                self?.timings = response.data.timings
            })
    }
 
}
