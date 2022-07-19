//
//  ProductItemView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 19.07.2022.
//
import SwiftUI

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Название - \(product.title)")
                        .font(.title)
                        .fontWeight(.medium)
                    Text("Цена: \(product.price)")
                    Text("Описание: \(product.description)")
                } header: {
                    Image(product.imageName)
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(10)
                }

            }
            Button {
                print("Добавить в корзину")
            } label: {
                Text("Добавить в корзину")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(.red)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
    }
}


struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: .init(imageName: "nike", title: "Nike", description: "boots Nike 42 Red", price: "5 600"))
    }
}
