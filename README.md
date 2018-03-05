# Computer Science Final Project

Table of Contents
=================
1. [Overview](#interview)
2. [Features](#features)
3. [Challenges](#challenges)
4. [Focus](#focus)
5. [Achievements](#achievements)
6. [Deviation](#deviation)
7. [Work Cited](#workcited)
  1. [App Icons and Launchscreen](#appicons)
  2. [FirebaseDatabase to UITableViewController](#firebase)
  3. [Chat Room](#chatroom)
  4. [CBPinEntry](#cbpin)
  5. [NavigationBar](#navigationbar)
  6. [TwitterFeed](#twitterfeed)
  7. [PassingData](#passingdata)
  8. [Debugging/Errors](#debugging)
8. [CocoaPods](#cocoapods)
9. [Miscellaneous](#miscellaneous)
10. [LICENSE[(#license)

## Overview <a name="interview"></a>
-----------
  The purpose of creating this app was to implement a variety of different skills and have more in depth learning of certain aspects of the Xcode IDE. finalProject is an application that houses a `chat room`, `twitter feed`, and a live `user feed`. Being able to bring together this functionalities into one app was the goal; however, another goal was to learn more about Xcode and its abilities.

## Features <a name="features"></a?
-----------
* Insert specific pins for a unique chat room, twitter feed, and user update

## Challenges<a name="challenges"></a?
-------------
* Creating `ViewController` and implementing the library `CBPinEntry`. To give the app a better design I used outside libraries to implement what would have been challenging tasks on my own
* Creating my `TwitterFeedTableViewController` was a challenge. My backend code was working perfectly because the console was printing information; however, for some reason it was not displaying such info onto the `TwitterFeedTableViewController`
* I ran into several problems regarding `Segues`. When I would preform one the `NavigationController` on the next `ViewController` would not always appear

## Focus<a name="focus"></a?
--------
 * During this project I focused on creating and implementing `ChatViewController`. I used several outside sources and libraries to help accomplish this
 * Learn how to implement libraries that I did not write by simply looking at the `README.md` file and also the example project (if the creator had one)
 * Articulating my code and its functionality through extensive commenting
 * How to use the `LaunchScreen.storyboard` while I was not able to fully implement an animated loading screen due to time constraints in the next update I should be able to

## Achievements<a name="achievements"></a?
---------------
* I was able to implement `LaunchScreen.storyboard` and also add assets to the `Assets` folder and have app icons
* I worked with Thad and Sarah on this project because all three of us were trying to implement similiar features just to display different items.
* Getting my UITableViewController to work and display all of the Users

## Deviations<a name="deviation"></a?
-------------
* I was not able to fully implement the customized TabBarController as I had initially planned. Instead I used the `Navigation View Controller` to add `bar item buttons` to each `Storyboard Scene`
* I wasn't able to implement a `Storyboard Scene` where it would display upcoming speakers/events depending on the pin you entered
* My database is not organize how I would have liked it to be. I had to cut a couple of corners to have it fully functional. I was not able do certain actions primarily because I did not code server-side I left that to the application `firebase`
* I was not able to have the TwitterFeed fully functional


# Work Cited<a name="workcited"></a?


App Icons and LaunchScreen<a name="appicons"></a?
----------------------------
* https://docs.nativescript.org/publishing/creating-launch-screens-ios
      > I used this to learn about adding images to `LaunchScreen.storyboard` 
* https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/launch-screen/
      > Example use of `LaunchScreen.storyboard` 
* https://github.com/elistone/ios-splashscreen-template-v2/tree/master/example%20-%20Version%202.1.0
      > Images available to use for `Assets` 
* https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwi_y5uW28LZAhXIMd8KHQZkAK8QjRx6BAgAEAY&url=https%3A%2F%2Ffrontendmasters.com%2Fcourses%2Fcomputer-science%2F&psig=AOvVaw02Cbd9wxB6PoEibQcjKNBA&ust=1519704445858217
      > Image I used for appIcon 
* https://developer.apple.com/library/content/qa/qa1686/_index.html#top

## FirebaseDatabase to UITableViewController<a name="firebase"></a?
--------------------------------------------

* https://www.youtube.com/watch?v=RMudKhNY0sI
* https://stackoverflow.com/questions/25935848/ios-myviewcontroller-does-not-conform-to-protocol-uitableviewdatasource
* https://stackoverflow.com/questions/26442414/libcabi-dylib-terminating-with-uncaught-exception-of-type-nsexception-lldb
* https://forums.developer.apple.com/message/263629#263629
* https://www.youtube.com/watch?v=tv5c1mZttVE
* https://www.youtube.com/watch?v=ZOxsdVyFNhk
* https://stackoverflow.com/questions/44499210/ios-display-firebase-data-in-tableview
* https://stackoverflow.com/questions/44499210/ios-display-firebase-data-in-tableview
* Thaddeus Hunt

## Chat Room (ChatViewController)<a name="chatroom"></a?
---------------------------------
    
* https://learnappmaking.com/pass-data-view-controllers-swift-how-to/
* https://github.com/jessesquires/JSQMessagesViewController/issues/1104
* https://github.com/jessesquires/JSQMessagesViewController/issues/300
* https://github.com/eggswift/ESTabBarController
* https://github.com/pusher/chatkit-swift


## CBPinEntry (PinEntryViewController)<a name="cbpin"></a?
-------------------------------------
* https://github.com/Fawxy/CBPinEntryView
* This class was developed a couple years ago for easier use of adding a pin to Xcode.
* There are not that many functions with this class. To implement I added a `view` on top of a `view Controller Scene` and set its class to `CBPinEntry`
* To retrieve the pin when the user presses `enter` there are two main functions `pinEntry.getPinAsString()` or `pinEntry.getPinAsInt()`
* I found this class through google

## NavigationBar (Navigation Controller View)<a name="navigationbar"></a?
--------------------------------------------   
* https://stackoverflow.com/questions/42367219/how-to-create-tabbar-with-custom-ui-in-swift-3-0

## TwitterFeed (TwitterFeedTableViewController)<a name="twitterfeed"></a?
-----------------------------------------------

* Pusher

## PassingData (Segues and Delegates)<a name="passingdata"></a?
-------------------------------------
* https://learnappmaking.com/pass-data-view-controllers-swift-how-to/
* https://stackoverflow.com/questions/20017026/passing-data-between-view-controllers-using-segue

## Debugging/Errors<a name="debugging"></a?
-------------------
      > Used for general debugging and how to fix some errors that I was getting 
* https://forums.developer.apple.com/thread/65100
* https://stackoverflow.com/questions/28237377/ios-how-to-send-an-image-view-back-and-front
* https://github.com/elistone/ios-splashscreen-template-v2/tree/master/example%20-%20Version%202.1.0

#CocoaPods<a name="cocoapods"></a?
==========
* Throughout my entire project I used cocoapods

# Miscellaneous<a name="miscellaneous"></a?

* Spent about a total of 20+ hours outside of classes. A lot of the time was spent doing research and finding different classes I could find to help lower the amount of code and work my project would take. A large part of this time was used debugging and commenting.
* I want to credit Kabir Nagral for helping me come up with this idea


# LICENSE<a name="license"></a?
