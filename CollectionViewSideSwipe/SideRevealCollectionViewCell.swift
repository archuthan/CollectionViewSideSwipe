//
//  SideRevealCollectionViewCell.swift
//  CollectionViewSideSwipe
//
//  Created by Archuthan Vijayaratnam on 11/13/15.
//  Copyright © 2015 Flybits. All rights reserved.
//

import UIKit

class SideRevealCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rightView: UIView!
}


extension SideRevealCollectionViewCell : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        // user scrolled right to left -- finish the scrolling by hiding the RightView which brings LeftView into full view
        if velocity.x < 0 || scrollView.panGestureRecognizer.translationInView(scrollView).x > 0 {
            
            targetContentOffset.memory.x = 0
            
        }
        // user scrolled left to right -- finish the scrolling by bringing the RightView to visible
        else if velocity.y > 0 || scrollView.panGestureRecognizer.translationInView(scrollView).x < 0
        {
            
            targetContentOffset.memory.x = rightView.frame.width
        }

        // animates the scrolling to take 0.3 second
        UIView.animateWithDuration(0.3,
            delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            scrollView.contentOffset = targetContentOffset.memory
            
        }, completion: nil)
    }
}