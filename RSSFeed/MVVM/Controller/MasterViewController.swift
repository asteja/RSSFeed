//
//  MasterViewController.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var albums = [Album]()
    private let viewModel = ViewModel()
    private let cellId = "AlbumCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: cellId)
        
        viewModel.fetchAlbumData()
        viewModel.rssFeedData.bind { [weak self] rssFeedData in
            guard let rssFeedData = rssFeedData, let feed = rssFeedData.feed, let albums = feed.albums else {
                return
            }
            self?.albums.append(contentsOf: albums)
            self?.tableView.reloadData()
        }
        viewModel.apiError.bind { [weak self] apiError in
            guard let apiError = apiError else {
                return
            }
            let alert = UIAlertController(title: apiError.rawValue, message: "Please try again later", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self?.present(alert, animated: true)
        }
                
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        cell.album = albums[indexPath.row]
        return cell
    }
    
    override func tableView(_: UITableView, heightForRowAt: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_: UITableView, didSelectRowAt: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.album = albums[didSelectRowAt.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}

