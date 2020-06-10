//
//  PersonCellView.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import SwiftUI

struct PersonCellView: View {
    let person: Person
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                    Text("\(person.age) years old")
                        .font(.subheadline)
                    Text(person.address)
                        .font(.subheadline)
                        .frame(width: 150, height: 20, alignment: .leading)
                    Text("\(person.memberSince)")
                        .font(.subheadline)
                }
                Spacer()
                Circle()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(person.isActive ? Color.green : Color.gray)
            }
    }
}

struct PersonCellView_Previews: PreviewProvider {
    static var person: Person = Person(id: UUID(), isActive: true, name: "Aldiyar", age: 25, company: "A7A Creative", email: "aldiyar@a7acreative.com", address: "606 N Figueroa St, Los Angeles, CA 90012", about: "Hello I am Aldiyar. I would love to meet you some day", registered: Date.init(), tags: ["Developer", "Creative"], friends: [Friend(id: UUID(), name: "Sabina")])
    static var previews: some View {
        PersonCellView(person: person)
    }
}
