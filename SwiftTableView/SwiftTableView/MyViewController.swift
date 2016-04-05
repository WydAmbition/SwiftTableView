//
//  MyViewController.swift
//  SwiftTableView
//
//  Created by wangyadong on 15/12/14.
//  Copyright © 2015年 wangyadong. All rights reserved.
//

import UIKit
import LocalAuthentication
let ios8Last = Float(UIDevice.currentDevice().systemVersion) >= 8.0 ? true : false

class MyViewController: UIViewController {


    
    //没有返回值得闭包属性
    var myback:((() -> Void)?)
    //有返回值有参数的闭包属性
    var mySecond:(((secondName:String) -> String)?)
    var touchBtn : UIButton!

    var backImg : UIImage!
    var name :String!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        let backBtn : UIButton = UIButton(type: UIButtonType.RoundedRect)
        backBtn.frame = CGRectMake(0, 0, 44, 44)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.addTarget(self, action: "barBackDown", forControlEvents: UIControlEvents.TouchUpInside)
        let leftbar = UIBarButtonItem(customView: backBtn)
        self.navigationItem.setLeftBarButtonItem(leftbar, animated: true)
        
//        if ios8Last{
//        
//            let backImgView : UIImageView = UIImageView(frame: self.view.bounds)
//            self.view.addSubview(backImgView)
//            backImgView.image = self.backImg
//            let effect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
//            let effectView = UIVisualEffectView(effect: effect)
//            effectView.frame = backImgView.bounds
//            backImgView.addSubview(effectView)
//            
//        }else{
//            
//            let backImageView = UIImageView(frame: self.view.bounds)
//            self.view.addSubview(backImageView)
//            backImageView.image = self.backImg
//            let bar = UIToolbar(frame: backImageView.bounds)
//            backImageView.addSubview(bar)
//          
//        }
        
        
        touchBtn = UIButton(type: UIButtonType.RoundedRect)
        touchBtn.frame = CGRectMake(100, 100, 100, 100)
        touchBtn.setTitle("touchID", forState: UIControlState.Normal)
        touchBtn.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        self.view.addSubview(touchBtn)
        
    
        
        
        // Do any additional setup after loading the view.
    }
    
    func dosomethingWith(block:((() -> Void)?)){
       self.myback = block
        
    
    }
    
    func barBackDown(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    func getTouchIDAction(){
        
        let laContext = LAContext()
        var authError : NSError?
        let errorReason = "Keep things secret"
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthentication, error: &authError){
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthentication, localizedReason: errorReason, reply: { (success, error) -> Void in
                if success{
                    print("succeed")
                }else{
                    print("failed")
                }
            })
        }
        else{
            let alertController = UIAlertController(title: "Can not do authenticatation", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel) { (cancelAction) -> Void in
                print("cancel")
            }
            let other = UIAlertAction(title: "确定", style: .Destructive) { (cancelAction) -> Void in
                print("sure")
            }
            alertController.addAction(cancelAction)
            alertController.addAction(other)
            self.presentViewController(alertController, animated: true, completion:nil)
        }
    }
    
    func back(){
        
        self.myback!()
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }

    
    func goBackReturn(backClose: (() -> Void)?) ->String{
        self.myback = backClose;
        return "dd"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
