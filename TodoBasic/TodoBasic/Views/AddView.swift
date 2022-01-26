//
//  AddView.swift
//  TodoBasic
//
//  Created by Tran Nhat Tan on 25/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack{
            VStack {
                TextField("Type something here...", text: $textFieldText).background(Color.white).frame(height: 56).cornerRadius(8).padding(.all, 10.0)
                Button(action: onPress, label: {
                    Text("Add".uppercased())
                }).foregroundColor(.white).frame(maxWidth: .infinity).frame(height: 50).background(Color.accentColor).cornerRadius(8)
            }.padding(20)
        }.navigationTitle("Add an item ➕").foregroundColor(Color.black).alert( isPresented: $showAlert, content: getAlert)
    }
    
    func onPress() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count > 0 {
            return true
        }
        alertTitle = "Item much be at least 1 character"
        showAlert.toggle()
        return false
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}
