//
//  SlideLeftDismissAnimator.swift
//  Govi
//
//  Created by RomanC on 6/1/17.
//  2017 SapienSolutions, LLC.
/*
 *   Animation class that will slide a view(fromView) to the left, revealing the toView.
 *   Modify the duration variable to preference.
 */

import UIKit

class SlideLeftDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 0.2
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //create the container the will control the transition
        let containerView = transitionContext.containerView
        
        //set a variable to the fromView
        let fromView = transitionContext.view(forKey: .from)!
        
        //set a variable to the toView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        //with dismiss you want to bring the fromView in front of the toView
        containerView.bringSubview(toFront: fromView)
        
        //Give the original position/size of the fromView and toView
        fromView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        toView.frame=CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        //Begin animation block
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut,
                       animations: {
                        
                        //Ending position/size of the frpmView and toView
                        fromView.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                        toView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        },
                       completion: { _ in
                        transitionContext.completeTransition(true)
        }
        )
        
    }

    
}
