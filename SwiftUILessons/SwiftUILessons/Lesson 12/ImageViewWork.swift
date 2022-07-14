//
//  ImageViewWork.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 15.07.2022.
//

import SwiftUI

struct ImageView: View {
    
    let image = UIImage(named: "nike") ?? UIImage()
    
    var logoImageView: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.white, lineWidth: 5)
            )
            .shadow(radius: 10)
            .offset(y: -120)
            .padding(.bottom, -120)
    }
    
    var asyncImageView: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/401")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .accentColor(.green)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            case .failure(let error):
                VStack {
                    Image(systemName: "questionmark")
                    Text(error.localizedDescription)
                        .font(.headline)
                }
            @unknown default:
                fatalError()
            }
        }
    }
    
    var backGroundImageView: some View {
        Image("nikeLogo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .ignoresSafeArea(.all, edges: .top)
    }
    
    var body: some View {
        VStack {
            backGroundImageView
            logoImageView
            Text("Кроссовки")
                .foregroundColor(.white)
                .fontWeight(.bold)
            asyncImageView
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            VStack {
                LinearGradient(colors: [.purple, .purple.opacity(0.2)], startPoint: .top, endPoint: .bottom)
            }
                .ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
