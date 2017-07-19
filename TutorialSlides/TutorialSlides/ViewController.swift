//
//  ViewController.swift
//  TutorialSlides
//
//  Created by Joakim Nereng Ellestad on 19.07.2017.
//  Copyright © 2017 Joakim Nereng Ellestad. All rights reserved.
//

import UIKit

/**
 One viewcontroller to hold them all
 - Present the viewcontroller modally.
 - The viewcontroller will dismiss itself; by user interaction
 */

class ViewController: UIViewController {

    /**
        tutorialimages are the images displayed by the carouselle
        - Must be saved in Assets.xcassets
        - The position in the array matters, 0 will be displayed first, the second, etc.
     */
    var tutorialImages: [UIImage?] = [UIImage(named: "red"), UIImage(named: "green"), UIImage(named: "blue"),UIImage(named: "yellow")]
    
    /**
     Every image needs a imageview
     */
    var imageView: [UIImageView?] = []
    
    lazy var numberOfPages: Int = {
        return self.tutorialImages.count
    }()
    /**
     Scrollview to hold the images and to scroll them horizontally
     
     */
    
    var scrollView:UIScrollView?
    /**
        Display number of images and display current image
     */
    var pageController: UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        //MARK: - Just a faded black background
        self.view.backgroundColor = UIColor.clear
        let darkLayer = CALayer()
        darkLayer.frame = self.view.frame
        darkLayer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.view.layer.addSublayer(darkLayer)
        
        
        //MARK: - Scrollview setup
        self.scrollView = UIScrollView(frame: CGRect.zero)
        guard let sv = self.scrollView else{return}
        self.view.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isPagingEnabled = true
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.delegate = self
        sv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        sv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sv.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        sv.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.70).isActive = true
        sv.layoutIfNeeded()
        let contentWidth: CGFloat = sv.bounds.width * CGFloat(self.numberOfPages)
        sv.contentSize = CGSize(width: contentWidth, height: sv.bounds.height)
        
        //MARK: - ImageView setup
        let size = sv.bounds.size
        var xPostion:CGFloat = 0.0
        let yPosition:CGFloat = 0.0
        
        for img in self.tutorialImages{
            //For every image we need to make a imageview
            let rect = CGRect(x: xPostion, y: yPosition, width: size.width, height: size.height)
            let imgView: UIImageView = UIImageView(frame: rect)
            imgView.image = img
            imgView.contentMode = .scaleAspectFit
            self.imageView.append(imgView)
            sv.addSubview(imgView)
            xPostion += size.width
        }
    
        
        //MARK: - UIPageController setup
        self.pageController =  UIPageControl(frame: CGRect.zero)
        guard let pc = self.pageController else{return}
        self.view.addSubview(pc)
        //pc.backgroundColor = UIColor.green
        let pageCBounds = pc.size(forNumberOfPages: self.numberOfPages)
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pc.topAnchor.constraint(equalTo: sv.bottomAnchor, constant: 10.0).isActive = true
        pc.heightAnchor.constraint(equalToConstant: pageCBounds.height).isActive = true
        pc.widthAnchor.constraint(equalToConstant: pageCBounds.width).isActive = true
        pc.numberOfPages = self.numberOfPages
        pc.currentPage = 0
        pc.layoutIfNeeded()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //code..
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //code..
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        if let pc = self.pageController{
            pc.currentPage = Int(pageNumber)
        }
    }

}
