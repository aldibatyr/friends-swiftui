//
//  DetailedPersonView.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import SwiftUI

struct DetailedPersonView: View {
    let person: Person
    let allPeople: [Person]
    let friends: [Person]
    init(person: Person, allPeople: [Person]) {
        self.person = person
        self.allPeople = allPeople
        
        var matches = [Person]()
        
        for friend in person.friends {
            if let match = allPeople.first(where: {
                $0.id == friend.id
            }) {
                matches.append(match)
            } else {
                fatalError("no friends are found")
            }
        }
        
        self.friends = matches
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text(person.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Text(person.isActive ? "Online" : "Offline")
                    .foregroundColor(person.isActive ? Color.green : Color.gray)
            }
            .padding([.horizontal])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(person.tags, id:\.self) {tag in
                        Tag(tag: tag)
                    }
                }
            }
            .padding(.bottom)
            Group {
                Text(person.company)
                    .fontWeight(.bold)
                Text(person.email)
                Text(person.address)
                    .padding(.bottom)
            }
            .padding(.horizontal)
            Text(person.about)
                .padding()
            Text("Friends with")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(friends, id: \.self.id) {friend in
                        NavigationLink(destination: DetailedPersonView(person: friend, allPeople: self.allPeople), label: {
                            Text(friend.name)
                        })
                            .padding(.leading)
                    }
                }
            })
            Spacer()
        }
    }
}

struct DetailedPersonView_Previews: PreviewProvider {
    static var person: Person = Person(id: UUID(), isActive: true, name: "Aldiyar", age: 25, company: "A7A Creative", email: "aldiyar@a7acreative.com", address: "606 N Figueroa St, Los Angeles, CA 90012", about: "Hello I am Aldiyar. I would love to meet you some day", registered: Date.init(), tags: ["Developer", "Creative"], friends: [Friend(id: UUID(), name: "Sabina")])
    static var previews: some View {
        DetailedPersonView(person: person, allPeople: NetworkManager().people)
    }
}
