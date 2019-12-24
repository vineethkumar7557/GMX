//
//  ViewController.swift
//  GMX Tech task
//
//  Created by vineeth on 24/12/19.
//  Copyright © 2019 vineeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var buttonArray = [UIButton]()
    var envelopeViews = EnvelopeViews()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blurEffect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardsToBeThrown(noOfCards: 10)
        
    }
    
    func blurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }

    func cardsToBeThrown(noOfCards cards: Int) {
        for i in 0..<cards
        {
            let randomNumberX = CGFloat(arc4random_uniform(350))
            let randomNumberY = CGFloat(arc4random_uniform(700))
            let cardButton = UIButton()
            cardButton.setImage(#imageLiteral(resourceName: "cardimg"), for: .normal)
            cardButton.center = AnimationManager.bottomCenter
            
            UIView.animate(withDuration: 1, animations: {
                cardButton.frame = CGRect(x: randomNumberX, y: randomNumberY, width: 200, height: 200)
                self.envelopeViews = EnvelopeViews(frame: cardButton.bounds)
                cardButton.addSubview(self.envelopeViews)
                cardButton.transform = CGAffineTransform(rotationAngle: CGFloat(randomNumberX))
            }, completion: nil)
            cardButton.tag = i
            cardButton.addTarget(self, action: #selector(cardButtonPressed), for: .touchUpInside)
            self.view.addSubview(cardButton)
            buttonArray.append(cardButton)
            
        }
    }
    
    @objc func cardButtonPressed(sender: UIButton)
    {
        self.removingButtons(button: sender)
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut], animations: {
            sender.transform = CGAffineTransform(rotationAngle: 0)
            sender.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            sender.center = self.view.center
        }) { (completed) in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseOut], animations: {
                sender.transform = CGAffineTransform(scaleX: 1.8 , y: 1.8)
            }, completion: { (completed) in
                self.shakeAnimation(for: sender)
                self.envelopeViews.openEnvelop()
            })
        }
    }
    
    //Mark:- removing buttons
    
    func removingButtons(button: UIButton) {
        for i in 0..<buttonArray.count
        {
            if i != button.tag
            {
                UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut], animations: {
                    self.buttonArray[i].transform = CGAffineTransform(rotationAngle: 720)
                    self.buttonArray[i].center = AnimationManager.bottomCenter
                    self.buttonArray[i].alpha = 0
                }, completion: nil)
                
            }
        }
    }
    
    // Shake animation
    func shakeAnimation(for button: UIButton) {
        let shakeAnimation = CABasicAnimation(keyPath: "Position")
        shakeAnimation.duration = 2
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        
        let fromPoint = CGPoint(x: button.center.x - 10, y: button.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: button.center.x + 10, y: button.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shakeAnimation.fromValue = fromValue
        shakeAnimation.toValue = toValue
        
        button.layer.add(shakeAnimation, forKey: nil)
    }
    

}

class AnimationManager {

    class var screenBounds: CGRect{
        return UIScreen.main.bounds
    }

    class var bottomCenter: CGPoint{
        return CGPoint(x: screenBounds.midX, y: screenBounds.maxY)
    }

}

extension UIView {
    func bezierPathLayer(path: UIBezierPath)
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.masksToBounds = false
        self.layer.mask = shapeLayer
        
    }
}
