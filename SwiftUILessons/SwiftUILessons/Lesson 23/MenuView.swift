//
//  MenuView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 27.07.2022.
//

//MatchedGeometryEffect - Если у вас один и тот же вид, отображающийся в двух разных частях вашей иерархии представлений, и вы хотите анимироваться между ними - например, переход от представления списка к увеличенному представлению деталей - то вы должны использовать модификатор SwiftUI matchedGeometryEffect(), который немного похож на Magic Move в Keynote.
//Чтобы использовать модификатор, прикрепите его к одной и той же паре представлений в разных частях вашей иерархии. После этого при переключении между двумя состояниями представления вы обнаружите, что SwiftUI плавно анимирует ваше синхронизированное представление.

import SwiftUI
struct MenuView: View {
    
    @Binding var selectedFood: String
    
    @State private var selected = "Food"
    
    private let menu = ["Drinks", "Food", "Bakary"]
    
    var body: some View {
        VStack(spacing: 150) {
            ForEach(menu, id: \.self) { item in
                ZStack(alignment: .bottom) {
                    if selected == item {
                        menuItemView
                    }
                    Text(item)
                        .foregroundColor(selected == item ? .black : .black.opacity(0.6))
                        .frame(height: 70)
                        .scaleEffect(selected == item ? 1.5 : 0.8)
                        .offset(y: -10)
                }
                .frame(width: 75)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = item
                        selectedFood = item
                    }
                }
            }
            .rotationEffect(Angle(degrees: 270))
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("geometryBackground"))
                .frame(width: 50, height: UIScreen.main.bounds.height + 100)
                .offset(x: -10)
        )
    }
    
    @Namespace private var menuSpace
    @Namespace private var menuSpace2
    
    
    private var menuItemView: some View {
        VStack {
            Circle()
                .fill(Color("geometryBackground"))
                .matchedGeometryEffect(id: "menuSpace2", in: menuSpace2)
                .frame(width: 90, height: 90)
                .offset(y: 10)
            Circle()
                .fill(.orange)
                .matchedGeometryEffect(id: "menuSpace", in: menuSpace)
                .frame(width: 6, height: 6)
                .offset(y: -15)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedFood: .constant("Food"))
    }
}
