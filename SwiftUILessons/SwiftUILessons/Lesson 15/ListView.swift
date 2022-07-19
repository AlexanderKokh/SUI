//
//  ListView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 19.07.2022.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    let imageName: String
    let title: String
    let description: String
    let price: String
}

struct ListView: View {
    
    var products: [Product] =  [
        .init(imageName: "nike", title: "Nike", description: "red", price: "5 600"),
        .init(imageName: "puma", title: "Puma", description: "new", price: "3 200"),
        .init(imageName: "reebok", title: "Reebok", description: "black", price: "8 670")
    ]
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                NavigationLink {
                    ProductItemView(product: product)
                } label: {
                    makeProductCellView(product: product)
                }
                // c 15 iOS
                .listRowSeparator(.hidden)
                // c 15 iOS
                .swipeActions(edge: .leading) {
                    Button {
                        print(#function)
                    } label: {
                        Image(systemName: "star")
                    }
                    .tint(.yellow)
                }
            }
            // c 15 iOS
            .refreshable {
                print("refresh")
            }
            // c 15 iOS
            .toolbar {
                EditButton()
            }
            .navigationTitle("Sport boots")
        }
    }
    
    func makeProductCellView(product: Product) -> some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.description)
                    .foregroundColor(.gray)
                    .font(.caption2)
                    .fontWeight(.light)
                    .padding(.bottom)
                Text(product.price)
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
