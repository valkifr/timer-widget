//
//  ListItems.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//
import Foundation



var dates = [
  Date()
]

let dateFormatter = ISO8601DateFormatter()

let randomDate = Date()

func addNewCountdown(date: Date) {
    dates.append(date)
}
