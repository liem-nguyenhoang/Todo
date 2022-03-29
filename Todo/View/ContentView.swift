//
//  ContentView.swift
//  Todo
//
//  Created by LiemNH2 on 29/03/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello")
            } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            self.showingAddTodoView.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        }) //: ADD BUTTON
                    .sheet(
                        isPresented: $showingAddTodoView
                        ,content: {
                            AddTodoView()
                        })
            )
        } //: NAVIGATION
    }
}

// MARK: PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
