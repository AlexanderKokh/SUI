//
//  Navigations+Extension.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 29.07.2022.
//

import SwiftUI

struct NavigationModifire<Destination>: ViewModifier where Destination: View {
    let destination: Destination
    let isActive: Binding<Bool>
    
    init(
        destination: Destination,
        isActive: Binding<Bool>
    ) {
        self.destination = destination
        self.isActive = isActive
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destination, isActive: isActive) {
                    EmptyView()
                }
                    .hidden()
            )
    }
}

struct NavigationModelModifire<Destination: View, Model: Any>: ViewModifier {
    let model: Model?
    let isActive: Binding<Bool>
    let destinationHandler: ((Model) -> (Destination))?
    
    private var destinationView: some View {
        Group {
            if let model = model,
               let view = destinationHandler?(model) {
                view
            } else {
                EmptyView()
            }
        }
    }
    
    init(
        model: Model?,
        isActive: Binding<Bool>,
        destinationHandler: @escaping (Model) -> (Destination)
    ) {
        self.model = model
        self.isActive = isActive
        self.destinationHandler = destinationHandler
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: destinationView, isActive: isActive) {
                    EmptyView()
                }
                    .hidden()
            )
    }
}

extension View {
    func navigation<Destination: View>(destination: Destination, isActive: Binding<Bool>) -> some View {
        modifier(NavigationModifire(destination: destination, isActive: isActive))
    }
    
    func navigation<Destination: View, Model: Any>(model: Model?, isActive: Binding<Bool>, destinationHandler: @escaping (Model) -> (Destination)) -> some View {
        modifier(NavigationModelModifire(model: model, isActive: isActive, destinationHandler: destinationHandler))
    }
}
