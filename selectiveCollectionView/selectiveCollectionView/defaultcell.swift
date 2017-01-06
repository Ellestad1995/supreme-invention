//
//  edittime.swift
//  p-parking
//
//  Created by Joakim Nereng Ellestad on 29.12.2016.
//  Copyright © 2016 Joakim Ellestad. All rights reserved.
//

import UIKit

class edittime: UICollectionViewCell {
 
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    
    let delButton: UIButton = {
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.backgroundColor = UIColor.lightGray
        //btn.layer.cornerRadius = btn.bounds.width/2 //there is gonna be a problem here
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 2.0))
        return btn
    }()
    
    
    let lbltext: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 10.0)
        lbl.textColor = UIColor.black
        lbl.text = "09.00-14.00"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()

    
    func addViews(){
        self.frame = CGRect(x: 0, y: 0, width: 66, height: 22)
        self.roundcorners(withCorners: .allCorners, withRadius: 15)
        self.backgroundColor = UIColor(red: 236, green: 240, blue: 241, alpha: 1)
        
        
        self.addSubview(self.delButton)
        let btntrailing = NSLayoutConstraint(item: self.delButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let btnbottom = NSLayoutConstraint(item: self.delButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let btntop = NSLayoutConstraint(item: self.delButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let btnwidth = NSLayoutConstraint(item: self.delButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        let btnheight = NSLayoutConstraint(item: self.delButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([btntrailing, btnbottom, btntop, btnwidth, btnheight])
        
        self.addSubview(lbltext)
        let lblleading = NSLayoutConstraint(item: self.lbltext, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 2.0)
        let lbltop = NSLayoutConstraint(item: self.lbltext, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let lblbottom = NSLayoutConstraint(item: self.lbltext, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let lbltrailing = NSLayoutConstraint(item: self.lbltext, attribute: .trailing, relatedBy: .equal, toItem: self.delButton, attribute: .leading, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([lblleading, lbltrailing, lbltop, lblbottom])
        
        self.delButton.setNeedsLayout()
        self.lbltext.setNeedsLayout()
    }
}
