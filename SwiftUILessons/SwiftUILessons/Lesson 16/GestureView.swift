//
//  GestureView.swift
//  SwiftUILessons
//
//  Created by Александр Кох on 19.07.2022.
//

import SwiftUI
import CoreMedia


struct TapView: View {
    @State var tapped = false
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                tapped.toggle()
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .green : .red)
                .frame(width: 100, height: 100)
            Text("Tap")
        }
        .gesture(tap)
    }
}

struct LongTapView: View {
    @State var tapped = false
    
    var tap: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .onEnded { _ in
                tapped.toggle()
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .green : .red)
                .frame(width: 100, height: 100)
            Text("LongTapView")
        }
        .gesture(tap)
    }
}

struct DragView: View {
    @State var isDragging = false
    @State var currentOffseX: CGFloat = 0
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ value in
                withAnimation {
                    currentOffseX = value.translation.width
                    isDragging.toggle()
                }
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    isDragging.toggle()
                    currentOffseX = 0
                }
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isDragging ? .green : .red)
                .frame(width: 100, height: 100)
            Text("DragTapView")
        }
        .offset(x: currentOffseX)
        .gesture(drag)
    }
}

struct Magnificationiew: View {
    @State var scale: CGFloat = 1
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                scale = value
            }
            .onEnded { _ in
                scale = 1
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 100, height: 100)
            Text("magnification")
        }
        .scaleEffect(scale)
        .gesture(magnification)
    }
}

struct Rotationiew: View {
    @State var angle = Angle(degrees: 0.0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { value in
                angle = value
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    angle = Angle(degrees: 0.0)
                }
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 100, height: 100)
            Text("rotation")
        }
        .rotationEffect(angle)
        .gesture(rotation)
    }
}

struct SequencedView: View {
    @State var tapped = false
    @State var isDragging = false
    @State var currentOffseX: CGFloat = 0
    
    var long: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .onEnded { _ in
                tapped.toggle()
            }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{ value in
                withAnimation {
                    currentOffseX = value.translation.width
                    isDragging.toggle()
                }
            }
            .onEnded { _ in
                withAnimation(.spring()) {
                    isDragging.toggle()
                    currentOffseX = 0
                    tapped.toggle()
                }
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(tapped ? .red : .blue)
                .frame(width: 100, height: 100)
            Text("long + drag")
        }
        .offset(x: currentOffseX)
        .gesture(long.sequenced(before: drag))
    }
}

struct GestureView: View {
    var body: some View {
        // TapView()
        // LongTapView()
        // DragView()
        // Magnificationiew()
        // Rotationiew()
        SequencedView()
    }
}


struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
