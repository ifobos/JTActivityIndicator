//
//  ViewController.swift
//  JTActivityIndicator
//
//  Created by Juan Garcia on 1/21/16.
//  Copyright © 2016 jerti. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var exampleView: UIView!
    
    @IBAction func show(sender: AnyObject)
    {
        let activityIndicator = JTActivityIndicator()
        activityIndicator.show()
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(5 * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()){ () -> Void in
                activityIndicator.hide()
        }
    }

    @IBAction func showNoAnimated(sender: AnyObject)
    {
        let activityIndicator = JTActivityIndicator()
        activityIndicator.show(animated: false)
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(5 * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()){ () -> Void in
                activityIndicator.hide()
        }
    }

    @IBAction func showWithMessage(sender: AnyObject)
    {
        let activityIndicator = JTActivityIndicator()
        activityIndicator.show(
            animated    : true,
            message     : "Custom"
        )
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(5 * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()){ () -> Void in
                activityIndicator.hide()
        }

    }
    
    @IBAction func showInView(sender: AnyObject)
    {
        let activityIndicator = JTActivityIndicator()
        activityIndicator.show(
            animated        : true,
            message         : "Custom",
            network         : false,
            viewContainer   : self.exampleView
        )
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(5 * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue()){ () -> Void in
                activityIndicator.hide()
        }

    }


}
