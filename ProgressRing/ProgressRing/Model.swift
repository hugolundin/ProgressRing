//
//  Model.swift
//  ProgressRing
//
//  Created by Hugo Lundin on 2019-06-16.
//  Copyright © 2019 Hugo Lundin. All rights reserved.
//

import Combine
import SwiftUI

public final class ProgressRing: BindableObject {
    public let id = UUID()
    public let didChange = PassthroughSubject<ProgressRing, Never>()
    
    /// The ring width, as an angle in radians.
    public var width: Length {
        didSet {
            self.didChange.send(self)
        }
    }
    
    /// Progress of the ring, as a decimal number.
    public var progress: Double {
        didSet {
            self.didChange.send(self)
        }
    }
    
    public var color: Color {
        didSet {
            self.didChange.send(self)
        }
    }
    
    public init(width: Length, progress: Double, color: Color) {
        self.width = width
        self.progress = progress
        self.color = color
    }
}
