//
//  TextView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 13.07.2022.
//

import SwiftUI

struct TextView: View {
    var body: some View {
//        Text("Beauty and wisdom are seldom found together")
        HStack(alignment: .top) {
            Text("Hello")
                .baselineOffset(-10)
                .border(.red)
            Text("Hello")
                .border(.green)
            Text("Hello")
                .baselineOffset(10)
                .border(.blue)
        }
            // .uppercased())
            // .font(.title)
//            .kerning(3)
//            .italic()
//            .bold()
//            .underline(true, color: .yellow)
//            .strikethrough(true, color: .red)
           // .padding()
           // .lineLimit(1)
//            .multilineTextAlignment(.center)
//            .background(.red)
//            .foregroundColor(.white)
//            .lineSpacing(10)
//            .font(.system(size: 24, weight: .bold, design: .serif))
//
//            .frame(width: 200, height: 200, alignment: .leading)
//            .minimumScaleFactor(0.1)
             
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
