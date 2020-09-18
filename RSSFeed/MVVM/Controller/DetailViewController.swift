//
//  DetailViewController.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var album: Album? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        
        self.title = "Album Detail"
        self.view.backgroundColor = UIColor.white
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.loadImageUsingCache(withUrl: album?.thumbnail)
        self.view.addSubview(imgView)
        imgView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        
        let textView = UITextView()
        textView.textAlignment = NSTextAlignment.center
        textView.text = "Album: \(album?.name ?? "") \nAuthor: \(album?.artistName ?? "") \nGenres: \(album?.genres.compactMap { $0["name"] }.joined(separator: ",") ?? "")\nRelease Date: \(album?.releaseDate ?? "") \n\(album?.copyright ?? "")"
        self.view.addSubview(textView)
        textView.anchor(top: imgView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 15.0
        button.setTitle("Goto iTunes Store", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        button.anchor(top: textView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, horizontal:view.centerXAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 50, enableInsets: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    @objc private func buttonAction() {
        if let urlString = album?.url, let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }

}

