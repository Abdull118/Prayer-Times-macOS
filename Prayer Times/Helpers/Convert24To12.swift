//
//  Convert24To12.swift
//  Prayer Times
//
//  Created by Arash Naimi on 5/20/23.
//

import Foundation

func convertTo12Hour(time24: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"

    if let date = dateFormatter.date(from: time24) {
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    return time24
}
