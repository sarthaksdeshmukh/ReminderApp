//
//  MyListView.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 03/08/25.
//

import SwiftUI

struct MyListView: View {
    
    let myList: FetchedResults<MyList>
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            if myList.isEmpty {
                Spacer()
                Text("No reminders found")
            } else {
                ForEach(myList) { myList in
                    NavigationLink(value: myList) {
                    VStack {
                            MyListCellView(myList: myList)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading], 30)
                                .font(.title3)
                                .foregroundColor(colorScheme == .dark ? Color.offWhite :
                                                    Color.darkGray
                                )
                            Divider()
                        }
                    }
                    .listRowBackground(colorScheme == .dark ? Color.darkGray : Color.offWhite)
                }.scrollContentBackground(.hidden)
                    .navigationDestination(for: MyList.self) { myList in
                        MyListDetailView(myList: myList)
                            .navigationTitle(myList.name)
                    }
            }
        }
    }
}

