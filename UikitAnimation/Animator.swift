//
//  Animator.swift
//  UikitAnimation
//
//  Created by Raidan on 12/07/2024.
//

import Foundation
import UIKit
//Example Animation
class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC.view)
        toVC.view.frame = fromVC.view.frame
        toVC.view.alpha = 0.0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.alpha = 1.0
        }) { finished in
            fromVC.view.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
    }
}


class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator()
    }
}




