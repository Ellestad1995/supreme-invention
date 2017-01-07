//
//  addtime.swift
//  p-parking
//
//  Created by Joakim Nereng Ellestad on 29.12.2016.
//  Copyright © 2016 Joakim Ellestad. All rights reserved.
//

import UIKit

class newcell: UICollectionViewCell {
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    
    let addButton: UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.setImage(UIImage(named: "add"), for: .normal)
        //btn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        btn.tintColor = UIColor.green
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    
    let lbltext: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13.0)
        lbl.textColor = UIColor.black
        lbl.text = "Ny Tid"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    /*override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        
    }*/
    
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
        //edit the size of self
        self.frame.size = CGSize(width: 110.0, height: 25.0)
        //self.contentView.roundcorners(withCorners: .allCorners, withRadius: 12)
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.clear //UIColor(red: 236, green: 240, blue: 241, alpha: 1)
        self.layer.backgroundColor = UIColor(red: 236, green: 240, blue: 241, alpha: 1).cgColor
        
        //self.layer.masksToBounds = true
        self.layer.cornerRadius = 12
        //self.layer.borderWidth = 1
        //self.layer.borderColor = UIColor.black.cgColor
       
        
        self.contentView.addSubview(self.addButton)
        //self.addSubview(self.addButton)
        let btntrailing = NSLayoutConstraint(item: self.addButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let btncentery = NSLayoutConstraint(item: self.addButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        //let btnbottom = NSLayoutConstraint(item: self.addButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        //let btntop = NSLayoutConstraint(item: self.addButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let btnwidth = NSLayoutConstraint(item: self.addButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        let btnheight = NSLayoutConstraint(item: self.addButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([btntrailing, btncentery, btnwidth, btnheight])
        self.contentView.addSubview(self.lbltext)
        //self.addSubview(lbltext)
        let lblleading = NSLayoutConstraint(item: self.lbltext, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10.0)
        //let lbltop = NSLayoutConstraint(item: self.lbltext, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        //let lblbottom = NSLayoutConstraint(item: self.lbltext, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let lblcentery = NSLayoutConstraint(item: self.lbltext, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let lbltrailing = NSLayoutConstraint(item: self.lbltext, attribute: .trailing, relatedBy: .equal, toItem: self.addButton, attribute: .leading, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([lblleading, lbltrailing, lblcentery])
        
        self.addButton.setNeedsLayout()
        self.lbltext.setNeedsLayout()
    }
}
