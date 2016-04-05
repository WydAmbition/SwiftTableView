//
//  CycleView.swift
//  SwiftTableView
//
//  Created by wangyadong on 15/12/21.
//  Copyright © 2015年 wangyadong. All rights reserved.
//

import UIKit




class CycleView: UIView {

    var fontSize:CGFloat = 25
    var lineSize:CGFloat = 8
    var process:CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        
        
    }
    
    
    @IBInspectable var  progress:CGFloat{
        get{
            return process
        }
        set(newval) {
            let val = newval*3.6
            self.process = val
            setNeedsDisplay()
        }
    }
    
    override func drawRect(rect: CGRect) {
        
        let context :CGContextRef = UIGraphicsGetCurrentContext()!;
        //移动坐标
        let x = frame.size.width/2
        let y = frame.size.height/2
        _ = CGPointMake(x,y)
        
        let font:UIFont! = UIFont.systemFontOfSize(fontSize)
        let textAttributes: [String: AnyObject] = [
            NSForegroundColorAttributeName : UIColor.redColor(),
            NSFontAttributeName:font
        ]
        let showp = process/3.6
        
        let str = NSAttributedString(string: "\(Int(showp))%", attributes: textAttributes)
        
        let size:CGSize = str.size()
        
        let stry:CGFloat = y-(size.height/2)
        let stryend:CGFloat = y+(size.height/2)
        str.drawAtPoint(CGPointMake(x-(size.width/2),stry-5))
        let tips:NSString = "保本保收益"
        let textAttributes2: [String: AnyObject] = [
            NSForegroundColorAttributeName : UIColor(white: 0.0, alpha: 1.0),
            NSFontAttributeName : UIFont.systemFontOfSize(fontSize/2)
        ]
        let tipsSize:CGSize = tips.sizeWithAttributes(textAttributes2)
        
        tips.drawAtPoint(CGPointMake(x-(tipsSize.width/2), stryend), withAttributes: textAttributes2)
        //灰色圆圈
        let radius = frame.size.width/2-20
        
        CGContextSetLineWidth(context, 2)
        
        CGContextSetStrokeColorWithColor(context,UIColor.greenColor().CGColor)
        CGContextAddArc(context, x, y, radius-4, 0, 360, 0)
        //kCGPathStroke
        CGContextDrawPath(context, .Stroke)
        
        //两个圆圈
        CGContextSetLineWidth(context, lineSize)
        
        CGContextSetStrokeColorWithColor(context, UIColor.yellowColor().CGColor)
        CGContextAddArc(context, x, y, radius, 0, 360, 0)
        CGContextDrawPath(context, .Stroke)
        
        //
        CGContextSetStrokeColorWithColor(context,  UIColor.redColor().CGColor)
        process  = process * CGFloat(M_PI/180.0)
        CGContextAddArc(context, x, y, radius,0, process, 0)
        
        CGContextDrawPath(context, .Stroke)
        
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    
}
