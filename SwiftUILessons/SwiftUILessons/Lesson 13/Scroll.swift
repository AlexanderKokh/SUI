//
//  Scroll.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 15.07.2022.
//

import SwiftUI

struct ScrollView_Content: View {
    var body: some View {
        VStack {
            headerView
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<3, id: \.self) { _ in
                            cardView
                        }
                    }
                }
                ForEach(1..<10, id: \.self) { _ in
                    paymentView
                }
                Spacer()
                    .frame(height: 150)
            }
            .background(.white)
            .cornerRadius(20)
            .offset(y: 20)
        }
        .background(
            Color.black
                .ignoresSafeArea(.all, edges: .all)
        )
    }
    
    var headerView: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Мои карты")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "bell.and.waveform.fill")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 20, height: 20, alignment: .topTrailing)
        }
    }
    
    var paymentView: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("VISA")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.trailing, 5)
            VStack(alignment: .leading) {
                Text("Apple")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("30.03.2022")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.light)
            }
            Spacer()
            Text("+100$")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .padding(.horizontal)
    }
    
    var cardView: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(colors: [.black.opacity(0.9), Color.black], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: UIScreen.main.bounds.width - 30, height: 180)
            cardItemView
        }
        .padding()
    }
    
    var cardItemView: some View {
        VStack(alignment: .leading) {
            Text("Bank")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
            HStack {
                ForEach(1...5, id: \.self) { _ in
                    Circle()
                    .fill(.white)
                    .frame(width: 6, height: 6, alignment: .bottom)
                }
                Text("5674")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                Text("VISA")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .frame(height: 110, alignment: .bottom)
        }
        .padding()
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView_Content()
    }
}
