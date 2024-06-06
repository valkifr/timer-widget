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
}

var dates = [
   ADate(year: 2025, month: 3, day: 2, hour: 3, minute: 2, dateInString: "2025-03-02-03-02"),
   ADate(year: 2026, month: 2, day: 3, hour: 3, minute: 2, dateInString: "2026-02-03-03-02")
]

var title = ""
var icon = ""
 
