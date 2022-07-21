//
//  Lesson20_Content.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 21.07.2022.
//

// DisclosureGroup, Link, Stepper, ControlGroup, Label, ColorPicker
import SwiftUI

struct Lesson20_Content: View {
    
    @State var selectedColor = Color.black
    @State var fontStyle = Font.Weight.regular
    @State var textOpacityValue = 1.0
    
    var body: some View {
        ScrollView {
            Text("Текст который мы можем настроить")
                .foregroundColor(selectedColor)
                .font(.title)
                .fontWeight(fontStyle)
                .padding(.top)
                .opacity(textOpacityValue)
            colorSettingsView
            fontSettingsView
            opacitySettingsView
            readDocView
            Spacer()
        }
    }
    
    var colorSettingsView: some View {
        DisclosureGroup {
            HStack {
                Label {
                    Text("Выберите цвет текста")
                } icon: {
                    Image(systemName: "paintpalette.fill")
                }
                ColorPicker("", selection: $selectedColor)
            }
            .padding(.top)
        } label: {
            Text("Настройка цвета")
        }
        .accentColor(.black)
        .padding()
    }
    
    
    var fontSettingsView: some View {
        DisclosureGroup {
            ControlGroup {
                Button ("Regular") {
                    fontStyle = Font.Weight.regular
                }
                Button ("Bold") {
                    fontStyle = Font.Weight.bold
                }
            }
            .padding(.top)
        } label: {
            Text("Настройка стиля шрифта")
        }
        .accentColor(.black)
        .padding()
    }
    
    
    var opacitySettingsView: some View {
        DisclosureGroup {
            Stepper("Value: \(textOpacityValue.formatted(.percent))") {
                guard textOpacityValue < 1.0 else { return }
                textOpacityValue += 0.1
            } onDecrement: {
                guard textOpacityValue > 0.1 else { return }
                textOpacityValue -= 0.1
            }
            .padding(.top)
        } label: {
            Text("Настройка прозрачности")
        }
        .accentColor(.black)
        .padding()
    }
    
    
    var readDocView: some View {
        DisclosureGroup {
            if let url = URL(string: "https://developer.apple.com/documentation/swiftui/link") {
                Link("Прочитать о Link", destination: url)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                    .padding(.top)
            }
        } label: {
            Text("Дополнительно")
        }
        .accentColor(.black)
        .padding()
    }
}

struct Lesson20_Content_Previews: PreviewProvider {
    static var previews: some View {
        Lesson20_Content()
    }
}

