//
//  ViewController.swift
//  Canvas
//
//  Created by WilliamDevine on 9/29/14.
//  Copyright (c) 2014 WilliamDevine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var arrowImage: UIImageView!
    
    var origin:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayView.frame.origin.y = 530
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    
        
    }

    @IBAction func onTrayPan(gestureRecognizer: UIPanGestureRecognizer) {
        
        var location = gestureRecognizer.locationInView(view).y
        var velocity = gestureRecognizer.velocityInView(view).y
        var translation = gestureRecognizer.translationInView(view).y
        var rotationAmount : Float = 0.0
        
        println(translation)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            origin = trayView.frame.origin.y
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            var newOrigin = origin + translation
            if trayView.frame.origin.y < 371 {
                trayView.frame.origin.y = 371 + translation/10
            } else {
                trayView.frame.origin.y = newOrigin
            }
            

            
            arrowImage.transform = CGAffineTransformRotate(arrowImage.transform, CGFloat(Double(rotationAmount) * M_PI / 180))
            
        println("rotation amount \(rotationAmount)")
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if velocity > 0 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.trayView.frame.origin.y = 530
                    }, completion: { (finished:Bool) -> Void in
                    // nothing
                })
                
            } else if velocity < 0 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.trayView.frame.origin.y = 371
                    }, completion: { (finished:Bool) -> Void in
                        // nothing
                })
            }
        }
    }
    
    @IBAction func onSadPan(gestureRecognizer: UIPanGestureRecognizer) {
      handlePan(gestureRecognizer)
        
    }
    
    @IBAction func onExcitedPan(gestureRecognizer: UIPanGestureRecognizer) {
        handlePan(gestureRecognizer)
        
    }
    
    @IBAction func onHappyPan(gestureRecognizer: UIPanGestureRecognizer) {
        handlePan(gestureRecognizer)

    }
    
    func handlePan(gestureRecognizer: UIPanGestureRecognizer){
    
        println("happy")
        var location = gestureRecognizer.locationInView(view).y

        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var existingImage = gestureRecognizer.view as UIImageView
            var newImage = UIImageView(frame: existingImage.frame)
            newImage.image = existingImage.image
            newImage.userInteractionEnabled = true
            view.addSubview(newImage)
            
            println(location)
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {

        
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            
        }
        
            
            
    }

}


