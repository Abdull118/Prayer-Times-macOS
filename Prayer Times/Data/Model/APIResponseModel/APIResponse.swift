//
//  APIResponse.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import Foundation

struct APIResponse: Decodable {
    let data: DataResponse
}

struct DataResponse: Decodable {
    let timings: Timings
}

struct Timings: Decodable {
    let Fajr: String
    let Dhuhr: String
    let Asr: String
    let Maghrib: String
    let Isha: String
    let Sunrise: String
}
