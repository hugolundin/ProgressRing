//
//  ProgressRingView.swift
//  ProgressRing
//
//  Created by Hugo Lundin on 2019-06-16.
//  Copyright © 2019 Hugo Lundin. All rights reserved.
//

import Combine
import SwiftUI

struct ProgressRingView: View {
    
    /// Data model for `ProgressRingView`.
    @ObjectBinding var progressRing: ProgressRing
    
    /// `CGRect` to render the view in.
    private let rect: CGRect
    
    /// `CGPoint` telling where the center is in `rect`.
    private let center: CGPoint
    
    /// Radius of the `ProgressRingView`.
    /// Calculated from `Progressring.width`.
    private let radius: CGFloat
    
    /// `Angle` to start rendering the circle at.
    private let startAngle: Angle = Angle(degrees: -90)
    
    /// `Angle` to stop rendering the circle at.
    /// Calculated from `ProgressRing.progress`.
    private let endAngle: Angle
    
    init(_ progressRing: ProgressRing, in rect: CGRect) {
        self.progressRing = progressRing
        self.rect = rect
        self.center = CGPoint(x: rect.midX, y: rect.midY)
        self.radius = progressRing.width / 2
        self.endAngle = startAngle + Angle(
            degrees: 360 * progressRing.progress
        )
    }
    
    var body: some View {
        
        ZStack {
            Path { path in
                path.addArc(
                    center: self.center,
                    radius: self.radius,
                    startAngle: self.startAngle,
                    endAngle: Angle(degrees: 360),
                    clockwise: false
                )
                }
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(self.progressRing.color)
                .opacity(0.2)
            
            
            Path { path in
                path.addArc(
                    center: self.center,
                    radius: self.radius,
                    startAngle: self.startAngle,
                    endAngle: self.endAngle,
                    clockwise: false
                )
                }
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(self.progressRing.color)
        }
    }
}
