# ROLPLI

#### Official ROLPLI App (Version 1.0)
#### Website: [ROLPLI](http://rolpli.org/joomla/en/home)
#### App Store Link: [https://itunes.apple.com/us/app/rolpli/id1126682799](https://itunes.apple.com/us/app/rolpli/id1126682799)

## Features:
- List of classes with their IDs
- Calendar of classes and their times
- Links to videos, hangout, and audio files
- Page dedicated to FAQ
- Links to contact ROLPLI through email, phone, or fax

### Other Info
Most of the app's features require internet connection in order to retrieve information from Google Firebase:
```swift
FIRApp.configure()
let ref = FIRDatabase.database().reference()
ref.observe(.value, with: { snapshot in
let s = (snapshot.value! as AnyObject).object(forKey: "Cell Groups")! as! Dictionary<String,Dictionary<String,String>>
```
