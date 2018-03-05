//
//  ChatViewController.swift
//  finalProject
//
//  Created by Joshua Thomas on 2/25/18.
//  Copyright © 2018 jthomas. All rights reserved.
//

import UIKit
import JSQMessagesViewController

//Extends JSQMessagesViewController instead of UIKit to sue specific funcs that UIKit doesn't have

class ChatViewController: JSQMessagesViewController {
    
    //    Creates an array that holds all messages sent
    var messages = [JSQMessage]()
    
    
    //    Both outgoingBubble and incomingBubble are computed property. They are 'lazy' vars. This means they are only initialized once (when you access them)
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        //Created a closure because computed values are not typically 'lazy'
        
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
    }()
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creates a temporary constant
        let defaults = UserDefaults.standard
        
        //Checks to see if 'jsq_id' and 'jsq_name' exist in the defaults
        if  let id = defaults.string(forKey: "jsq_id"),
            let name = defaults.string(forKey: "jsq_name"){
            
            //If the exist assign them to 'senderId' and 'senderDisplayName'
            senderId = id
            senderDisplayName = name
        } else {
            
            //If it is a new user that is not in the database, creates a new unique senderId
            senderId = String(arc4random_uniform(999999))
            senderDisplayName = ""
            
            defaults.set(senderId, forKey: "jsq_id")
            //Adds any new Id's and Names that may have been added
            defaults.synchronize()
            
            showDisplayNameDialog()
        }
        
        //Sets title of chat so your name is at the top of the page
        title = "Chat \(senderDisplayName)"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showDisplayNameDialog))
        tapGesture.numberOfTapsRequired = 1
        
        navigationController?.navigationBar.addGestureRecognizer(tapGesture)
        
        //hide attachment button (will enable attachments in next update)
        inputToolbar.contentView.leftBarButtonItem = nil
        //Sets avatar/userImage size to zero hiding it
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        //Sets avatar/userImage size to zero hiding it
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        //This will query through database to keep track of new messages that may have been sent. Gets the last 10 chat messages
        let query = Constants.refs.databaseChats.queryLimited(toLast: 10)
        
        //Similar to the previous lines: takes a snapshot of the database and then displays any new messages that may be their
        //Whenever a new object is created this closure will be called
        _ = query.observe(.childAdded, with: {[weak self] snapshot in
            //Takes a snapshot of all data in a specific node (this one "chats")
            if let data = snapshot.value as? [String: String],
                let id = data["sender_id"],
                let name = data["name"],
                let text = data["text"],
                !text.isEmpty
            {
                //New JSQMessage object is created to be added to message array
                if let message = JSQMessage(senderId: id, displayName: name, text: text)
                {
                    self?.messages.append(message)
                    
                    self?.finishReceivingMessage()
                }
            }
            
        })
        
        
    }
    
    @objc func showDisplayNameDialog(){
        let defaults = UserDefaults.standard
        
        //Creates an 'alert controller' to display an aliert dialog box
        let alert = UIAlertController(title:"Your Display Name", /* Adds text that user will see */ message: "Before you can enter the chat you need a display name. Other users will see this name when you are chatting.", preferredStyle: .alert)
        
        //When the user presses 'OK' the closure is executed
        
        alert.addTextField { textField in
            
            if let name = defaults.string(forKey: "jsq_name")
            {
                textField.text = name
            } else {
                let names = ["Ford", "Arthur", "Zaphod", "Trillian", "Slartibartfast"]
                textField.text = names[Int(arc4random_uniform(UInt32(names.count)))]
            }
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak self, weak alert] _ in
            
            if let textField = alert?.textFields?[0], !textField.text!.isEmpty{
                self?.senderDisplayName = textField.text
                
                self?.title = "Chat: \(self!.senderDisplayName!)"
                
                defaults.set(textField.text, forKey: "jsq_name")
                defaults.synchronize()
            }
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    // Gives acces to "messages" to show the bubbles
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        
        //Message is returend based on path

        return messages[indexPath.item]
    }
    
    // Gives acces to "messages" to show the bubbles and how many there are
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Total amount of messages in array
        
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        //Returns what color the bubble should be depending if the user sent it
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource!{
        
        //Didn't have time to implement userImages (will do so in next update)
        return nil
    }
    
    
    //This function is called when a text label is needed
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
    }
    
    //This function is called when the height of the top label is needed
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat
    {
        //Access a specific messages and uses the property 'senderId' of that message
        return messages[indexPath.item].senderId == senderId ? 0 : 15
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        //Created new reference, generates a new unique key for each message
        let ref = Constants.refs.databaseChats.childByAutoId()
        
        //New dictionary created
        let message = ["sender_id": senderId, "name": senderDisplayName, "text": text]
        
        ref.setValue(message)
        
        //Tells JSQMVC that this function is done
        finishSendingMessage()
    }
    
}

