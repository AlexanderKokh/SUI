//
//  SwiftUILessonsApp.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 07.07.2022.
//

import SwiftUI

@main
struct SwiftUILessonsApp: App {
    var body: some Scene {
        WindowGroup {
            
            Lesson23_Content()
            
            //NeumorphismContentView()
            //  включаем темную тему
            //    .environment(\.colorScheme, .dark)
            
            // пример с кастомным униврсальным bottomSheet            
//            CustomContentView_lesson19 {
//                VStack {
//                    Capsule()
//                        .fill(.white)
//                        .frame(width: 80, height: 3)
//                        .padding(.top)
//                    ForEach(0..<2) { _ in
//                        RoundedRectangle(cornerRadius: 20)
//                            .fill(Color("action"))
//                            .frame(height: 300)
//                            .padding(.horizontal)
//                    }
//                    Spacer()
//                }
//            }
        }
    }
}
