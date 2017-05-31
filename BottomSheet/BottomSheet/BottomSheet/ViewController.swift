//
//  ViewController.swift
//  BottomSheet
//
//  Created by Joakim Nereng Ellestad on 31.05.2017.
//  Copyright © 2017 Joakim Nereng Ellestad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var bottomSheet: BottomSheet!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //MARK! - Adding the BottomSheet
        self.bottomSheet = BottomSheet(frame: self.view.frame)
        
        
        //Add it to the bottom - the bottom sheet calculate the ofset itself
        self.bottomSheet.bottomPoint = self.view.frame.height
        
        //It shouldn't go higher than the statusBar
        self.bottomSheet.topPoint = (UIApplication.shared.statusBarFrame.height)
        //Add it to the view before running setup()
        self.view.addSubview(self.bottomSheet)
        self.bottomSheet.setup()
        
        self.bottomSheet.isSearchBarAdded = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

