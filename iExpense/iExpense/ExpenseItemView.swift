//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Karla Gardiner on 12/03/2023.
//

import SwiftUI

struct ExpenseItemView: View {
    @State var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            
            Text(item.amount, format: .currency(code: "USD"))
                .foregroundColor(expenseColor(item.amount))
        }
    }
    
    func expenseColor(_ amount: Double) -> Color {
        var color = Color.black
        if (amount > 100) {
            color = .red
        } else if (amount > 10) {
            color = .orange
        }
        
        return color
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(item: Expenses().items[0])
    }
}
