//
//  TextFieldView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 14.07.2022.
//

import SwiftUI

struct TextFieldView: View {
    @State var text = ""
    @FocusState var nameIsFocused: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            TextField(text: $text) {
                Text("Логин")
            }
            .redTextField()
            .focused($nameIsFocused)
            
            TextField("Пароль", text: $text) {
                changed in
                print(changed)
            } onCommit: {
                print("onCommit")
            }
            .modifier(textFieldModifire())
            
            Button {
                nameIsFocused = false
                // or iOS < 15
                // hideKeyboard
                
            } label: {
                Text("Логин")
            }
        }
    }
}
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func redTextField() -> some View {
        modifier(textFieldModifire())
    }
}


struct textFieldModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .foregroundColor(.red)
            .font(.system(size: 24))
            .keyboardType(.emailAddress)
            .padding(.horizontal, 12)
            .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.red))
            .padding()
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
