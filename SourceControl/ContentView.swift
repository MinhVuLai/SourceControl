//
//  ContentView.swift
//  SourceControl
//
//  Created by Minh Vu Lai on 7/6/24.
//

/*
 COMMIT MESSAGES
 
 NEW FEATURE:
 [Feature] Description of the feature
 
 BUG IN PRODUCTION:
 [Patch] Description of patch
 
 BUG NOT IN PRODUCTION:
 [Bug] Description of the bug
 
 MUNDANE TASKS:
 [Clean] Description of changes
 
 RELEASE:
 [Release] Description of release
 */

import SwiftUI

struct ContentView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let titles = ["love", "race", "home"]
    let systemImages = ["heart.fill", "flag.checkered", "house.fill"]
    
    var body: some View {
        VStack(spacing: 50) {
            
            Spacer()
            
            Image(systemName: "gear")
                .resizable()
                .scaledToFit()
                .frame(width: animate ? 200 : 100, height: animate ? 200 : 100)
                .foregroundStyle(animate ? secondaryAccentColor : Color.accentColor)
            
            Spacer()
            
            ForEach(0..<3) { index in
                Label(titles[index].uppercased(), systemImage: systemImages[index])
                    .foregroundStyle(Color(UIColor.systemBackground))
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(15)
            }
            .padding(.horizontal, animate ? 50 : 70)
            .shadow(
                color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                radius: animate ? 30 : 10,
                y: animate ? 50 : 30
            )
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? -7 : 0)
            
            Spacer()
        }
        .onAppear(perform: addAnimation)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
