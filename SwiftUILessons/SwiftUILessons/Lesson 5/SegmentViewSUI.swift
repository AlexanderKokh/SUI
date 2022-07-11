//
//  SegmentViewSUI.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 12.07.2022.
//

import SwiftUI

struct SegmentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    var body: some View {
        VStack {
            Text("Кроссовки -  \(company[segmentIndex])")
                .font(Font.system(.title))
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .padding()
                    .offset(x: CGFloat(offsetX))
                Image(sneakers[segmentIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: CGFloat(offsetX))
            }
            .animation(.spring())
           
            Picker(selection: Binding(get: {
                segmentIndex
            }, set: { newValue in
                offsetX = -500
                segmentIndex = newValue
                moveBack()
            })) {
                ForEach(0..<company.count) {
                    Text(company[$0])
                        .tag($0)
                }
            } label: {
                Text("")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer().frame(height: 150)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.offsetX = 0
        }
    }
}


struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView()
    }
}
