//
//  MyListDetailVie.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 03/08/25.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    @State private var openAppReminder: Bool = false
    @State private var title: String = ""
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    private var isFormValid : Bool {
        !title.isEmpty
    }
    
    init(myList: MyList) {
        self.myList = myList
        
        _reminderResults  = FetchRequest(fetchRequest: ReminderService.getRemindersByList(myList: myList))
    }
    var body: some View {
        VStack {
            
            ReminderListView(reminders: reminderResults)
                        
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New Reminder") {
                    openAppReminder = true
                }
            }.foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment:  .leading)
                .padding()
            
        }.alert("New Reminder", isPresented: $openAppReminder) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) {}
            Button("Done") {
                if isFormValid {
                    do {
                       try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    MyListDetailView(myList: PreviewData.myList)
}
