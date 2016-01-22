//
//  JTActivityIndicator.swift
//  JTActivityIndicator
//
//  Created by Juan Garcia on 1/21/16.
//  Copyright © 2016 jerti. All rights reserved.
//

import UIKit

public class JTActivityIndicator: NSObject
{
//MARK: - Properties
//=========================================================================================
//    UiactivityIndicatorView is the property that contains the instance of UIView that is 
//    presented by JTActivityIndicator, this may be an instance of the class by default
//    JTActivityIndicatorView or may be an instance of a custom subclass of the same.
    private lazy var activityIndicatorView: JTActivityIndicatorView = {
        var nib = UINib(
            nibName: self.viewNibName,
            bundle: nil
        )
        var view = nib.instantiateWithOwner(
            self,
            options: nil
            ).first
        return (view as! JTActivityIndicatorView)
    }()
    
//=========================================================================================
//    viewNibName is a property that contains the name of sub class from uiview of the
//    activity indicator to be presented.
    
   public lazy var viewNibName: String = {
        return "JTActivityIndicatorView"
    }()

    
//MARK: - Show functions

    public func show(){
        self.show(animated: true)
    }
    
    public func show(animated animated:Bool){
        self.show(
            animated    : animated,
            message     : "Loading"
        )
    }
    
    public func show(animated animated:Bool, message:String){
        self.show(
            animated    : animated,
            message     : message,
            network     : true);
    }
    
    public func show(animated animated:Bool, message:String, network: Bool){
        self.show(
            animated        : animated,
            message         : message,
            network         : network,
            viewContainer   : (UIApplication.sharedApplication().keyWindow?.rootViewController?.view)!
        )
    }
    
    public func show(animated animated:Bool, message:String, network:Bool, viewContainer:UIView){
        self.embedContentViewInContainerView(self.activityIndicatorView, container: viewContainer)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = network
        self.activityIndicatorView.setMessage(message)
        if animated
        {
            self.activityIndicatorView.alpha = 0
            UIView.animateWithDuration(0.35) { () -> Void in
                self.activityIndicatorView.alpha = 1
            }
        }
        
    }

//MARK: - Helpers
    
    private func embedContentViewInContainerView(content:UIView, container:UIView){
        content.frame = container.bounds
        container.addSubview(content)
        container.addConstraint(
            NSLayoutConstraint(
                item        : content,
                attribute   : NSLayoutAttribute.Width,
                relatedBy   : NSLayoutRelation.Equal,
                toItem      : container,
                attribute   : NSLayoutAttribute.Width,
                multiplier  : 1,
                constant    : 0
            ))
        container.addConstraint(
            NSLayoutConstraint(
                item        : content,
                attribute   : NSLayoutAttribute.Height,
                relatedBy   : NSLayoutRelation.Equal,
                toItem      : container,
                attribute   : NSLayoutAttribute.Height,
                multiplier  : 1,
                constant    : 0
            ))
        container.addConstraint(
            NSLayoutConstraint(
                item        : content,
                attribute   : NSLayoutAttribute.CenterX,
                relatedBy   : NSLayoutRelation.Equal,
                toItem      : container,
                attribute   : NSLayoutAttribute.CenterX,
                multiplier  : 1,
                constant    : 0
            ))
        container.addConstraint(
            NSLayoutConstraint(
                item        : content,
                attribute   : NSLayoutAttribute.CenterY,
                relatedBy   : NSLayoutRelation.Equal,
                toItem      : container,
                attribute   : NSLayoutAttribute.CenterY,
                multiplier  : 1,
                constant    : 0
            ))
        
    }
    
//MARK: - Hide functions

    public func hide()
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        UIView.animateWithDuration(0.35, animations: { () -> Void in
            self.activityIndicatorView.alpha = 0
            }) { (completed) -> Void in
                self.activityIndicatorView.removeFromSuperview()
                self.activityIndicatorView.alpha = 1
        }
    }
//=========================================================================================
}
