//
//  ContentView.swift
//  ProgressRing
//
//  Created by Hugo Lundin on 2019-06-16.
//  Copyright © 2019 Hugo Lundin. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObjectBinding var moveRing: ProgressRing
    @ObjectBinding var exerciseRing: ProgressRing
    @ObjectBinding var standRing: ProgressRing
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                // MARK: - Rings view
                
                ZStack {
                    ProgressRingView(self.moveRing, in: geometry.frame(in: .local))
                    ProgressRingView(self.exerciseRing, in: geometry.frame(in: .local))
                    ProgressRingView(self.standRing, in: geometry.frame(in: .local))
                    }
                    .padding(.vertical, -200)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                
                
                // MARK: - Move ring
                
                Stepper(value: self.$moveRing.progress, in: 0...1, step: 0.05) { Text("Move goal")}
                    .padding(.horizontal, 20)
                
                Slider(value: self.$moveRing.progress, from: 0, through: 1, by: 0.01)
                    .padding(.horizontal, 20)
                
                
                // MARK: - Exercise ring
                
                Stepper(value: self.$exerciseRing.progress, in: 0...1, step: 0.05) { Text("Exercise goal")}
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                
                Slider(value: self.$exerciseRing.progress, from: 0, through: 1, by: 0.01)
                    .padding(.vertical, -40)
                    .padding(.horizontal, 20)
                
                // MARK: - Stand ring
                
                Stepper(value: self.$standRing.progress, in: 0...1, step: 0.05) { Text("Stand goal")}
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                
                Slider(value: self.$standRing.progress, from: 0, through: 1, by: 0.01)
                    .padding(.vertical, -40)
                    .padding(.horizontal, 20)
                
            }
        }.preferredColorScheme(.dark)
    }
}

