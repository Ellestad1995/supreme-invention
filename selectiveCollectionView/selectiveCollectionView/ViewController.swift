//
//  ViewController.swift
//  selectiveCollectionView
//
//  Created by Joakim Nereng Ellestad on 05.01.2017.
//  Copyright © 2017 Joakim Ellestad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var datasource: [String] = ["09.00-14.30", "12.00-13.00","00.00-06.00", "16.30-17.00", "20.00-21.00", "09.00-14.30", "12.00-13.00","00.00-06.00", "16.30-17.00", "20.00-21.00", "09.00-14.30", "12.00-13.00","00.00-06.00", "16.30-17.00", "20.00-21.00"]
    
    var contentView: UIView = UIView()
    var mainCollectionView: collView!
    var collLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func viewWillLayoutSubviews() {
        //create the visual effects for the view:
        //add shadow
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.masksToBounds = false
        self.contentView.clipsToBounds = false
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowRadius = 3.0
        self.contentView.layer.shouldRasterize = false
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.contentView.layer.shadowPath = UIBezierPath(rect: self.contentView.layer.bounds).cgPath
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //create the view where you want the collectionview
        self.contentView = UIView()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.contentView)
        //create the position for it
        let contentViewwidth = NSLayoutConstraint(item: self.contentView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: -20.0)
        let contentViewheight = NSLayoutConstraint(item: self.contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 200)
        let contentViewleading = NSLayoutConstraint(item: self.contentView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: +10.0)
        let contentViewtrailing = NSLayoutConstraint(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -10.0)
        let contentViewbottom = NSLayoutConstraint(item: self.contentView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -200)

        NSLayoutConstraint.activate([contentViewwidth, contentViewheight, contentViewleading, contentViewtrailing, contentViewbottom])
        
        
        //Adding the collectionview to the view we created above
        //setup the layout
        self.collLayout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        self.collLayout.itemSize = CGSize(width: 110, height: 30)
        self.collLayout.minimumInteritemSpacing = 5
        self.collLayout.minimumLineSpacing = 5
        self.mainCollectionView  = collView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: self.collLayout)
        self.mainCollectionView.contentSize = CGSize(width: self.view.bounds.width-20, height: 200)
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let width = NSLayoutConstraint(item: self.mainCollectionView, attribute: .width, relatedBy: .equal, toItem: self.contentView, attribute: .width, multiplier: 1.0, constant: 0.0)
        
        let height = NSLayoutConstraint(item: self.mainCollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 200)
        
        let leading = NSLayoutConstraint(item: self.mainCollectionView, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailing = NSLayoutConstraint(item: self.mainCollectionView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.mainCollectionView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        self.contentView.insertSubview(self.mainCollectionView, at: 0)
        
        NSLayoutConstraint.activate([width, height, leading, trailing, bottom])
      
        
        
        self.mainCollectionView.reloadData()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }*/

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == self.datasource.count
        {
            if let addcell = collectionView.dequeueReusableCell(withReuseIdentifier: "newcell", for: indexPath) as? newcell {
                
                addcell.lbltext.text = "New Time"
                addcell.addButton.addTarget(self, action: #selector(ViewController.collectionCellDidPressAdd(sender:)), for: UIControlEvents.touchUpInside)
                return addcell
            }
        }
        
       if let decell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultcell", for: indexPath) as? defaultcell{
        
            decell.delButton.tag = indexPath.row
            decell.delButton.addTarget(self, action: #selector(ViewController.collectionCellDidPressDelete(sender:)), for: UIControlEvents.touchUpInside)
            decell.lbltext.text = self.datasource[indexPath.row]
            
            return decell
        }
        
        
        return UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("selected")
    }
    

    
    func collectionCellDidPressDelete(sender: UIButton){
        print("Did press delete")
        
        var point: CGPoint = sender.convert(CGPoint.zero, to: self.mainCollectionView)
        var indexp = self.mainCollectionView.indexPathForItem(at: point)
        
        let cell = self.mainCollectionView.cellForItem(at: indexp!) as! defaultcell
        
        self.view.layoutIfNeeded()
        let newpos = NSLayoutConstraint(item: cell.delButton, attribute: .leading, relatedBy: .equal, toItem: cell, attribute: .leading, multiplier: 1.0, constant: 0.0)
        cell.lbltext.removeFromSuperview()
            
        cell.delButton.removeConstraints([cell.btntrailing])
        NSLayoutConstraint.activate([newpos])
            
        cell.setNeedsUpdateConstraints()
        
        UIView.animate(withDuration: TimeInterval(0.5), animations: {
            self.view.layoutIfNeeded()
        }) { (bool) in
            self.datasource.remove(at: (indexp?.row)!)
            self.mainCollectionView.deleteItems(at: [indexp!])
        }

    }
    func collectionCellDidPressAdd(sender: UIButton){
        print("Did press add")
        
        
    }

    
}

