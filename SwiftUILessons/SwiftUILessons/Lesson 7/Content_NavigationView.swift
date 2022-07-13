//
//  Content_NavigationView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 13.07.2022.
//

import SwiftUI

class UserBuy: ObservableObject {
    @Published var caps = 0
}

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    
    var text: String
    var body: some View {
        VStack(spacing: 50) {
            Text("Купить \(text) \(userBuy.caps) шт.")
            
                .navigationBarItems(leading:
                    Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("В меню")
                },trailing:
                    HStack {
                    Button("-") {
                        guard userBuy.caps > 0 else { return }
                        self.userBuy.caps -= 1
                    }
                    .font(Font.system(size: 15))
                    Button("+") {
                        self.userBuy.caps += 1
                    }
                })
        }
        .navigationBarBackButtonHidden(true)
        
        .onAppear() {
            self.userBuy.caps = 0
        }
    }
}

struct Content_NavigationView: View {
    @ObservedObject var userBuy = UserBuy()
    @State var selector: String?
    @State var isShow = false
    
    
    let coffe = "Кофе"
    let tea = "Чай"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Вы выбрали \(userBuy.caps) шт.")
                Text("Что желаете?")
                
                NavigationLink(tag: "act1", selection: $selector) {
                    DetailView(text: coffe)
                } label: {
                    EmptyView()
                }

                // переход по флагу
                
                NavigationLink(isActive: $isShow) {
                    DetailView(text: coffe)
                } label: {
                    EmptyView()
                }
                
                Button("Go") {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.isShow.toggle()
                    }
                }
                                
                // переход по тегу
                
//                NavigationLink(tag: "act2", selection: $selector) {
//                    DetailView(text: tea)
//                } label: {
//                    EmptyView()
//                }
//
//                Button("Go") {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        self.selector = "act1"
//                    }
//                }
                
 
                // переход по линку
                
//                NavigationLink(destination: DetailView(text: coffe)) {
//                    Text(coffe)
//                }
//                NavigationLink(destination: DetailView(text: tea)) {
//                    Text(tea)
//                }
            }
            .navigationTitle("Меню")
        }
        .environmentObject(userBuy)
    }
}

struct Content_NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        Content_NavigationView()
    }
}
