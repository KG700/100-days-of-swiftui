//
//  ContentView.swift
//  iExpense
//
//  Created by Karla Gardiner on 10/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Business Expenses") {
                    ForEach(expenses.businessItems()) { item in
                        ExpenseItemView(item: item)
                        
                    }
                    .onDelete { indexSet in
                        removeItems(at: indexSet, type: "Business")
                    }
                }
                
                Section("Personal Expenses") {
                    ForEach(expenses.personalItems()) { item in
                        ExpenseItemView(item: item)
                        
                    }
                    .onDelete { indexSet in
                        removeItems(at: indexSet, type: "Personal")
                    }
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, type: String ) {
        var items: [ExpenseItem]
        switch type {
        case "Personal":
            items = expenses.personalItems()
        case "Business":
            items = expenses.businessItems()
        default:
            items = []
        }
        
        for index in offsets {
            if let expenseIndex = expenses.items.firstIndex(of: items[index]) {
                expenses.items.remove(at: expenseIndex)
            }
            
        }
    }
    
//    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
