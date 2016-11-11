//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joshua Escribano on 11/10/16.
//  Copyright © 2016 JoshuaJason. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var draggableImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        draggableImageView = Bundle.main.loadNibNamed("DraggableImageView", owner: self, options: nil) as! DraggableImageView
        add
        view.addSubView(draggableImageView)
        // Do any additional setup after loading the view.
    }
}
