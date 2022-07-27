//
//  File.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 27.07.2022.
//

import SwiftUI

struct Lesson23_Content: View {
    @State private var selected = "Food"
    
    var body: some View {
        HStack {
            MenuView(selectedFood: $selected)
            Spacer()
            
            if selected == "Food" {
                plateView
                    .zIndex(1)
                    .transition(.asymmetric(insertion: .offset(y: -700), removal: .offset(y: 700)))
            }
            Spacer()
        }
    }
    
    var plateView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("geometryBackground"))
            .frame(width: 200, height: 300)
            .overlay(
                Text("Мясо с овощами")
                    .bold()
                    .foregroundColor(.orange)
            )
            .overlay(
                Circle()
                    .fill(.white.opacity(0.6))
                    .frame(width: 200, height: 200)
            )
            .overlay(
                Image("eda")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .offset(x: -30, y: -120)
            )
    }
}

struct Lesson23_Previews: PreviewProvider {
    static var previews: some View {
        Lesson23_Content()
    }
}
