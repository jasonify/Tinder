//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Joshua Escribano on 11/10/16.
//  Copyright © 2016 JoshuaJason. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    var originalCenter:CGPoint?
    @IBAction func onDrag(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            originalCenter = sender.view?.center
        } else if sender.state == .changed {
            sender.view?.center.x =
                sender.translation(in: contentView).x + (originalCenter?.x)!
        }
    }
}
