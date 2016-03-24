//
//  CollectionViewController.swift
//  CollectionViewSideSwipe
//
//  Created by Archuthan Vijayaratnam on 11/13/15.
//  Copyright © 2015 Flybits. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let kCellHeight: CGFloat = 182.0

class CollectionViewController: UICollectionViewController {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        return cell
        
    }
    
    // Resize each cell width to fill the collection view's width and height is 
    // set to 182
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width, kCellHeight)
    }
}
