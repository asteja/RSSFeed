//
//  ViewModel.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import Foundation
import UIKit.UIImage

public class ViewModel {
    
    var rssFeedData:Box<RSSFeed?> = Box(nil)
    var apiError:Box<APIError?> = Box(nil)

    func fetchAlbumData() {
        APIClient.albumData { (rssFeedData, apiError) in
            guard let rssFeedData = rssFeedData else {
                self.apiError.value = apiError
                return
            }
            self.rssFeedData.value = rssFeedData
        }
    }
    
}
