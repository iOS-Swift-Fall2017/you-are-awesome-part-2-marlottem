//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Marc Marlotte on 9/5/17.
//  Copyright © 2017 Marlotte. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 3
    let numberOfSounds = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - My Own Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        // Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            // check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
                
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        } else {
            // If reading in the NSDataAsset didn't work, tell the developer / report the error
            print("ERROR: file \(soundName) didn't load.")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    // MARK: - Actions
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            if last
                awesomePlayer.stop()
            }
        }
    
    @IBAction func showMessageButtonPressed(_ sender: UIButton) {
       
        let messages = ["You are fantastic!",
                        "You are great!",
                        "You are amazing!",
                        "When the genius bar needs help, they call you!",
                        "You brighten my day!",
                        "You Are Da Bomb!",
                        "I can't wait to finally use your app!"]
        
        // Show a message
        // NOT NEEDED ANYMORE BECAUSE WE USED FUNCTION BELOW TO SHRINK CODE AND DID SAME THING TO IMAGES AND SOUNDS
//        repeat {
//            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
//        } while index == newIndex
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // Show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            //Get a random number to use in our soundName file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            // Play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
        /*
        frontLabel.text = messages[index]
        index += 1
        
        
        if index == messages.count - 1 {
            index = 0
        } else {
            index = index + 1
        }
        */
        
//        if frontLabel.text == messages.last {
//            index = 0
//        }
        
        
//        if frontLabel.text == messages[0] {
//            frontLabel.text = messages[1]
//        } else if frontLabel.text == messages[1] {
//            frontLabel.text = messages[2]
//        } else if frontLabel.text == messages[2] {
//            frontLabel.text = messages[3]
//        } else if frontLabel.text == messages[3] {
//            frontLabel.text = messages[4]
//        } else if frontLabel.text == messages[4] {
//            frontLabel.text = "You Are Awesome!"
//        } else if frontLabel.text == "You Are Awesome!" {
//            frontLabel.text = messages[0]
//        } else {
//            frontLabel.text = messages[0]
//        }
        
//        let message1 = "You Are Da Bomb"
//        let message2 = "You Are Great"
//        let message3 = "You Are Decent"
//
//        if frontLabel.text == message1 {
//            frontLabel.textColor = UIColor.cyan
//        } else if frontLabel.text == message2 {
//            frontLabel.textColor = UIColor.brown
//        } else {
//            frontLabel.textColor = UIColor.purple
//        }
//
//        if frontLabel.text == message1 {
//            frontLabel.text = message2
//        } else if frontLabel.text == message2 {
//            frontLabel.text = message3
//        } else {
//            frontLabel.text = message1
//        }
        
    }
    
}

