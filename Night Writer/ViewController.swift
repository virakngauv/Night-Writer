//
//  ViewController.swift
//  Night Writer
//
//  Created by Virak Ngauv on 1/22/18.
//  Copyright © 2018 Virak Ngauv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dotDisplay: UIImageView!
    var messageArray : [UIImage] = []
    var letters : [String] = []
    var number : Int = 1
    var frameNum : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        receiveTextInput()
        createMessage()
        displayMesasge()
    }
    
    
    //Format input variables
    //Take message input and put into array "HI HERO" -> "H,I,,H,E,R,O"
    //print("abcde"["abcde".startIndex] == "a")
    func receiveTextInput (){
//        letters.append(String(describing: inputText.text?[(inputText.text!.index(inputText.text!.startIndex, offsetBy: 0))]))
//        letters.append(String(describing: inputText.text?[(inputText.text!.index(inputText.text!.startIndex, offsetBy: 1))]))
//        letters.append(String(describing: inputText.text?[(inputText.text!.index(inputText.text!.startIndex, offsetBy: 2))]))
//        print(letters)
//        print("end of receiveTextInput")
        
    }
    
    
    //Takes the message input and loads up the message array
    //first displays 3 empty letters
    //then calls on the letter, then a space, then ends with
    //also needs a counter of how many images so the duration is correct
    func createMessage (){
        letters = ["h","i","_","h","e","r","o"]
        frameNum = 0
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        messageArray.append(UIImage(named: "red")!)
        
        for letter in letters {
            for i in 1...5 {
                messageArray.append(UIImage(named:"\(letter)\(i)")!)
                frameNum += 1
            }
            messageArray.append(UIImage(named:"_1")!)
            frameNum += 1
        }
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        messageArray.append(UIImage(named: "blue")!)
        
        // +20 frames for the red and blue
        frameNum += 20
    
//        messageArray.append(UIImage(named:"h1")!)
//        messageArray.append(UIImage(named:"h2")!)
//        messageArray.append(UIImage(named:"h3")!)
//        messageArray.append(UIImage(named:"h4")!)
//        messageArray.append(UIImage(named:"h5")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"e1")!)
//        messageArray.append(UIImage(named:"e2")!)
//        messageArray.append(UIImage(named:"e3")!)
//        messageArray.append(UIImage(named:"e4")!)
//        messageArray.append(UIImage(named:"e5")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"r1")!)
//        messageArray.append(UIImage(named:"r2")!)
//        messageArray.append(UIImage(named:"r3")!)
//        messageArray.append(UIImage(named:"r4")!)
//        messageArray.append(UIImage(named:"r5")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"o1")!)
//        messageArray.append(UIImage(named:"o2")!)
//        messageArray.append(UIImage(named:"o3")!)
//        messageArray.append(UIImage(named:"o4")!)
//        messageArray.append(UIImage(named:"o5")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
//        messageArray.append(UIImage(named:"_1")!)
////        messageArray.append(UIImage(named:"\(letters[1])\(number)")!)
////        messageArray.append(UIImage(named:"\(letters[0])\(number)")!)
    }
    
    //After message is created and put into array, use array to flash dots into the ImageView
    //
    func displayMesasge (){
        messageArray = messageArray + messageArray.reversed()
        let animatedMessage = UIImage.animatedImage(with: messageArray, duration: Double(frameNum)*2*(1/60))
        dotDisplay.image = animatedMessage
    }


}

