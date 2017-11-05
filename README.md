# Swift-Controller-Transitions
A Library of essential ViewController transitions! Built with swift 3.

In YourViewController.swift, you should create a global variable like so: 
```swift
var transition = UIViewControllerAnimatedTransitioning?
```

Along with adding an extension to the viewController.swift at the very bottom of the file like so:
```swift
extension YourViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition 
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
```

This extension will manage any incoming segue and if the 'transition' variable has been set to one of the classes defined in this repo, it will utilize the animation within that class as the transition.
