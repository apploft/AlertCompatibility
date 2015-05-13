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

	let cancelButton = AlertButton(title: "Cancel")
	let retryButton = (title: "Retry", action: {
		loadData()
	})
	
	// present an alert:
	alert(title: "Not connected", message: "Please connect to the Internet", cancelButton: cancelButton, otherButtons: [retryButton], viewController: self)



	let settingButton = AlertButton(title: "Settings", action: {
		presentSettingsViewController()
	})
	let aboutButton = AlertButton(title: "About", action: {
		presentAboutViewController()
	})
	let deleteButton = AlertButton(title: "Delete All Data", action: {
		deleteEverything()
	})
	let logoutButton = AlertButton(title: "Logout", action: {
		logout()
	})
	
	// present an action sheet:
	actionSheet(title: "Here you go", cancelButton: cancelButton, destructiveButton: deleteButton, otherButtons: [settingButton, aboutButton, logoutButton], viewController: self)
```
