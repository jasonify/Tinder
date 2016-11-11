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
        let tapper = UITapGestureRecognizer(target: self, action: #selector(CardsViewController.onTap))
        
        
        
        draggableImageView = DraggableImageView(frame: CGRect(x: 0, y: 100, width: 304, height: 304))
        draggableImageView.addGestureRecognizer(tapper)
        view.addSubview(draggableImageView)
        // Do any additional setup after loading the view.
    }
    
    func onTap(_ sender: UITapGestureRecognizer) {
        let profile = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        
        present(profile, animated: true, completion: nil)
    }
}
