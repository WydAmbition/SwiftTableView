//
//  MyTableCell.swift
//  SwiftTableView
//
//  Created by wangyadong on 15/12/4.
//  Copyright © 2015年 wangyadong. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {

    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mytitle.text = "hohcohdvohdhh"
//        ImgView.image = UIImage(named: "222")
        
//        let back = UIView(frame: CGRectMake(0,0,self.bounds.width,self.bounds.height))
        
//        back.backgroundColor = UIColor.redColor()
//        self.selectedBackgroundView = back
//        self.selectedBackgroundView?.bounds = self.bounds
//        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
////        ImgView.image = UIImage(named: "222")
//    }
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
////        ImgView.image = UIImage(named: "111")
//    }
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
////        ImgView.image = UIImage(named: "111")
//    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
