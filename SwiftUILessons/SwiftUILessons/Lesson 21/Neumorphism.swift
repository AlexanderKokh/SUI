//
//  Neumorphism.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 21.07.2022.
//

import SwiftUI

struct NeumorphismUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: -5, y: -5)
            .shadow(color: Color("darkShadow"), radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("darkShadow"), radius: 5, x: -5, y: -5)
    }
}

struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color("backNeo")))
            .neumorphismUnselectedStyle()
    }
}

extension View {
    func neumorphismUnselectedStyle() -> some View {
        modifier(NeumorphismUnselected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
}

struct NeumorphismContentView: View {
    
    @State var isCarClose = false
    @State var tagSelected = 0
   
    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color("backNeo"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
    
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("187 km")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(.all, 25)
    }
        
    var carView: some View {
        Image(isCarClose ? "closeCar" : "car")
            .resizable()
            .frame(height: 220)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }

    var gradient: LinearGradient {
        LinearGradient(colors: [Color("topGradient"), Color("bottomGradient")], startPoint: .bottom, endPoint: .top)
    }
    
    var controlPanelView: some View {
        HStack (spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .neumorphismUnSelectedCircleStyle()
                        .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                        )
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color("backNeo")))
        .neumorphismUnselectedStyle()
    }
    
    var closeCarControlView: some View {
        Button {
            withAnimation {
                isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(isCarClose ? "Закрыть" : "Открыть")
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                        .renderingMode(.template)
                        .neumorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(Color("backNeo")))
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)
    }
    
    var body: some View {
        backgroundStackView {
            VStack {
                headerView
                carView
                controlPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 1 {
                    closeCarControlView
                }
                Spacer()
            }
        }
    }
}

struct NeumorphismContentView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismContentView()
        //  включаем темную тему
            .environment(\.colorScheme, .dark)
    }
}
