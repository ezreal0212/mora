//
//  ViewController.swift
//  mora
//
//  Created by Apple on 2018/5/28.
//  Copyright © 2018年 Apple. All rights reserved.
//
//import AVFoundation
import UIKit
import GameplayKit
class ViewController: UIViewController {
    
    let gameTalk = ["沒有","五","十","十五","二十"] //喊拳陣列
    
    let gamePlay = ["沒有","五","十"] //出拳陣列
    
  
    @IBOutlet weak var button20: UIButton! //喊拳
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var whosTurnLabel: UILabel! //換誰喊
    @IBOutlet weak var talkLabel: UILabel! //顯示喊的拳
    
    @IBOutlet weak var playerScore: UILabel! //我的得分
    @IBOutlet weak var npcScore: UILabel!//老闆得分
    
    @IBOutlet weak var resultLabel: UILabel! //顯示出拳結果
     @IBOutlet weak var winnerLabel: UILabel!//顯示贏家
    
    @IBOutlet weak var npcFistPic: UILabel! //老闆出拳圖示(emoji)
    @IBOutlet weak var playerFistPic: UILabel!//我出拳圖示
   
    
    var pScore = 0                ///初始得分
    var nScore = 0                ///初始得分
    var player = "", npcPlayer = ""
    var playerPic = ""            ///我出拳圖示
    var npcPlayerPic = ""         ///老闆出拳圖示
    var playerTalk = ""          ///我喊的拳
    var npcPlayerTalk = ""      ///老闆喊的拳
    var round = 0               ///初始回合
    


    
    @IBAction func playTalk0(_ sender: Any) {
        playerTalk = gameTalk [0]
        talkLabel.text = "我喊：沒有！"
        
    }//按0後 playerTalk＝“沒有”,talkLabel 顯示 “我喊沒有”
    
    @IBAction func playTalk5(_ sender: Any) {
        playerTalk = gameTalk [1]
        talkLabel.text = "我喊：五！"
    }
    
    @IBAction func playTalk10(_ sender: Any) {
        playerTalk = gameTalk [2]
        talkLabel.text = "我喊：十！"
    }
    
    @IBAction func playTalk15(_ sender: Any) {
        playerTalk = gameTalk [3]
        talkLabel.text = "我喊：十五！"
    }
    @IBAction func playTalk20(_ sender: Any) {
        playerTalk = gameTalk [4]
        talkLabel.text = "我喊：二十！"
    }

    
    
    @IBAction func buttonNone(_ sender: Any) {
        player = gamePlay [0]
        npcPlayer = gamePlay[GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()]
        show(playerFists: player, npcPlayerFists: npcPlayer)
        round += 1
    }//出拳”沒有“,老闆隨機出拳,回合+1
    
    @IBAction func buttonFive(_ sender: Any) {
        player = gamePlay [1]
        npcPlayer = gamePlay[GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()]
        show(playerFists: player, npcPlayerFists: npcPlayer)
        round += 1
    }
    
    @IBAction func buttonTen(_ sender: Any) {
        player = gamePlay [2]
        npcPlayer = gamePlay[GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()]
        show(playerFists: player, npcPlayerFists: npcPlayer)
        round += 1
    }
  
    
    
    func show (playerFists:String, npcPlayerFists:String){
        var result = ""
        var winner = ""
        
        if playerFists == "沒有"{
            playerPic = "✊✊"
        }else if playerFists == "五"{
            playerPic = "🖐✊"
        }else {
            playerPic = "🖐🖐"
        }
        
        
        if npcPlayerFists == "沒有"{
            npcPlayerPic = "✊✊"
        }else if npcPlayerFists == "五"{
            npcPlayerPic = "🖐✊"
        }else{
            npcPlayerPic = "🖐🖐"
        }
        
        
        if  playerFists == "沒有" && npcPlayerFists == "沒有"{
 
            result = "零"
        }else if playerFists == "沒有" && npcPlayerFists == "五"{
            
            result = "五"
        }else if playerFists == "沒有" && npcPlayerFists == "十"{
            
            result = "十"
        }else if playerFists == "五" && npcPlayerFists == "沒有"{
            
            result = "五"
        }else if playerFists == "五" && npcPlayerFists == "五"{
            
            result = "十"
        }else if playerFists == "五" && npcPlayerFists == "十"{
            
            result = "十五"
        }else if playerFists == "十" && npcPlayerFists == "十"{
            
            result = "二十"
        }else if playerFists == "十" && npcPlayerFists == "五"{
            
            result = "十五"
        }else if playerFists == "十" && npcPlayerFists == "沒有"{
            
            result = "十"
        }
        
        
        
       
        self.playerFistPic.text = self.playerPic
        self.playerFistPic.isHidden = false

        self.npcFistPic.text = self.npcPlayerPic
        self.npcFistPic.isHidden = false
        
/////////////// 1.3.5.7.9.....回合為老闆的回合/////////
        if round % 2 == 1 {
            whosTurnLabel.text = "我的回合！" /////老闆回合結束同時顯示輪到我的回合文字
           
            self.button0.isHidden = false
            self.button5.isHidden = false
            self.button10.isHidden = false
            self.button15.isHidden = false
            self.button20.isHidden = false
            
            playerTalk = gameTalk[GKRandomDistribution(lowestValue: 0, highestValue: 4).nextInt()]
             talkLabel.text = "老闆喊：\(playerTalk)!"
            
            if result == playerTalk{
                winner = "老闆贏"
            }else{
                winner = "我贏"
            }
            }
            
//////////////0.2.4.6.8.10...為我的回合//////////////
        else{
            whosTurnLabel.text = "換老闆喊！"
            self.button0.isHidden = true
            self.button5.isHidden = true
            self.button10.isHidden = true
            self.button15.isHidden = true
            self.button20.isHidden = true
            if result == playerTalk{
                winner = "我贏"

            }else{
                winner = "老闆贏"
                
            }
        }
  /////////////得分/////////////////
        if winner == "我贏" {
            pScore += 1
        }else{
            nScore += 1
        }
        
 //////////Label Layout//////////
        winnerLabel.text = " 贏家:\(winner)"
        playerScore.text = "\(pScore)"
        npcScore.text = "\(nScore)"
        resultLabel.text = "我出:\(playerFists), 老闆出:\(npcPlayerFists) \n 總和:\(result) "
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

