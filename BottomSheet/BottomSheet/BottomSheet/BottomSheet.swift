//
//  genericBottomView.swift
//  Bibben
//
//  Created by Joakim Nereng Ellestad on 17.04.2017.
//  Copyright © 2017 Joakim Nereng Ellestad. All rights reserved.
//
import Foundation
import UIKit

class BottomSheet: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.customAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    
    //MARK! - "constants" for max height and minimum height
    private var _minimumPoint: CGFloat?
    
    
    //MARK - Variables for setting the width
    //The width can be set at initialization. Then this doesn't need to be set.
    //Can be changed during runtime - if so, you'll have to update the layout yourself
    private var width: CGFloat?
    
    public var frameWidth: CGFloat {
        get{
            if(width == 0) {print("**WARNING - BottomSheet**\nWidth is not set.")}
            return width ?? 0
        }
        
        set(value){
            self.frame.size.width = value
            self.width = value
        }
    }
    
    
    //MARK - Variable for the bottom point
    //The 0.0 point where BottomSheet should be drawn. 
    //If you use  navigation controller this point should be the height of the
    //viewcontroller - height of navigationcontroller
    public var bottomPoint: CGFloat {
        get {
            return (_minimumPoint ?? 100)
        }
        set(value){
            //value + 44 + distance from contentview and up
            let dist1 = self.contentView.frame.origin.y
            let dist2 = self.frame.origin.y
            let diff = dist1 - dist2
            _minimumPoint = value - diff
        }
    }
    
    //MARK - Variables for the top point at which the bottomsheet can be dragged
    private var _maksimumPoint: CGFloat?
    public var topPoint: CGFloat {
        get{
            return (_maksimumPoint ?? 100)
        }
        set(value){
            _maksimumPoint = value
        }
    }
    
    //MARK! - the height before the keyboard did appear
    private var previousOrigin: CGFloat?
    
    
    //MARK - The following are customizable stuff to add
    //*************************************************
    
    //MARK - Top contentView is reserved for searchbar and other things
   private  var topContentView: UIView = {
        var cv = UIView()
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    var tcvHeight: NSLayoutConstraint?
    
    //MARK! - ContentView: Where other views can be added
    //Add custom views here as subviews
    public var contentView: UIView = {
        var cv = UIView()
        cv.backgroundColor = UIColor.darkGray
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    
    //MARK - Setting isSearchBarAdded to true will add a UISearchBar
    //you must customize it yourself
    private var _isSearchBarAdded: Bool = false
    public var isSearchBarAdded: Bool {
        get{
            return _isSearchBarAdded
        }
        set(value){
            self._isSearchBarAdded = value
            self.topContentView.addSubview(self.searchBar)
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.topContentView.leadingAnchor).isActive = true
            self.searchBar.trailingAnchor.constraint(equalTo: self.topContentView.trailingAnchor).isActive = true
            self.searchBar.topAnchor.constraint(equalTo: self.topContentView.topAnchor, constant: 0.0).isActive = true
            self.searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            self.tcvHeight?.constant = 50
            self.layoutIfNeeded()
            }
    }
    
    //Can be  customized yourself
    public var searchBar: UISearchBar = {
        var a: UISearchBar = UISearchBar()
        a.translatesAutoresizingMaskIntoConstraints = false
        a.placeholder = "BottomSheet - Customize this yourself"
        return a
    }()
    //Implement scrollview later
    /*var scrollableContentView: UIScrollView = {
     var scv: UIScrollView = UIScrollView()
     s
     }()*/
    
    var cvTrailing: NSLayoutConstraint!
    var cvLeading: NSLayoutConstraint!
    var cvTop: NSLayoutConstraint!
    var cvBottom: NSLayoutConstraint!
    
    //MARK! - handle: Swiping up and down
    var handle: UIView = {
        var h = UIView()
        h.backgroundColor = UIColor.lightGray
        h.translatesAutoresizingMaskIntoConstraints = false
        return h
    }()
    
    var handleCenter: NSLayoutConstraint!
    var handleWidth: NSLayoutConstraint!
    var handleHeight: NSLayoutConstraint!
    var handleTop: NSLayoutConstraint!

    
    
    
    public func setup(){
        //self.layer.masksToBounds = true
        //self.clipsToBounds = true
        self.frame.origin.y = bottomPoint
        
        
        self.backgroundColor = UIColor.groupTableViewBackground
        //self.addBlurToView(withEffect: .dark)
        self.isUserInteractionEnabled = true
        
        
        //MARK!- Constraints for handle
        self.addSubview(self.handle)
        self.handle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.handle.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.0).isActive = true
        self.handle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.20).isActive = true
        self.handle.heightAnchor.constraint(equalToConstant: 5.0).isActive = true
        
        
        //MARK - Constraints for top content view
        self.addSubview(self.topContentView)
        self.topContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        self.topContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        self.topContentView.topAnchor.constraint(equalTo: self.handle.bottomAnchor, constant: 2.0).isActive = true
        self.tcvHeight = self.topContentView.heightAnchor.constraint(equalToConstant: 0.0)
        self.tcvHeight!.isActive = true
        
        //MARK! - Constraints for contentview
        self.addSubview(self.contentView)
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.topContentView.bottomAnchor, constant: 0.0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        
        
        //MARK! - Layout the subviews before rounding the corners
        self.layoutIfNeeded()
        self.handle.layoutIfNeeded()
        self.contentView.layoutIfNeeded()
        
        //MARK! - round the corners for the handle and this view
        self.handle.roundcorners(withCorners: .allCorners, withRadius: 5.0)
        self.roundcorners(withCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], withRadius: 15.0)
        
        
        //MARK! - keyboardDidShow and keyboardDidHide
        let keyboardDidShowName = NSNotification.Name.init(rawValue: "UIKeyboardDidShowNotification")
        let keyboardDidHideName = NSNotification.Name.init(rawValue: "UIKeyboardWillHideNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(BottomSheet.keyboardWasShown(with:)), name: keyboardDidShowName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BottomSheet.keyboardWillBeHidden(with:)), name: keyboardDidHideName, object: nil)
        
        
        //MARK! - Adding gesture recognizers
        let panG = UIPanGestureRecognizer(target: self, action: #selector(BottomSheet.panGesture(_:)))
        panG.cancelsTouchesInView = false
        panG.delaysTouchesBegan = true
        panG.delegate = self
        self.addGestureRecognizer(panG)
    }
    
    
    func panGesture(_ gesture: UIPanGestureRecognizer){
        guard gesture.state == .began || gesture.state == .changed else{
            return
        }
        if gesture.state == .began || gesture.state == .changed{
            
            let translation = gesture.translation(in: gesture.view)
            //print("Translation Y: \(translation.y)")
            if(self.frame.origin.y >= topPoint && self.frame.origin.y <= bottomPoint){
                if(self.frame.origin.y + translation.y <= topPoint || self.frame.origin.y + translation.y >= bottomPoint){return}
                self.frame.origin.y += translation.y
                gesture.setTranslation(CGPoint.zero, in: gesture.view)
                DispatchQueue.main.async {
                    self.setNeedsLayout()
                }
            }else{return}
        }
        
    }
    
    func keyboardWasShown(with aNotification: Notification){
        print("keyboardWasShown")
        if let info: NSDictionary = aNotification.userInfo as! NSDictionary {
            //let rect = info.value(forKey: "UIKeyboardFrameBeginUserInfoKey") as? CGRect
            self.previousOrigin = self.frame.origin.y
            DispatchQueue.main.async {
                UIView.animate(withDuration: TimeInterval(0.3), animations: {
                    //Animate the view to the top-10
                    
                    self.frame.origin.y = self.topPoint
                    
                })
            }
            
        }
        
    }
    func keyboardWillBeHidden(with aNotification: Notification){
    
        if let info: NSDictionary = aNotification.userInfo as! NSDictionary {
            //let rect = info.value(forKey: "UIKeyboardFrameBeginUserInfoKey") as? CGRect
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: TimeInterval(0.3), animations: {
                    if let originalPosition = self.previousOrigin{
                        self.frame.origin.y = originalPosition
                    }else{
                        self.frame.origin.y = self.bottomPoint
                    }
                    
                })
            }
        }
        
    }
    
}

extension BottomSheet: UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.location(in: self.contentView).x < 0.0 && touch.location(in: self.contentView).y < 0.0 {
            return false
        }else{
            return true
        }
    }
}
