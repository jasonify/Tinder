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
        let translation = sender.translation(in: contentView).x
        if sender.state == .began {
            originalCenter = sender.view?.center
        } else if sender.state == .changed {
            sender.view?.center.x = translation + (originalCenter?.x)!
            let angle = (sender.view?.center.x)!.degreesToRadians / 20
            if translation < 0 {
                sender.view?.transform = CGAffineTransform(rotationAngle: -1 * angle)
            } else if translation > 0 {
                sender.view?.transform = CGAffineTransform(rotationAngle: 1 * angle )
            }
        } else {
            if translation < -50 {
                UIView.animate(withDuration: 0.4, animations: {
                    sender.view?.center.x = -1 * self.contentView.frame.width
                })
            } else if translation > 50 {
                UIView.animate(withDuration: 0.4, animations: {
                    sender.view?.center.x = self.originalCenter!.x + self.contentView.frame.width
                })
            } else {
                sender.view?.transform = .identity
                sender.view?.center.x = originalCenter!.x
            }
        }
    }
}


extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
