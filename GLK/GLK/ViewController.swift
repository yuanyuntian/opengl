//
//  ViewController.swift
//  GLK
//
//  Created by Fei Yuan on 2021/2/23.
//

import UIKit
import GLKit
class ViewController: GLKViewController {

    var glkView:GLKView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.glkView = self.view as? GLKView
        
        self.glkView.context = EAGLContext(api: .openGLES2)!
    }
    
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(1.0,0.0,0.0,1.0)
        
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
    }


}

