//
//  ReminderStatsView.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 16/08/25.
//

import SwiftUI

struct ReminderStatsView: View {
    
    let icon: String
    let title: String
    let count: Int?
    var iconColor: Color = .blue
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: icon)
                        .foregroundColor(iconColor)
                    Text(title)
                        .opacity(0.8)
                }
                Spacer()
                if let count {
                    Text("\(count)")
                        .font(.largeTitle)
                }
            }
        }.padding()
            .frame(maxWidth: .infinity)
            .background(colorScheme == .dark ? Color.darkGray : Color.offWhite)
            .foregroundColor(colorScheme == .light ? Color.darkGray : Color.offWhite)
            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
    }
}

#Preview {
    ReminderStatsView(icon: "calender", title: "Today", count: 9)
}
