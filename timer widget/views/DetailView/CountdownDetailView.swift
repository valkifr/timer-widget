//
//  CountdownDetail.swift
//  timer widget
//
//  Created by Olivér Ungváry on 19/08/2024.
//

import SwiftUI

struct CountdownDetailView: View {
    
    let countdown: Countdown
    
    @State private var isPresented = false
    
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(CountdownColor(rawValue: countdown.color)!.color.gradient)
                .ignoresSafeArea(.all)
            VStack {
                EmojiView(emoji: countdown.emoji)
                
                Text(countdown.title)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundStyle(.white)
                
                CountdownView(date: countdown.endDate)
                    .foregroundStyle(.white)
            }
            .position(x: proxy.frame(in: .local).midX,
                      y: proxy.frame(in: .local).midY / 1.5)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "pencil")
                }
                .sheet(isPresented: $isPresented) {
                    NewCountdownView(countdown: countdown, editorTitle: "Edit Countdown")
                }
            }
        }
    }
}
struct CountdownView: View {
    let date: Date
    
    private let titles: [String] = ["Year", "Month", "Day", "Hour", "Minute"]
    
    private var daysLeft: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: .now, to: date)
    }
    var body: some View {
        HStack {
            CountdownViewComponent(number: daysLeft.year!, title: titles[0])
            CountdownViewComponent(number: daysLeft.month!, title: titles[1])
            CountdownViewComponent(number: daysLeft.day!, title: titles[2])
            CountdownViewComponent(number: daysLeft.hour!, title: titles[3])
            CountdownViewComponent(number: daysLeft.minute!, title: titles[4])
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 5)
                .fill(.black)
                .opacity(0.2)
                
        }
    }
}

struct CountdownViewComponent: View {
    let number: Int
    let title: String
    
    private func isSingular(_ number: Int) -> String {
        number == 1 ? "" : "s"
    }
    
    var body: some View {
        VStack {
            Text("\(number)")
            Text(title + isSingular(number))
        }
        .font(.subheadline)
        .fontWeight(.bold)
    }
}

#Preview {
    CountdownDetailView(countdown: Countdown(title: "hawk tuah", emoji: "❤️‍🔥", endDate: Date(), alertDate: Date(), color: "blue"))
}
