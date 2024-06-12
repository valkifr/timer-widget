//
//  ListItems.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//
import Foundation


struct ADate: Identifiable, Hashable {
    let year    :       Int
    let month   :       Int
    let day     :       Int
    let hour    :       Int
    let minute  :       Int
    let dateInString:   String
    let id = UUID()
    
    init(year: Int, month: Int, day: Int, hour: Int, minute: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
        self.dateInString = "\(year)-\(month)-\(day)-\(hour)-\(minute)"
    }
}

var dates = [
  ADate(year: 2010, month: 04, day: 24, hour: 02, minute: 04)
]

let randomDate = ADate(year: 2222, month: 01, day: 02, hour: 08, minute: 09)
