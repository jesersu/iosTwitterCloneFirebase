//
//  ExploreViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Vipin Saini on 24/04/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var features = [Feature]()
    @Published var searchText = ""
    
    var searchableUsers: [Feature] {
        if searchText.isEmpty {
            return features
        } else {
            let lowercasedQuery = searchText.lowercased()
                
                return features.filter({
                    $0.properties.title.contains(lowercasedQuery) || $0.properties.place.lowercased().contains(lowercasedQuery)
                })
        }
         
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
