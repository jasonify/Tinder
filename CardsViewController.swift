//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joshua Escribano on 11/10/16.
//  Copyright © 2016 JoshuaJason. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var isPresenting = true
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
        
        profile.modalPresentationStyle = .custom
        profile.transitioningDelegate = self
        present(profile, animated: true, completion: nil)
    }
}

extension CardsViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }       

}

extension CardsViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
    }
}
