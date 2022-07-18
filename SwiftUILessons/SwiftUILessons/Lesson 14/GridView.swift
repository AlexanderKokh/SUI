//
//  GridView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 19.07.2022.
//

import SwiftUI

struct GridView: View {
    let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: nil,
                      pinnedViews: [.sectionHeaders]) {
                profileSection
                photoSection
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    var photoSection: some View {
        Section {
            ForEach(0..<50) { index in
                Image("puma")
                    .resizable()
                    .frame(height: 150)
            }
        } header: {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "grid")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "tv")
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "video")
                }

            }
            .frame(height: 50)
            .padding(.top, 30)
            .background(.white)
        }

    }
    
    var profileSection: some View {
        Section {
            VStack {
                Image("nike")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                Text("NIKE")
                    .fontWeight(.bold)
            }
            VStack {
                Text("150")
                    .fontWeight(.bold)
                Text("Подписчики")
                    .fontWeight(.bold)
            }
            VStack {
                Text("120")
                    .fontWeight(.bold)
                Text("Подписки")
                    .fontWeight(.bold)
            }
        } header: {
            HStack {
                Spacer()
                Text("Boots")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.top, 30)
            .background(.white)
        }

    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
