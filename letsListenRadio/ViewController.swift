//
//  ViewController.swift
//  letsListenRadio
//
//  Created by Min Hu on 2023/9/16.
//

import UIKit
import AVFoundation // 使用 AVPlayer 必須先輸入 AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView01: UIView!
    
    @IBOutlet weak var contentView02: UIView!
    
    @IBOutlet weak var contentView03: UIView!
    
    @IBOutlet weak var contentView04: UIView!
    
    @IBOutlet weak var contentView05: UIView!
    
    @IBOutlet weak var contentView06: UIView!
    
    @IBOutlet weak var contentView07: UIView!
    
    @IBOutlet weak var contentView08: UIView!
    
    @IBOutlet weak var contentView09: UIView!
    
    @IBOutlet weak var contentView10: UIView!
    
    @IBOutlet weak var contentView11: UIView!
    
    @IBOutlet weak var contentView12: UIView!
    
    @IBOutlet weak var contentView13: UIView!
    
    @IBOutlet weak var contentView14: UIView!
    
    @IBOutlet weak var contentView15: UIView!
    
    @IBOutlet weak var pauseButton: UIButton! // 暫停鍵
    @IBOutlet weak var playButton: UIButton! // 播放鍵

    @IBOutlet weak var radioImageView: UIImageView! // 播放器裡的電台圖片 ImageView
    @IBOutlet weak var radioNameLabel: UILabel! // 播放器裡的電台名稱
    var url = URL(string: "https://onair.family977.com.tw:8977/live.mp3")
    // 創建可以播放音樂的實例 player
    let player = AVPlayer()
    // 預設電台 Array 的 index 為 0
    var index = 0
    // 電台名稱、網址與圖片名稱 Array
    var radiosetting:[SetRadios] = [
        SetRadios(radioName: "ClassicalFM97.7", urlText: "https://onair.family977.com.tw:8977/live.mp3", radioImageName: "1 classicalFM97.7"),
    SetRadios(radioName: "ICRT", urlText: "http://live.leanstream.co/ICRTFM?args=tunein_aac", radioImageName: "2 ICRT"),
    SetRadios(radioName: "News 98", urlText: "https://stream.rcs.revma.com/pntx1639ntzuv.m4a", radioImageName: "3 News98"),
    SetRadios(radioName: "城市廣播網 台北 90.1", urlText: "http://fm901.cityfm.tw:8080/901.mp3", radioImageName: "4 城市廣播網"),
    SetRadios(radioName: "IC之音", urlText: "https://n10.rcs.revma.com/7mnq8rt7k5zuv", radioImageName: "5 IC 之音"),
    SetRadios(radioName: "台北廣播電台 93.1", urlText: "https://stream.ginnet.cloud/live0130lo-yfyo/_definst_/fm/playlist.m3u8", radioImageName: "6 台北廣播電台"),
    SetRadios(radioName: "中廣流行網", urlText: "https://sonnykuo.appspot.com/bcc/?id=中廣流行網", radioImageName: "7 中廣流行網"),
    SetRadios(radioName: "中廣音樂網", urlText: "https://sonnykuo.appspot.com/bcc/?id=中廣音樂網", radioImageName: "8 中廣音樂網"),
    SetRadios(radioName: "中廣新聞網", urlText: "https://sonnykuo.appspot.com/bcc/?id=中廣新聞網", radioImageName: "9 中廣新聞網"),
    SetRadios(radioName: "寰宇廣播電台", urlText: "https://n10.rcs.revma.com/srn5f9kmwxhvv", radioImageName: "10 寰宇廣播電台"),
    SetRadios(radioName: "I Go 531", urlText: "https://sonnykuo.appspot.com/bcc/?id=I%20go%20531", radioImageName: "11 I Go 531"),
    SetRadios(radioName: "國立教育廣播電台 台北 101.7", urlText: "https://cast.ner.gov.tw/1", radioImageName: "12 國立教育廣播電台"),
    SetRadios(radioName: "飛碟聯播網", urlText: "https://stream.rcs.revma.com/em90w4aeewzuv.m4a", radioImageName: "13 飛碟聯播網"),
    SetRadios(radioName: "中央廣播電台", urlText: "https://streamak0138.akamaized.net/live0138lh-mbm9/_definst_/rti3/playlist.m3u8", radioImageName: "14 中央廣播電台"),
    SetRadios(radioName: "亞洲電台 FM 92.7", urlText: "https://stream.rcs.revma.com/xpgtqc74hv8uv", radioImageName: "15 亞洲電台")
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        contentViewBorder()
        // 初始狀態不顯示暫停鍵
        pauseButton.isHidden = true
        playButton.isHidden = true
   
    }
    // 預先宣告一個 CALayer 變數
    var contentLayer = CALayer()
    // 設定外框的函式
    fileprivate func setContentLayer(_ contentView: UIView) {
        contentLayer = CALayer()
        contentLayer.frame = contentView.bounds
        contentLayer.borderWidth = 5
        contentLayer.borderColor = CGColor(red: 240/255, green: 206/255, blue: 160/255, alpha: 1)
        contentView.layer.addSublayer(contentLayer)
    }
    // 設定全部的外框
    func contentViewBorder(){
        setContentLayer(contentView01)
        setContentLayer(contentView02)
        setContentLayer(contentView03)
        setContentLayer(contentView04)
        setContentLayer(contentView05)
        setContentLayer(contentView06)
        setContentLayer(contentView07)
        setContentLayer(contentView08)
        setContentLayer(contentView09)
        setContentLayer(contentView10)
        setContentLayer(contentView11)
        setContentLayer(contentView12)
        setContentLayer(contentView13)
        setContentLayer(contentView14)
        setContentLayer(contentView15)
    }
    
    // 設定電台細節
    fileprivate func setRadioDetail() {
        radioNameLabel.text = radiosetting[index].radioName
        radioImageView.image = UIImage(named: radiosetting[index].radioImageName)
        // 創建電台串流的 URL
        url = URL(string: radiosetting[index].urlText)
        // 創建 playerItem 表示要播放的音樂項目
        if url != nil{
            let playerItem = AVPlayerItem(url: url!)
            // 替換現有的 AVPlayer 項目為新創建的音樂項目
            player.replaceCurrentItem(with: playerItem)
            // 開始播放音樂
            player.play()
            pauseButton.isHidden = false // 顯示暫停鍵
            playButton.isHidden = true // 隱藏播放鍵
        }
        
        else{
            radioNameLabel.text! += "維護中"
            pauseButton.isHidden = true // 顯示暫停鍵
            playButton.isHidden = false // 隱藏播放鍵
            player.pause()
        }
    }
    // 點擊 classicalFM977 Button 觸發的動作
    @IBAction func classicalFM977(_ sender: UIButton) {
        index = 0
        setRadioDetail()
    }
    
    @IBAction func clickICRT(_ sender: UIButton) {
        index = 1
        setRadioDetail()
    }
    
    @IBAction func clickNesw98(_ sender: UIButton) {
        index = 2
        setRadioDetail()
    }
    
    @IBAction func click901(_ sender: UIButton) {
        index = 3
        setRadioDetail()
    }
    
    @IBAction func clickICSound(_ sender: UIButton) {
        index = 4
        setRadioDetail()
    }
    
    @IBAction func click931(_ sender: UIButton) {
        index = 5
        setRadioDetail()
    }
    
    @IBAction func clickBCCPopular(_ sender: UIButton) {
        index = 6
        setRadioDetail()
    }
    
    @IBAction func clickBCCMusic(_ sender: UIButton) {
        index = 7
        setRadioDetail()
    }
    
    @IBAction func clickBCCNews(_ sender: UIButton) {
        index = 8
        setRadioDetail()
    }
    
    @IBAction func clickUni967(_ sender: UIButton) {
        index = 9
        setRadioDetail()
    }
    
    @IBAction func clickIGo531(_ sender: UIButton) {
        index = 10
        setRadioDetail()
    }
    
    @IBAction func click1017(_ sender: UIButton) {
        index = 11
        setRadioDetail()
    }
    
    @IBAction func clickUFONetwork(_ sender: UIButton) {
        index = 12
        setRadioDetail()
    }
    
    @IBAction func clickRTI(_ sender: UIButton) {
        index = 13
        setRadioDetail()
    }
    
    @IBAction func clickAsiaFM(_ sender: UIButton) {
        index = 14
        setRadioDetail()
    }
    
    // 點擊播放鍵觸發的動作
    @IBAction func playMusic(_ sender: UIButton) {
        // 開始播放音樂
        player.play()
        pauseButton.isHidden = false // 顯示暫停鍵
        playButton.isHidden = true // 隱藏播放鍵
        
    }
    
    // 點擊暫停鍵觸發的動作
    @IBAction func pauseMusic(_ sender: UIButton) {
        player.pause() // 暫停播放
        pauseButton.isHidden = true // 隱藏暫停鍵
        playButton.isHidden = false // 顯示播放鍵
    }
    
}

