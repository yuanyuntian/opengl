//
//  ViewController.swift
//  GLK2
//
//  Created by Fei Yuan on 2021/2/23.
//

import UIKit

class ViewController: UIViewController {

    private let openGLView = OpenGLView()
    private var displayLink: CADisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        openGLView.frame = view.bounds
        
        view.addSubview(openGLView)
        
        displayLink = CADisplayLink(target: self, selector: #selector(drawFrame))
        displayLink?.add(to: .main, forMode: .default)
    }

    @objc private func drawFrame() {
        openGLView.display()
    }
    
}

