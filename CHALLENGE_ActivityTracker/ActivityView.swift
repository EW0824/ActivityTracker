//
//  ActivityView.swift
//  CHALLENGE_ActivityTracker
//
//  Created by OAA on 22/12/2022.
//

import SwiftUI

struct ActivityView: View {
    
    let activity: Activity
    @ObservedObject var activities: Activities
//    @ObservedObject var activity: Activity
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
//                Image(activity.name)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//                    .frame(maxwidth: 100, maxheight: 100)
                
                VStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height:2)
                        .foregroundColor(.black)
                        .padding(.vertical)
                    


                    Text("**Duration**: \(activity.duration, specifier: "%.1f") \((activity.duration == 1) ? "hour" : "hours")")
                        .font(.system(size: 24))
                        .padding(.vertical)
                    


                    Text("**Description**: \(activity.description)")
                        .font(.system(size: 24))
                        .padding(.vertical)
                    
                    
                    Text("**Completion Count**: \(activity.completionCount)")
                        .font(.system(size: 24))
                        .padding(.vertical)
                    

                    HStack {
                        Spacer()
                        
                        Button("Increment") {
                            let newActivity = Activity(name: activity.name, duration: activity.duration, description: activity.description, completionCount: activity.completionCount+1)
                            
                            if let index = activities.items.firstIndex(of: activity) {
                                activities.items[index] = newActivity
                            }
                            
    //                        let index = activities.items.firstIndex(of: activity)
    //                        activities.items[index!] = newActivity
                        }
                        .padding(24)
                        .background(.gray)
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                    }

                    
//                    .overlay(Circle())
                    
                }
                .padding(.horizontal)
                .navigationTitle("Activity: \(activity.name)")
                
            }
            
        }
        
        
        
    }
}

struct ActivityView_Previews: PreviewProvider {

    static let act = Activity(name: "Eat Apple", duration: 12.5, description: "To eat apple", completionCount: 12)

    static let activities = Activities()

    static var previews: some View {
        ActivityView(activity: act, activities: activities)
    }
}
