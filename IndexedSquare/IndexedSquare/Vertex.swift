//
//  Vertex.swift
//  IndexedSquare
//
//  Created by Fei Yuan on 2021/2/26.
//

import Foundation
import GLKit


enum VertexAttributes:GLuint {
    case position = 0
}

struct Vertex {
    var x:GLfloat = 0.0
    var y:GLfloat = 0.0
    var z:GLfloat  = 0.0
    
    init(_ x:GLfloat, _ y:GLfloat, _ z:GLfloat) {
        self.x = x
        self.y = y
        self.z = z
    }
}
