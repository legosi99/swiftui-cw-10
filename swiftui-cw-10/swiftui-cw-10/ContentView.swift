//
//  ContentView.swift
//  swiftui-cw-10
//
//  Created by Yousif on 05/01/2021.
//

import SwiftUI

enum MoodChecker {
    case 😄,😔,😕,😇,😡
}

func moodCheck(mood:MoodChecker) -> String {
    switch mood {
    case .😄:
        return "I feel happy"
    case .😔:
        return "I feel sad"
    case .😕:
        return "I feel meh"
    case .😇:
        return "I feel fine"
    case .😡:
        return "I feel angry"
    }
}

struct ContentView: View {
    @State var myMood: String = ""
    let mood: [MoodChecker] = [.😄,.😔,.😕,.😇,.😡]
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack{
                Text("MoodCheck")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                Text(myMood)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                HStack {
                    ForEach(mood, id: \.self){ value in
                        MoodSwing(mood: $myMood, emoji: value)
                    }
                }
                Spacer()
            }
        }
    }
}

struct MoodSwing: View {
    @Binding var mood: String
    let emoji: MoodChecker
    
    var body: some View {
        Button(action: {
            mood = moodCheck(mood: emoji)
        }, label: {
            Text("\(emoji)" as String)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
