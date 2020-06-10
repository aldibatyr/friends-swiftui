//
//  Tag.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import SwiftUI

struct Tag: View {
    var tag: String
    var body: some View {
            ZStack {
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]), startPoint: .leading, endPoint: .bottomTrailing))
                Text(tag)
            }
            .frame(minWidth: 100, maxHeight: 30)
            .padding(.leading)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag(tag: "Example")
    }
}
