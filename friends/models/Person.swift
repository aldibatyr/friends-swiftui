//
//  Friend.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import Foundation

struct Person: Codable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    // convert this to the date format via ISODATE
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var memberSince: String {
        let date = registered
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return "Member since \(formatter.string(from: date))"
    }
}
