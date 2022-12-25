//
//  Activities.swift
//  CHALLENGE_ActivityTracker
//
//  Created by OAA on 22/12/2022.
//

import Foundation

class Activities: ObservableObject {
    
    @Published var items = [Activity]() {
        
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    
    init() {
        
//        // Deletes all of the UserDefaults
//        UserDefaults.standard.removeObject(forKey: "Items")

        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
    
}
