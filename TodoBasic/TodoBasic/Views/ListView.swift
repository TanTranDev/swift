//
//  ListView.swift
//  TodoBasic
//
//  Created by Tran Nhat Tan on 24/01/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item).onLongPressGesture {
                    withAnimation(.linear(duration: 0.3)) {
                        listViewModel.updateItem(item: item)
                    }
                }
            }.onDelete(perform: listViewModel.deleteItem).onMove(perform: listViewModel.moveItem)
        }.listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}


