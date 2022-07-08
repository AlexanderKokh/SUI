//
//  PickerView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 08.07.2022.
//

import SwiftUI

struct PickerView: View {
    @State var section = 0
    @State var procentSection = 0
    @State var isOn = false
    var settingsTime = ["1 min", "5 min", "15 min", "25 min" ]
    var settingsProcent = ["25 %", "50 %", "75 %", "100 %" ]
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $section) {
                    ForEach(0..<settingsTime.count) {
                        Text(self.settingsTime[$0])
                    }
                } label: {
                    Text("Время")
                }
               
                Toggle(isOn: $isOn) {
                    Text("Авиарежим")
                        .foregroundColor(isOn ? Color.cyan : Color.green)
                }
               
                Picker(selection: $procentSection) {
                    ForEach(0..<settingsProcent.count) {
                        Text(self.settingsProcent[$0])
                    }
                } label: {
                    Text("Подсветка")
                }
            }
            .navigationBarTitle("Настройки")
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
