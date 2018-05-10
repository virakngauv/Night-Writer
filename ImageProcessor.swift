//
//  ImageProcessor.swift
//  Night Writer
//
//  Created by Virak Ngauv on 5/10/18.
//  Copyright © 2018 Virak Ngauv. All rights reserved.
//

import UIKit

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

class ImageProcessor : UIImage {
    func convertLetterToDot (_ letter:String) -> UIImage {
        var dotImage = UIImage()
        
        let screenWidth : CGFloat = UIScreen.main.bounds.width
        let screenHeight : CGFloat = UIScreen.main.bounds.height
        
        print("I'm inside the ImageProcessor called \(self)")
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200))
        UIColor.orange.setFill()
        path.fill()
        path.move(to: CGPoint(x: screenWidth/2, y: screenHeight/14))
        
        dotImage = view.asImage()
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        
        dotImage = view.asImage()
        
        
        
        return dotImage
    }
}


