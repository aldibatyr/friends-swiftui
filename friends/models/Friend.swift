//
//  Friend.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import Foundation
struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}
