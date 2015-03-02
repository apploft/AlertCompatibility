import Foundation

func alert(#title: String?, #message: String?, #cancelButton: (title: String, action: ()->()), #otherButtons: [(title: String, action: ()->())], #viewController: UIViewController) {
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

func actionSheet(#title: String?, #cancelButton: (title: String, action: ()->()), #otherButtons: [(title: String, action: ()->())], #viewController: UIViewController) {
    if !isBeforeiOS("8") {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: cancelButton.title, style: .Cancel) { (action) in
            cancelButton.action()
        }
        alertController.addAction(cancelAction)
        for button in otherButtons {
            let action = UIAlertAction(title: button.title, style: .Default) { (action: UIAlertAction!) -> Void in
                button.action()
            }
            alertController.addAction(action)
        }
        viewController.presentViewController(alertController, animated: true, completion: nil)
    } else {
        let lastIndex = otherButtons.count
        UIActionSheet.showInView(viewController.view, withTitle: title, cancelButtonTitle: cancelButton.title, destructiveButtonTitle: nil, otherButtonTitles: otherButtons.map({ $0.title }), tapBlock: { (actionSheet, buttonIndex) in
            switch buttonIndex {
                case lastIndex:
                    cancelButton.action()
                default:
                    otherButtons[buttonIndex].action()
            }
        })
    }
}

func isBeforeiOS(version: String) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
}
