//
//  ContentView.swift
//  CHALLENGE_ActivityTracker
//
//  Created by OAA on 22/12/2022.
//

import SwiftUI





struct showActivity: View {
    
//    let activities: Activities
    let activity: Activity
    
    var body: some View {
        
        VStack(spacing: 0){
            
            VStack(alignment: .leading) {
                Text(activity.name)
                    .font(.system(size: 24, weight: .bold))
                    .lineLimit(1)
                    .foregroundColor(.black)
                
                Text("\(activity.duration, specifier: "%.1f") \((activity.duration == 1 ) ? "hour" : "hours")")
                    .bold()
                    .italic()
                    .foregroundColor(.black)
                
            }
            .frame(width: 175, height: 60)
//            .background(.white)
//            .border(.red)
                        
            Rectangle()
                .frame(height:2)
                .foregroundColor(.gray)

            Text(activity.description)
                .multilineTextAlignment(.leading)
                .font(.system(size: 18))
                .foregroundColor(.black)
                .padding(.horizontal, 6)
                .frame(width: 175, height: 100)
//                .border(.red)
                .background(Color(red: 211/256, green: 211/256, blue: 211/256))

            

            
            
            
//            .background(Color(red: 0.2, green: 0.2, blue: 0.3))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 2)
        )
        .padding(.vertical, 8)
//        .border(.black)
//        .overlay(RoundedRectangle(cornerRadius: 10))
//        .background(.black)
        
    }
    
}





struct ContentView: View {
    
    // Fetch from user defaults. Else empty list.
    @StateObject var activities = Activities()
    
    @State private var showingAddActivity = false
    @State private var activityAmount = 0
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activities.items) { activity in
                        NavigationLink {
                            
                            ActivityView(activity: activity, activities: activities)
                        } label: {
        
                            showActivity(activity: activity)
                        }
                    }
                }
                .padding([.horizontal])
                
            }
            .navigationTitle("Activity Tracker")

            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
            
        }
        
        

        
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
