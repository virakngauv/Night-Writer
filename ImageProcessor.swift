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
        //Initialize dictionary as JSON object from "letterJSON.json" file
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "letterJSON", ofType: "json")!)
        var string = String()
        do {string = try String(contentsOf: url)} catch {print(error)}
        let datafromJSON = string.data(using: .utf8, allowLossyConversion: false)
        
        //Initialize dotImage and dotArray to allow for passing back the array of images
        var dotImage = UIImage()
        var dotArray : [UIImage] = []
        
        //Initialize view in which path and sublayers will draw the frames of the dotArray
        let viewWidth : CGFloat = view.frame.width
        let viewHeight : CGFloat = view.frame.height
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.fillRule = kCAFillRuleNonZero
        
        //Characteristics of LED dots. Buffer is to make the dots final position centered on view.
        let dotPosition = viewHeight/7
        let dotSize : CGFloat = viewWidth/5
        let dotBuffer = (viewHeight-dotSize*7)/16
        

        //Uses JSON dictionary to convert string-letter into dot array.
        //Always adds 5 + 1 frames to the total (5 frames of the letter, 1 frame blank for spacing between letters)
        do {
            let json = try JSON(data: datafromJSON!)
            for j in 0...4 {
                view.layer.sublayers = nil
                let path = CGMutablePath()

                for i in json[letter][j] {
                    path.addEllipse(in: CGRect(x: (viewWidth-dotSize)/2, y: (CGFloat(i.1.doubleValue-1.0)*dotPosition)+dotBuffer, width: dotSize, height: dotSize))
                }
                
                shapeLayer.path = path
                view.layer.addSublayer(shapeLayer)
                dotImage = view.asImage()
                dotArray.append(dotImage)
            }
        } catch {print("error printing string \(error)")}
        
        //Add blank image at the end of the array to add a "space" between letters
        view.layer.sublayers = nil
        dotImage = view.asImage()
        dotArray.append(dotImage)
        
        return dotArray
    }
    
    func addRedCalibrationBar (_ view: UIView) -> [UIImage] {
        //Initialize function variables
        var barImage = UIImage()
        var barArray : [UIImage] = []
        
        //Initialize view in which path and sublayers will draw the frames of the dotArray
        let viewWidth : CGFloat = view.frame.width
        let viewHeight : CGFloat = view.frame.height
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.fillRule = kCAFillRuleNonZero
        
        //Create bar image and add to barArray
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: viewWidth/5, height: viewHeight))
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
        barImage = view.asImage()
        
        
        for _ in 1...10 {
            barArray.append(barImage)
        }
        
        //Wipe "view" clean because view is shared between drawing dots and calibration bars.
        view.layer.sublayers = nil
        return barArray
    }
    
    func addBlueCalibrationBar (_ view: UIView) -> [UIImage] {
        //Initialize function variables
        var barImage = UIImage()
        var barArray : [UIImage] = []
        
        //Initialize view in which path and sublayers will draw the frames of the dotArray
        let viewWidth : CGFloat = view.frame.width
        let viewHeight : CGFloat = view.frame.height
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.fillRule = kCAFillRuleNonZero
        
        //Create bar image and add to barArray
        let path = CGMutablePath()
        path.addRect(CGRect(x: viewWidth*4/5, y: 0, width: viewWidth/5, height: viewHeight))
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
        barImage = view.asImage()
        
        for _ in 1...10 {
            barArray.append(barImage)
        }
        
        //Wipe "view" clean because view is shared between drawing dots and calibration bars.
        view.layer.sublayers = nil
        return barArray
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


