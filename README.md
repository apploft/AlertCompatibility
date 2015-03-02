AlertCompatibility
=========
A generic API for displaying an Alert or an ActionSheet that uses the UIAlertController on iOS 8 and UIAlertView or UIActionSheet on iOS 7 and below.


## Installation
Add _AlertCompatibility.swift_ to your project and add these Cocoapods to your _Podfile_:

	pod 'UIAlertView+Blocks'
	pod 'UIActionSheet+Blocks'
	
and to your Bridging Header:

	#import <UIAlertView+Blocks.h>
	#import <UIActionSheet+Blocks.h>

## Usage

Swift:

```swift

	// a button is a tupel consisting of button title and associated action:
	let cancelButton = ("Cancel", {})
	let retryButton = ("Retry", {
		loadData()
	})
	
	// present an alert:
	alert(title: "Not connected", message: "Please connect to the Internet", cancelButton: cancelButton, otherButtons: [retryButton], viewController: self)



	let settingButton = ("Settings", {
		presentSettingsViewController()
	})
	let aboutButton = ("About", {
		presentAboutViewController()
	})
	let logoutButton = ("Logout", {
		logout()
	})
	
	// present an action sheet:
	actionSheet(title: nil, cancelButton: cancelButton, otherButtons: [settingButton, aboutButton, logoutButton], viewController: self)
```
