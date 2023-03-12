//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Karla Gardiner on 11/03/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
