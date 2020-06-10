//
//  ContentView.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading...")
                } else {
                    List(networkManager.people) {person in
                        NavigationLink(destination: DetailedPersonView(person: person, allPeople: self.networkManager.people), label: {
                            PersonCellView(person: person)
                        })
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
