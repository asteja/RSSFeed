//
//  AlbumTableViewCell.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    var album : Album? {
        didSet {
            albumImage.loadImageUsingCache(withUrl: album?.thumbnail)
            albumNameLabel.text = album?.name
            artistNameLabel.text = album?.artistName
        }
    }

    private let albumImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let albumNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let artistNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumImage)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
    
        albumImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 0, width: 100, height: 0, enableInsets: false)
        albumNameLabel.anchor(top: topAnchor, left: albumImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        artistNameLabel.anchor(top: albumNameLabel.bottomAnchor, left: albumImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
