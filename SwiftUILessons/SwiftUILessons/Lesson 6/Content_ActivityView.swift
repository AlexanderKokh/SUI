//
//  Content_ActivityView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 12.07.2022.
//

import SwiftUI

struct Content_ActivityView: View {
    @State private var isSharePresented = false
    let customActivity = ActivityViewCustomActivity(title: "Телеграмм", imageName: "nike") {
        print("Отправка в телеграмм")
    }
    
    var body: some View {
        Button("Share") {
            isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented) {
            ActivityView(activityItems: ["message test"], applicationActivities: [self.customActivity])
        }
    }
}

struct Content_ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        Content_ActivityView()
    }
}
