//
//  Activity.swift
//  CHALLENGE_ActivityTracker
//
//  Created by OAA on 22/12/2022.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    
    var id = UUID()

    let name: String
    let duration: Double
    let description: String
    var completionCount: Int
    
}
