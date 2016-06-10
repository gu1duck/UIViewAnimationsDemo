//
//  ViewController.swift
//  Animation
//
//  Created by Jeremy Petter on 2016-06-06.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        view.addSubview(blueView)

        view.addSubview(textField)

        view.addSubview(animateButton)
        view.addSubview(transformButton)
        view.addSubview(optionsButton)
        view.addSubview(springButton)
        view.addSubview(transitionButton)
        view.addSubview(keyframeButton)
        view.addSubview(nextButton)

        animateButton.addTarget(self, action: #selector(animate), forControlEvents: .TouchUpInside)
        transformButton.addTarget(self, action: #selector(transform), forControlEvents: .TouchUpInside)
        optionsButton.addTarget(self, action: #selector(options), forControlEvents: .TouchUpInside)
        springButton.addTarget(self, action: #selector(spring), forControlEvents: .TouchUpInside)
        transitionButton.addTarget(self, action: #selector(transition), forControlEvents: .TouchUpInside)
        keyframeButton.addTarget(self, action: #selector(keyframe), forControlEvents: .TouchUpInside)
        nextButton.addTarget(self, action: #selector(next), forControlEvents: .TouchUpInside)
    }

    // MARK: Actions

    func animate() {
        UIView.animateWithDuration(1.0) { 
            let destinationRect = CGRect(x: 150, y: 300, width: 200, height: 200)
            self.redView.frame = destinationRect
            self.redView.alpha = 0.0
        }
    }

    func transform() {
        UIView.animateWithDuration(1.0) {
            self.yellowView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }
    }

    // ( UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse )
    func options() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .Autoreverse, animations: {
            let destinationRect = CGRect(x: 150, y: 300, width: 200, height: 200)
            self.greenView.frame = destinationRect
            self.greenView.alpha = 0.0
            self.greenView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            }, completion: nil)
    }

    // 0
    func spring() {
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: [], animations: {
            let destinationRect = CGRect(x: 0, y: 0, width: 300, height: 300)
            self.blueView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            self.blueView.frame = destinationRect
            }, completion: nil)
    }

    func transition() {
        UIView.transitionFromView(redView, toView: orangeView, duration: 1.0, options: .TransitionFlipFromTop, completion: nil)
    }

    func keyframe() {
        let time = 1.0

        let textX = textField.center.x
        let textY = textField.center.y

        UIView.animateKeyframesWithDuration(time, delay: 0.0, options: [], animations: { 

            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.2, animations: { 
                self.textField.center = CGPoint(x: textX + 5, y: textY)
            })

            UIView.addKeyframeWithRelativeStartTime(time * (1.0 / 5.0), relativeDuration: 0.2, animations: {
                self.textField.center = CGPoint(x: textX - 5, y: textY)
            })

            UIView.addKeyframeWithRelativeStartTime(time * (2.0 / 5.0), relativeDuration: 0.2, animations: {
                self.textField.center = CGPoint(x: textX + 5, y: textY)
            })

            UIView.addKeyframeWithRelativeStartTime(time * (3.0 / 5.0), relativeDuration: 0.2, animations: {
                self.textField.center = CGPoint(x: textX - 5, y: textY)
            })

            UIView.addKeyframeWithRelativeStartTime(time * (4.0 / 5.0), relativeDuration: 0.2, animations: {
                self.textField.center = CGPoint(x: textX, y: textY)
            })

            }, completion: nil)
    }

    func next() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let autoLayoutViewController = storyboard.instantiateViewControllerWithIdentifier("AutoLayoutViewControllerStoryboardID") as! AutoLayoutViewController
        let navController = UINavigationController(rootViewController: autoLayoutViewController)
        self.showViewController(navController, sender: self)
    }

    // MARK: Lazy Loaders

    lazy var redView:UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 100, width: 80, height: 80))
        view.backgroundColor = .redColor()
        return view
    }()

    lazy var yellowView:UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        view.backgroundColor = .yellowColor()
        return view
    }()

    lazy var greenView:UIView = {
        let view = UIView(frame: CGRect(x: 190, y: 100, width: 80, height: 80))
        view.backgroundColor = .greenColor()
        return view
    }()

    lazy var blueView:UIView = {
        let view = UIView(frame: CGRect(x: 280, y: 100, width: 80, height: 80))
        view.backgroundColor = .blueColor()
        return view
    }()

    lazy var orangeView:UIView = {
        let view = UIView(frame: CGRect(x: 140, y: 200, width: 80, height: 80))
        view.backgroundColor = .orangeColor()
        return view
    }()

    lazy var textField:UITextField = {
        let textField = UITextField(frame: CGRect(x: 110, y: 400, width: 150, height: 30))
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGrayColor().CGColor
        return textField
    }()

    lazy var animateButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 20, width: 90, height: 30))
        button.setTitle("Animate", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var transformButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 90, y: 20, width: 90, height: 30))
        button.setTitle("Transform", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var optionsButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 180, y: 20, width: 90, height: 30))
        button.setTitle("Options", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var springButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y: 20, width: 90, height: 30))
        button.setTitle("Spring", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var transitionButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 50, width: 90, height: 30))
        button.setTitle("Transition", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var keyframeButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 90, y: 50, width: 90, height: 30))
        button.setTitle("Keyframe", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()

    lazy var nextButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 180, y: 50, width: 90, height: 30))
        button.setTitle("Next", forState: .Normal)
        button.setTitleColor(.blueColor(), forState: .Normal)
        return button
    }()
}

