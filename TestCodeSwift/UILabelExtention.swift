//
//  UILabelExtention.swift
//  TestCodeSwift
//
//  Created by Vien Vu  on 12/22/15.
//  Copyright © 2015 VienVu. All rights reserved.
//

import UIKit


extension UILabel: NSLayoutManagerDelegate {
    
    
    func resolveHashTags(){
        
        // turn string in to NSString
        let nsText:NSString = self.text!
        
        // this needs to be an array of NSString.  String does not work.
        let words:[NSString] = nsText.componentsSeparatedByString(" ")
        
        // you can't set the font size in the storyboard anymore, since it gets overridden here.
        let attrs = [
            NSFontAttributeName : UIFont.systemFontOfSize(17.0)
        ]
        
        // you can staple URLs onto attributed strings
        let attrString = NSMutableAttributedString(string: nsText as String, attributes:attrs)
        
        // tag each word if it has a hashtag
        for word in words {
            
            // found a word that is prepended by a hashtag!
            // homework for you: implement @mentions here too.
            if word.hasPrefix("#") {
                
                // a range is the character position, followed by how many characters are in the word.
                // we need this because we staple the "href" to this range.
                let matchRange:NSRange = nsText.rangeOfString(word as String)
                
                // convert the word from NSString to String
                // this allows us to call "dropFirst" to remove the hashtag
                var stringifiedWord:String = word as String
                
                // drop the hashtag
                stringifiedWord = String(stringifiedWord.characters.dropFirst())
                
                // check to see if the hashtag has numbers.
                // ribl is "#1" shouldn't be considered a hashtag.
                let digits = NSCharacterSet.decimalDigitCharacterSet()
                
                if let numbersExist = stringifiedWord.rangeOfCharacterFromSet(digits) {
                    // hashtag contains a number, like "#1"
                    // so don't make it clickable
                    print(numbersExist)
                } else {
                    // set a link for when the user clicks on this word.
                    // it's not enough to use the word "hash", but you need the url scheme syntax "hash://"
                    // note:  since it's a URL now, the color is set to the project's tint color
                    attrString.addAttribute(NSLinkAttributeName, value: "hash:\(stringifiedWord)", range: matchRange)
                }
                
            }
        }
        self.attributedText = attrString
    }
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
}