//
//  FilterView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import Foundation

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
                dateComponents.year = year
                dateComponents.month = month
                dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
}
