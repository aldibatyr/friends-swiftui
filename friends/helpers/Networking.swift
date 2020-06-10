//
//  Networking.swift
//  friends
//
//  Created by Aldiyar Batyrbekov on 6/9/20.
//  Copyright © 2020 Aldiyar Batyrbekov. All rights reserved.
//

import Alamofire
import Foundation
import CoreData

class NetworkManager: ObservableObject {
    @Published var people: [Person] = []
    @Published var loading = false
    private let api_url_base = "https://www.hackingwithswift.com/samples/friendface.json"
    init() {
        loading = true
        loadData()
    }
    
    private func loadData() {
        AF.request(api_url_base).responseJSON { response in
            do {
                guard let data = response.data else { fatalError("No data in response") }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let people = try decoder.decode([Person].self, from: data)
                DispatchQueue.main.async {
                    self.people = people
                    self.loading = false
                }
            } catch {
                print(error)
            }
        }
    }
}
