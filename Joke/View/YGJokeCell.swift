//
//  YGJokeCell.swift
//  Joke
//
//  Created by 杨业高(外包) on 2018/5/30.
//  Copyright © 2018年 杨业高(外包). All rights reserved.
//

import UIKit
import SnapKit

class YGJokeCell: UITableViewCell {
   
    var icon : UIImageView!
    var nickNameLabel : UILabel!
    var contentLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
      
        icon = UIImageView(frame: CGRect.zero)
        icon.layer.borderWidth = 1;
        icon.layer.borderColor = UIColor.cyan.cgColor
        self.contentView.addSubview(self.icon)
        icon.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(10)
        }
        
        nickNameLabel = UILabel(frame: CGRect.zero)
        nickNameLabel.layer.borderWidth = 1;
        nickNameLabel.layer.borderColor = UIColor.cyan.cgColor
        nickNameLabel.text = "匿名"
        self.contentView.addSubview(self.nickNameLabel)
        nickNameLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.icon.snp.right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.numberOfLines = 0
        contentLabel.backgroundColor = UIColor.cyan
        self.contentView.addSubview(self.contentLabel)
        contentLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.contentView.snp.leading).offset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.top.equalTo(self.icon.snp.bottom).offset(10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }
    
    
    func updateCell(_ joke : YGJokeInfo) {
        if let content = joke.content {
            self.contentLabel.text = content
            print(content)
            print()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
