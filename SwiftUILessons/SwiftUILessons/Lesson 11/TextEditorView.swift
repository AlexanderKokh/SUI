//
//  TextEditorView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 14.07.2022.
//

import SwiftUI

struct TextEditorView: View {
    @State var text = ""
    @State var totalChars = 0
    @State var lastText = ""
    
    // делаем бэкграунд прозрачным у UITextView
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            ProgressView("Chars \(totalChars) / 150", value: Double(totalChars), total: 150)
            
                .frame(width: 150)
                .padding()
                .foregroundColor(.white)
                .accentColor(.white)
            
            TextEditor(text: $text)
                .padding()
                .background(.yellow.opacity(0.5))
                .foregroundColor(.red)
                .font(.custom("AvenirNext-Regular", size: 20))
                .frame(width: 400, height: 300)
                .cornerRadius(10)
                .onChange(of: text) { text in
                    totalChars = text.count
                    if totalChars <= 150 {
                        lastText = text
                    } else {
                        self.text = lastText
                    }
                }
            Spacer()
        }
        .padding()
        .background(.purple)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
