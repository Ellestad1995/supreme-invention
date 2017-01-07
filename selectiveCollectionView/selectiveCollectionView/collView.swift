//
//  collView.swift
//  selectiveCollectionView
//
//  Created by Joakim Nereng Ellestad on 05.01.2017.
//  Copyright © 2017 Joakim Ellestad. All rights reserved.
//

import UIKit

class collView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

     override func draw(_ rect: CGRect) {
        //self.setupCollectionView()
    }
    
   override func layoutSubviews() {
    super.layoutSubviews()
    //add shadow
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.layer.shadowOpacity = 0.5
    self.layer.shadowRadius = 3.0
    self.layer.shouldRasterize = false
    self.layer.shadowOffset = CGSize(width: 0, height: 1)
    self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
    
    }
    
    func setupCollectionView(){

        
        //setup the class
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = UIColor.white
        self.allowsSelection = false
        self.translatesAutoresizingMaskIntoConstraints = false
        //registering two cells
        self.register(newcell.self, forCellWithReuseIdentifier: "newcell")
        self.register(defaultcell.self, forCellWithReuseIdentifier: "defaultcell")
    }
    
   }
