//
//  SUI_Animations.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 20.07.2022.
//

import SwiftUI

struct AnimationView: View {
    @State var isStarted = false
    @State var circleProgress: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Spacer()
           
            // make animation menu with 3 buttons
            
            Button {} label: {
                Image(systemName: "bag.badge.plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .padding()
                    .clipShape(Circle())
                    .rotationEffect(Angle(degrees: isStarted ? 0 : -90))
            }
            .background(Circle().fill(.orange)
                            .shadow(radius: 8, x: 4, y: 4))
            .offset(x: 0, y: isStarted ? -70 : 0)
            .opacity(isStarted ? 1 : 0)
            
            Button {} label: {
                Image(systemName: "calendar.badge.plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .padding()
                    .clipShape(Circle())
                    .rotationEffect(Angle(degrees: isStarted ? 0 : -90))
            }
            .background(Circle().fill(.orange)
                            .shadow(radius: 8, x: 4, y: 4))
            .offset(x: isStarted ? -70 : 0, y: 0)
            .opacity(isStarted ? 1 : 0)
            
            Button {
                withAnimation(.spring()) {
                    isStarted.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .padding()
                    .clipShape(Circle())
                    .rotationEffect(Angle(degrees: isStarted ? 0 : -90))
            }
            .background(Circle().fill(.orange)
                            .shadow(radius: 8, x: 4, y: 4))
            
//            Circle()
//                .trim(from: 0, to: circleProgress)
//                .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                .frame(height: 300)
//                .rotationEffect(Angle(degrees: -90))
//                .padding(40)

            
            //            Rectangle()
//                .foregroundColor(.orange)
//                .frame(width: 100, height: 100)
                // .offset(x: 0, y: isStarted ? 300 : 0)
               // .position(isStarted ? CGPoint(x: 150, y: 300) : CGPoint(x: 150, y: 50))
               // .opacity(isStarted ? 0 : 1)
               // .rotationEffect(Angle(degrees: isStarted ? 180 : 0), anchor: .bottom)
               // .scaleEffect(isStarted ? 0.5 : 1, anchor: .topTrailing)

//            Spacer()
//            Button {
//                withAnimation (.linear(duration: 1)) {
//                    isStarted.toggle()
//                    circleProgress = isStarted ? 0.01 : 1.0
//                }
//                //                withAnimation(.easeIn(duration: 1)) {
//                //                    isStarted.toggle()
//                //                }
//            } label: {
//                Text("Start")
//            }
//            .padding(.bottom)
        }
    }
}


struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
