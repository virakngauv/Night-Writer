//
//  ImageProcessor.swift
//  Night Writer
//
//  Created by Virak Ngauv on 5/10/18.
//  Copyright © 2018 Virak Ngauv. All rights reserved.
//

import UIKit
import SwiftyJSON

class ImageProcessor : UIImage {
    func convertLetterToDot (_ letter:String, _ view:UIView) -> [UIImage] {
        //start JSON experiment
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "letterJSON", ofType: "json")!)
        var string = String()
        do {string = try String(contentsOf: url)} catch {print(error)}
        let datafromJSON = string.data(using: .utf8, allowLossyConversion: false)

        
        //end JSON experiment
        
        
        var dotImage = UIImage()
        var dotArray : [UIImage] = []
        
        let viewWidth : CGFloat = view.frame.width
        let viewHeight : CGFloat = view.frame.height
        
        print("I'm inside the ImageProcessor called \(self)")
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        //let path = CGMutablePath()
        
        let dotPosition = viewHeight/7
        
        let dotSize : CGFloat = viewWidth/5
        let dotBuffer = (viewHeight-dotSize*7)/16
        
        //0 to 6 will change to "for each position in [position] with [position] being the dictionary with which dots are highlighted
//        let m3Array : [Int] = [2, 3]
//        for i in m3Array {
//            path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
//        }
//        for i in 0...6 {
//            path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
//        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.fillRule = kCAFillRuleNonZero

        do {
            let json = try JSON(data: datafromJSON!)
            for j in 0...4 {
                view.layer.sublayers = nil
                let path = CGMutablePath()

                for i in json[letter][j] {
                    path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i.1.doubleValue-1.0)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
                    print("j, i is : \(j) , \(i.1.doubleValue)")
                }
                
                shapeLayer.path = path
                view.layer.addSublayer(shapeLayer)
                dotImage = view.asImage()
                dotArray.append(dotImage)
                
                print("j is currently: \(j)")
            }
        } catch {print("error printing string \(error)")}
        
        
        return dotArray
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}


