//
//  YGJokeCell.swift
//  Joke
//
//  Created by 杨业高(外包) on 2018/5/30.
//  Copyright © 2018年 杨业高(外包). All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import AVFoundation
import AVKit
import MediaPlayer

class YGJokeCell: UITableViewCell {
   
    var icon : UIImageView!
    var nickNameLabel : UILabel!
    var contentLabel : UILabel!
    var videoView : UIView!
    var imgView: UIImageView!
    var format : String!
    var joke : YGJokeInfo!
    var playBtn : UIButton!
    var player : AVPlayer!
    var playerLayer : AVPlayerLayer!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(joke: YGJokeInfo) {
        
        var reuseIdentifier: String?
        format = joke.format
        
        if format == "video" {
            reuseIdentifier = "VideoCell"
        }else if format == "image" {
            reuseIdentifier = "ImageCell"
        }else{
            reuseIdentifier = "WordCell"
        }

        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        if format == "video" {
            setupUI4Video()
        }else if format == "image" {
            setupUI4Image()
        }else{
            setupUI4Word()
        }
        
        updateCell(joke)
        
        self.joke = joke
    }
    
    
    func setupUI4Video() {
        icon = UIImageView(frame: CGRect.zero)
        self.contentView.addSubview(self.icon)
        icon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
        }
        
        nickNameLabel = UILabel(frame: CGRect.zero)
        nickNameLabel.text = "匿名"
        nickNameLabel.textColor = UIColor.blue
        self.contentView.addSubview(self.nickNameLabel)
        nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.icon.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(self.contentLabel)
        contentLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.contentView.snp.leading).offset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.top.equalTo(self.icon.snp.bottom).offset(10)
        }
        
        videoView = UIView(frame: CGRect.zero)
        videoView.backgroundColor = UIColor.black
        self.contentView.addSubview(self.videoView)
        videoView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(200)
            make.top.equalTo(self.contentLabel.snp.bottom).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
        }
        
        playBtn = UIButton(type: .custom)
        playBtn.setTitle("Play", for: .normal)
        playBtn.addTarget(self, action: #selector(playVideo),for:.touchUpInside)
        self.videoView.addSubview(self.playBtn)
        playBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.center.equalTo(self.videoView.snp.center)
        }
        
    }
    
    @objc func playVideo() {
        self.playerLayer.frame = self.videoView.bounds
        self.player.play()
    }
    
    func setupUI4Image() {
        icon = UIImageView(frame: CGRect.zero)
        self.contentView.addSubview(self.icon)
        icon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
        }
        
        nickNameLabel = UILabel(frame: CGRect.zero)
        nickNameLabel.text = "匿名"
        nickNameLabel.textColor = UIColor.blue
        self.contentView.addSubview(self.nickNameLabel)
        nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.icon.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(self.contentLabel)
        contentLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.contentView.snp.leading).offset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.top.equalTo(self.icon.snp.bottom).offset(10)
        }
        
        imgView = UIImageView(frame: CGRect.zero)
        self.contentView.addSubview(self.imgView)
        imgView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(150)
            make.top.equalTo(self.contentLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
        }
    }
    
    func setupUI4Word() {
        icon = UIImageView(frame: CGRect.zero)
        self.contentView.addSubview(self.icon)
        icon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
        }
        
        nickNameLabel = UILabel(frame: CGRect.zero)
        nickNameLabel.text = "匿名"
        nickNameLabel.textColor = UIColor.blue
        self.contentView.addSubview(self.nickNameLabel)
        nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.icon.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.numberOfLines = 0
        self.contentView.addSubview(self.contentLabel)
        contentLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.contentView.snp.leading).offset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.top.equalTo(self.icon.snp.bottom).offset(10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }
    
    
    
    func updateCell(_ joke : YGJokeInfo) {
        if let icon = joke.user?.thumb {
            self.icon.kf.setImage(with: URL(string:"https:"+icon))
        }
        
        if let nickName = joke.user?.login {
            self.nickNameLabel.text = nickName
        }
        
        if let content = joke.content {
            self.contentLabel.text = content
        }
        if joke.format == "video", let path = joke.low_url {
            
            let playerItem = AVPlayerItem(url: URL(string: path)!)
            self.player = AVPlayer(playerItem: playerItem)
            self.playerLayer = AVPlayerLayer(player: self.player)
            //这时候的videoview的frame还是0的，约束还没成功转换成frame，点击播放的时候，再设置一下
            self.playerLayer.frame = self.videoView.bounds
            self.videoView.layer.addSublayer(playerLayer)
        }
        if joke.format == "image", let path = joke.high_loc {
            self.imgView.kf.setImage(with: URL(string:"https:"+path))
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
