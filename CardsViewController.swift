//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joshua Escribano on 11/10/16.
//  Copyright © 2016 JoshuaJason. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var draggableImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        draggableImageView = DraggableImageView(frame: CGRect(x: 0, y: 100, width: 304, height: 304))
        view.addSubview(draggableImageView)
        // Do any additional setup after loading the view.
    }
}
