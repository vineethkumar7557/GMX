//
//  EnvelopeViews.swift
//  GMX Tech task
//
//  Created by vineeth on 24/12/19.
//  Copyright © 2019 vineeth. All rights reserved.
//

import UIKit

class EnvelopeViews: UIView {
    
    override func draw(_ rect: CGRect) {
        
       drawViews()
        
    }
    
        lazy var firstView: UIView = {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let topView = UIView()
        topView.frame = CGRect(x: 0, y: 0 - ((height*25 / 100) / 2), width: width, height: height*35 / 100)
        topView.backgroundColor = .darkGray
        topView.alpha = 0.4
        topView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        topView.isUserInteractionEnabled = false
        
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "diamond")
        logoImage.frame.size = CGSize(width: 30, height: 30)
        logoImage.center = CGPoint(x: width / 2, y: (height*35 / 100) / 2)
        logoImage.alpha = 0.4
        logoImage.contentMode = .scaleAspectFit
        topView.addSubview(logoImage)
        
        topView.bezierPathLayer(path: topBezeirPath(width: width, height: height))
        return topView
    }()
    
    
    lazy var secondView: UIView = {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let leftView = UIView()
        leftView.frame = CGRect(x: 0 - (((width/2) - 1) / 2), y: 0 , width: ((width/2) - 1), height: height)
        leftView.backgroundColor = .darkGray
        leftView.alpha = 0.4
        leftView.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        leftView.isUserInteractionEnabled = false
        
        leftView.bezierPathLayer(path: leftBezeirPath(width: width, height: height))
        return leftView
    }()
    
    lazy var thirdView: UIView = {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let bottomView = UIView()
        bottomView.frame = CGRect(x: 0, y: height - ((height*35 / 100) / 2), width: width, height: (height*35 / 100))
        bottomView.backgroundColor = .darkGray
        bottomView.alpha = 0.4
        bottomView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        bottomView.isUserInteractionEnabled = false
        
        bottomView.bezierPathLayer(path: bottomBezeirPath(width: width, height: height))
        return bottomView
    }()
    
    lazy var fourthView: UIView = {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let rightView = UIView()
        rightView.frame = CGRect(x: width - (((width/2) - 1) / 2), y: 0 , width: ((width/2) - 1), height: height)
        rightView.backgroundColor = .darkGray
        rightView.alpha = 0.4
        rightView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        rightView.isUserInteractionEnabled = false
        
        rightView.bezierPathLayer(path: rightBezeirPath(width: width, height: height))
        return rightView
    }()

    func drawViews()
    {
        self.addSubview(firstView)
        self.addSubview(secondView)
        self.addSubview(thirdView)
        self.addSubview(fourthView)
    }
    
    // opening envolope animation
    func openEnvelop() {
        
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / 2000.0;
        
        UIView.animate(withDuration: 0.5,delay: 0.0,options: [.curveEaseOut],animations:  {
            
            self.firstView.layer.transform =  CATransform3DRotate(transform, CGFloat(-135 * Double.pi / 180), 1, 0, 0)
            self.secondView.layer.transform = CATransform3DRotate(transform, CGFloat(-135 * Double.pi / 180), 0, 1, 0)
            self.thirdView.layer.transform =  CATransform3DRotate(transform, CGFloat(-135 * Double.pi / 180), 1, 0, 0)
            self.fourthView.layer.transform = CATransform3DRotate(transform, CGFloat(-135 * Double.pi / 180), 0, 1, 0)
        })
        
    }
}
