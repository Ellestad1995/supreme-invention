//
//  edittime.swift
//  p-parking
//
//  Created by Joakim Nereng Ellestad on 29.12.2016.
//  Copyright © 2016 Joakim Ellestad. All rights reserved.
//

import UIKit

class defaultcell: UICollectionViewCell {
 
    //accessbile constraints
    var btntrailing: NSLayoutConstraint!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    
    let delButton: UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        //btn.setBackgroundImage(UIImage(named: "delete"), for: UIControlState.normal)
        btn.setImage(UIImage(named: "delete"), for: UIControlState.normal)
        btn.tintColor = UIColor.red
        
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    
    let lbltext: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textAlignment = NSTextAlignment.left
        //lbl.layer.borderColor = UIColor.orange.cgColor
        //lbl.layer.borderWidth = 1
        lbl.textColor = UIColor.black
        lbl.text = "Example"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()

    //on delete animate the dissepearance of the cell
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //add shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shouldRasterize = false
        
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 2.0, height: 3.0)
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        
        
    }
    
    func addViews(){
        self.frame = CGRect(x: 0, y: 0, width: 110, height: 25)
        //self.roundcorners(withCorners: .allCorners, withRadius: 15)
        self.backgroundColor = UIColor.clear //UIColor(red: 236, green: 240, blue: 241, alpha: 1)
        self.layer.backgroundColor = UIColor(red: 236, green: 240, blue: 241, alpha: 1).cgColor

        self.layer.cornerRadius = 12
        //self.layer.borderWidth = 1
        //self.layer.borderColor = UIColor.black.cgColor
        
        self.contentView.addSubview(self.delButton)
        //self.addSubview(self.delButton)
        
        self.btntrailing = NSLayoutConstraint(item: self.delButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        //let btncenter = NSLayoutConstraint(item: self.delButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let btnbottom = NSLayoutConstraint(item: self.delButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let btntop = NSLayoutConstraint(item: self.delButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let btnwidth = NSLayoutConstraint(item: self.delButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        let btnheight = NSLayoutConstraint(item: self.delButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([self.btntrailing, btntop, btnbottom, btnwidth, btnheight])
        
        self.contentView.addSubview(self.lbltext)
        //self.addSubview(lbltext)
        let lblleading = NSLayoutConstraint(item: self.lbltext, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 5.0)
        //let lbltop = NSLayoutConstraint(item: self.lbltext, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let lblcenter = NSLayoutConstraint(item: self.lbltext, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        //let lblbottom = NSLayoutConstraint(item: self.lbltext, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let lbltrailing = NSLayoutConstraint(item: self.lbltext, attribute: .trailing, relatedBy: .equal, toItem: self.delButton, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let lblheight = NSLayoutConstraint(item: self.lbltext, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        NSLayoutConstraint.activate([lblleading, lbltrailing, lblheight, lblcenter])
        
        self.delButton.setNeedsLayout()
        self.lbltext.setNeedsLayout()
    }
}
