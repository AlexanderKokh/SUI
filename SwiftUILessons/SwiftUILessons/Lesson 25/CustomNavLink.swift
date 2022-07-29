//
//  CustomNavLink.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 29.07.2022.
//

import SwiftUI


struct Item {
    let name: String
}

struct Lesson25_CustomNavLink2: View {
    
    let item: Item
    
    var body: some View {
        Color.blue
            .navigationTitle(item.name)
    }
}

struct Lesson25_CustomNavLink: View {
    
    let item: Item?
    
    @State var isShown = false
    var body: some View {
        ZStack {
            Color.green
            VStack {
                Button {
                    isShown.toggle()
                } label: {
                    Text("Переход по кнопке")
                }
            }
            .navigationBarHidden(true)
            .navigation(model: item, isActive: $isShown) { item in
                Lesson25_CustomNavLink2(item: item)
            }
        }
    }
}

struct Lesson25Content_Previews: PreviewProvider {
    static var previews: some View {
        Lesson25_CustomNavLink(item: nil)
    }
}
