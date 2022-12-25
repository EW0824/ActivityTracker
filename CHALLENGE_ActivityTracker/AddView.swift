//
//  AddView.swift
//  CHALLENGE_ActivityTracker
//
//  Created by OAA on 22/12/2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var duration = 0.5
    @State private var description = ""
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    TextField("", text: $name)
                } header: {
                    Text("Name").font(.headline)
                }
                
                Section {
                    Stepper("\(duration.formatted()) hours", value: $duration, in: 0.25...8, step: 0.25)
                } header: {
                    Text("Duration").font(.headline)
                }
                
                Section {
                    TextEditor(text: $description)

                } header: {
                    Text("Description")
                        .font(.headline)
                }
            }
            .navigationTitle("Add an activity")
            .toolbar{
                Button("Save") {
                    let activity = Activity(name: name, duration: duration, description: description, completionCount: 0)
                    activities.items.append(activity)
                    dismiss()
                }
                .disabled(name.isEmpty || description.isEmpty)
            }
            
            
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
