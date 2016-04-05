//
//  SecondViewController.h
//  SwiftTableView
//
//  Created by wangyadong on 15/12/25.
//  Copyright © 2015年 wangyadong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FinishBlock)(id parName);

@interface SecondViewController : UIViewController

@property(nonatomic,copy)FinishBlock finishBlock;


@end
