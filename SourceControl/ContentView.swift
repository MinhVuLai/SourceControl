//
//  ContentView.swift
//  SourceControl
//
//  Created by Minh Vu Lai on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .foregroundStyle(Color(UIColor.systemBackground))
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(animate ? secondaryAccentColor : Color.accentColor)
                .cornerRadius(15)
        }
        .padding(.horizontal, animate ? 30 : 50)
        .shadow(
            color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
            radius: animate ? 30 : 10,
            y: animate ? 50 : 30
        )
        .scaleEffect(animate ? 1.1 : 1.0)
        .offset(y: animate ? -7 : 0)
        .onAppear(perform: addAnimation)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
