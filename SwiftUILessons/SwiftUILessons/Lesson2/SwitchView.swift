//
//  SwitchView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 07.07.2022.
//

import SwiftUI

struct SwitchView: View {
    @State var isOnToggle = false
    
    var configureHStack: some View {
        HStack {
            VStack {
                Text("Кошелек")
                Text("Профиль")
                Spacer().frame(height: 300)
            }
            .padding()
            Spacer()
        }
    }
    
    var body: some View {
        VStack {
            ZStack{
                configureHStack
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.yellow)
                    .offset(x: isOnToggle ? 100 : 0)
                    .frame(width: 400, height: 600)
                Text("Текст на экране")
                    .offset(x: isOnToggle ? 100 : 0)
            }
            Toggle(isOn: $isOnToggle) {
                Text("Показать настройки")
            }
            .padding()
        }
        .animation(.spring(
            response: 0.9,
            dampingFraction: 0.5,
            blendDuration: 0.3)
        )
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
