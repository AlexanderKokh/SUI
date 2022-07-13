//
//  TabView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 13.07.2022.
//

import SwiftUI

/// Главный таб Бар
struct MainTabView: View {
    
    @State var tabSelected = 0
    
    var body: some View {
        TabView(selection: $tabSelected) {
            HomeView(tabSelection: $tabSelected)
                .badge(14)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            ZStack {
                Color.gray.ignoresSafeArea(edges: .top)
                Text("Second tab")
            }
                .tabItem {
                    Image(systemName: "globe")
                    Text("Second")
                }
                .tag(1)
            ZStack {
                Color.blue.ignoresSafeArea(edges: .top)
                Text("Trash")
            }
                .tabItem {
                    Image(systemName: "trash")
                    Text("trash")
                }
                .tag(2)
        }
        .font(.headline)
        .accentColor(.red)
    }
}

struct Content_MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


struct HomeView: View {
    
 @Binding var tabSelection: Int
    
    // пример инициализатора под копотом
    
//    init(tabSelection: Binding<Int>) {
//        _tabSelection = tabSelection
//    }
//
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(edges: .top)
            
            VStack {
                Text("Home")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Button {
                    tabSelection = 2
                } label: {
                    Text("Перейти в корзину")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
