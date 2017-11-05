//
//  SlideDownAnimator.swift
//
//  Created by RomanC on 4/10/17.
//  2017 SapienSolutions, LLC.
//
/*
*   Animation class that will slide both views(to and from views) in a downward motion.
*   Modify the duration variable to preference.
*/

import UIKit

class SlideDownAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.2
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //create the container the will controll the transition
        let containerView = transitionContext.containerView
        
        //set a variable to the fromView
        let fromView = transitionContext.view(forKey: .from)!
        
        //set a variable to the toView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        
        //Give the original position/size of the fromView and toView
        fromView.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        toView.frame=CGRect(x:0, y:0 - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        //Begin animation block
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseInOut,
                       animations: {
                        
                        //Ending position/size of the frpmView and toView
                        fromView.frame=CGRect(x: 0, y: 0 + UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                        toView.frame=CGRect(x: 0, y: UIScreen.main.bounds.origin.y, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        },
                       completion: { _ in
                        
                        //Completion handler that helps with gesture recognizers if you use them.(not required for regular segues)
                        print("ANIMATION HAS REACHED THE COMPLETION BLOCK")
                        if(transitionContext.transitionWasCancelled){
                            
                            transitionContext.completeTransition(false)
                            
                            UIApplication.shared.keyWindow?.addSubview(fromView)
                        }
                            
                        else{
                            
                            transitionContext.completeTransition(true)
                            
                        }

        }
        )
        
    }

}
