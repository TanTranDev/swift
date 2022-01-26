//
//  ListRowView.swift
//  TodoBasic
//
//  Created by Tran Nhat Tan on 25/01/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1: ItemModel = ItemModel(title: "item 1", isCompleted: true)
    static var item2: ItemModel = ItemModel(title: "item 2", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
