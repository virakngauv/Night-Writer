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
    func convertLetterToDot (_ letter:String, _ view:UIView) -> [UIImage] {
        var dotImage = UIImage()
        var dotArray : [UIImage] = []
        
        let viewWidth : CGFloat = view.frame.width
        let viewHeight : CGFloat = view.frame.height
        
        print("I'm inside the ImageProcessor called \(self)")
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        let path = CGMutablePath()
        
        let dotPosition = viewHeight/7
        
        let dotSize : CGFloat = viewWidth/5
        let dotBuffer = (viewHeight-dotSize*7)/16
        
        //0 to 6 will change to "for each position in [position] with [position] being the dictionary with which dots are highlighted
        let m3Array : [Int] = [2, 3]
        for i in m3Array {
            path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
        }
//        for i in 0...6 {
//            path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
//        }

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.fillRule = kCAFillRuleNonZero
        path.move(to: CGPoint(x: viewWidth/2, y: viewHeight/14))
        
        dotImage = view.asImage()
        
        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        
        dotImage = view.asImage()
        
        //append dotImage to dotArray
        dotArray.append(dotImage)
        
        return dotArray
    }
}


