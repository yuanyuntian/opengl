//
//  OpenGLView.swift
//  GLK2
//
//  Created by Fei Yuan on 2021/2/23.
//

import UIKit

class OpenGLView: UIView {

    private var context:CVEAGLContext?
    private var frameBuffer = GLuint()
    private var colorRenderBuffer = GLuint()
    
    override class var layerClass: AnyClass {
        return CAEAGLLayer.self
    }
    
    private var eagllayer:CAEAGLLayer{
        return (layer as? CAEAGLLayer)!
    }

}
