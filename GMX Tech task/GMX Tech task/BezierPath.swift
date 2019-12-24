//
//  BezierPath.swift
//  GMX Tech task
//
//  Created by vineeth on 24/12/19.
//  Copyright © 2019 vineeth. All rights reserved.
//

import UIKit

func topBezeirPath(width: CGFloat, height: CGFloat) -> UIBezierPath
{
    let topPath = UIBezierPath()
    topPath.move(to: CGPoint(x: 3, y: 0))
    topPath.addLine(to: CGPoint(x: width - 3, y: 0))
    topPath.addLine(to: CGPoint(x: (width / 2) + 10, y: (height*35 / 100) - 10))
    topPath.addCurve(to: CGPoint(x: (width / 2) - 10, y: (height*35 / 100) - 10), controlPoint1: CGPoint(x: width / 2, y: (height*35 / 100) - 5), controlPoint2: CGPoint(x: width / 2, y: (height*35 / 100) - 5))
    topPath.close()
    
    return topPath
    
}

func rightBezeirPath(width: CGFloat, height: CGFloat) -> UIBezierPath
{
    let rightPath = UIBezierPath()
    rightPath.move(to: CGPoint(x: ((width/2) - 1), y: 3))
    rightPath.addLine(to: CGPoint(x: 0, y: height / 3.1))
    rightPath.addLine(to: CGPoint(x: 0, y: height / 1.55))
    rightPath.addLine(to: CGPoint(x: ((width/2) - 1), y: height - 3))
    rightPath.close()
    
    return rightPath
    
}

func bottomBezeirPath(width: CGFloat, height: CGFloat) -> UIBezierPath
{
    let bottomPath = UIBezierPath()
    bottomPath.move(to: CGPoint(x: 3, y: height*35 / 100))
    bottomPath.addLine(to: CGPoint(x: width - 3, y: height*35 / 100))
    bottomPath.addLine(to: CGPoint(x: (width / 2) + 10, y: 5))
    bottomPath.addCurve(to: CGPoint(x: (width / 2) - 10, y: 5), controlPoint1: CGPoint(x: (width / 2), y: 0), controlPoint2: CGPoint(x: (width / 2), y: 0))
    bottomPath.close()
    
    return bottomPath
}

func leftBezeirPath(width: CGFloat, height: CGFloat) -> UIBezierPath
{
    let leftPath = UIBezierPath()
    leftPath.move(to: CGPoint(x: 0, y: 3))
    leftPath.addLine(to: CGPoint(x: ((width/2) - 1), y: height / 3.1))
    leftPath.addLine(to: CGPoint(x: ((width/2) - 1), y: height / 1.55))
    leftPath.addLine(to: CGPoint(x: 0, y: height - 3))
    leftPath.close()
    
    return leftPath
}
