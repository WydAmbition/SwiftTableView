//
//  ViewController.swift
//  SwiftTableView
//
//  Created by wangyadong on 15/12/4.
//  Copyright © 2015年 wangyadong. All rights reserved.
//

import UIKit

import LocalAuthentication


class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var dataArray:[String] = []
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(nibName: nil,bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hahahah")
        self.title = "tableView"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView (frame:CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-64), style: UITableViewStyle.Plain)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view .addSubview(self.tableView)
        
        for item in 1...9
        {
            let str :String = "\(item)"
            self.dataArray .append("\(str)");
        }
        self.tableView.reloadData()
        
        dispatch_async(GlobalUserInitiatedQueue) {
            dispatch_async(self.GlobalMainQueue) {

            }
        }
        
        
        self.sayHello("Bob",girlName: "ssc")
        self.sayHello2("hahah","sssss")
        self.sayHello3("ssss",girlName: "ssss",num: 1,23,3)
        print("\(self.factorial(3))")
        print(self.factorial(3))
       
        
        
        var inta : Int = 2
        var intb : Int = 3
        self.swap(&inta, b: &intb)
        print("\(inta),\(intb)")
        
        let names = ["Swift", "Arial", "Soga", "Donary"]
        var reversed = names.sort { (firstString:String, secondString:String) -> Bool in
            return self.backwards(firstString, secondString: secondString)
        }
        print(reversed)

        reversed = names.sort(<)
        print(reversed)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func backwards(firstString: String, secondString: String) -> Bool {
        return firstString > secondString // 升序排序
    }
    
    
    //默认参数提示参数名
    func sayHello (boyName:String ,girlName:String = "Lily"){
        
        print("\(boyName),\(girlName) say hello")
    
    }
    //默认参数不提示参数名
    func sayHello2 (boyName:String ,_ girlName:String = "Lily"){
        
        print("\(boyName),\(girlName) say hello")
        
    }
    //普通参数，默认参数，可变参数
    func sayHello3 (boyName:String ,girlName:String = "Lily",num:Int...){
        
        print("\(boyName),\(girlName) say hello \(num[0])")
    }
    //常量形参和变量形参
    func factorial(var number:Int) -> Int{
        var result : Int = 1
        while number > 1{
            result = result * number
            number--
        }
        return result
    }
    
    // In-Out 形参
    /*
    注意：只能传入变量作为实参
    输入输出都不能带默认值
    如果你用inout标记了一个参数那么这个参数就不能再用var\let去修饰
    
    在swift中类型绝大多数都是值类型，值类型的参数在传入函数内部的时候都是传入的都是副本，所以函数不能对值类型的函数做出改变，所谓的inout函数其实就是强制传入变量的指针 &取地址符
    */
    func swap(inout a: Int,inout b: Int){
        let temp = a
        a = b
        b = temp
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "MyTableCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as?MyTableCell
        if cell == nil{
            let nibs:NSArray = NSBundle.mainBundle().loadNibNamed("MyTableCell", owner: self, options: nil)
            cell = nibs.firstObject as?MyTableCell
        }
        let fl = (Float)(150+indexPath.row*10) / 255.0
        cell?.contentView.backgroundColor = UIColor(colorLiteralRed:1-fl , green:fl, blue:fl+0.1, alpha: 1)
        cell?.mytitle.text = self.dataArray[indexPath.row]
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        

//        self.showEventsAcessDeniedAlert()
        let second:SecondViewController = SecondViewController()
        second.finishBlock = {(parName) ->Void in
            print(parName)
        }
        self.navigationController?.pushViewController(second, animated: true)
        
        
        
//        let my:MyViewController = MyViewController()
//        let nav = UINavigationController(rootViewController: my)
//        self.navigationController?.presentViewController(nav, animated: true, completion: nil)
    }
    
    func showEventsAcessDeniedAlert() {
        let alertController = UIAlertController(title: "Sad Face Emoji!",
            message: "The calendar permission was not authorized. Please enable it in Settings to continue.",
            preferredStyle: .Alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) in
            // THIS IS WHERE THE MAGIC HAPPENS!!!!
            if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(appSettings)
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func shootScreenWithView(view:UIView!) ->UIImage{
    
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        view.layer.renderInContext(ctx!)
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    
    
    var GlobalMainQueue: dispatch_queue_t {
        return dispatch_get_main_queue()
    }
    
    var GlobalUserInteractiveQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
    }
    
    var GlobalUserInitiatedQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
    }
    
    var GlobalUtilityQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
    }
    
    var GlobalBackgroundQueue: dispatch_queue_t {
        return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

