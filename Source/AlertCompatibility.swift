import Foundation

struct AlertButton {
    let title: String
    let action: ()->()
    
    init(title: String, action: ()->() = {}) {
        self.title = title
        self.action = action
    }
}

func alert(#title: String?, #message: String?, #cancelButton: AlertButton, #otherButtons: [AlertButton], #viewController: UIViewController) {
    if !isBeforeiOS("8") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButton.title, style: .Cancel) { (action: UIAlertAction!) -> Void in
            cancelButton.action()
        }
        alertController.addAction(cancelAction)
        for button in otherButtons {
            let action = UIAlertAction(title: button.title, style: .Default) { (action) in
                button.action()
            }
            alertController.addAction(action)
        }
        viewController.presentViewController(alertController, animated: true, completion: nil)
    } else {
        UIAlertView.showWithTitle(title, message: message, cancelButtonTitle: cancelButton.title, otherButtonTitles: otherButtons.map({ $0.title }), tapBlock: { (alertView, buttonIndex) in
            switch buttonIndex {
                case 0:
                    cancelButton.action()
                default:
                    otherButtons[buttonIndex - 1].action()
            }
        })
    }
}

func actionSheet(title: String? = nil, cancelButton: AlertButton? = nil, destructiveButton: AlertButton? = nil, otherButtons: [AlertButton] = [], #viewController: UIViewController) {
    if !isBeforeiOS("8") {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .ActionSheet)
        
        if let cancelButton = cancelButton {
            let action = UIAlertAction(title: cancelButton.title, style: .Cancel) { (action) in
                cancelButton.action()
            }
            alertController.addAction(action)
        }
        
        if let destructiveButton = destructiveButton {
            let action = UIAlertAction(title: destructiveButton.title, style: .Destructive) { (action) in
                destructiveButton.action()
            }
            alertController.addAction(action)
        }
        
        for button in otherButtons {
            let action = UIAlertAction(title: button.title, style: .Default) { (action: UIAlertAction!) -> Void in
                button.action()
            }
            alertController.addAction(action)
        }
        
        viewController.presentViewController(alertController, animated: true, completion: nil)
    } else {
        let actionSheet = UIActionSheet.showInView(viewController.view, withTitle: title, cancelButtonTitle: cancelButton?.title, destructiveButtonTitle: destructiveButton?.title, otherButtonTitles: otherButtons.map({ $0.title }), tapBlock: { (actionSheet, buttonIndex) in
            switch buttonIndex {
                case actionSheet.cancelButtonIndex:
                    cancelButton?.action()
                case actionSheet.destructiveButtonIndex:
                    destructiveButton?.action()
                default:
                    otherButtons[buttonIndex].action()
            }
        })
    }
}

func isBeforeiOS(version: String) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
}
