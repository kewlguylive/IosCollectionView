//
//  ViewController.swift
//  CollectionView
//
//  Created by preetham uppu on 6/28/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var squareView: UICollectionView!
    
    
    var shots : [Shot]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Best Pics"
        
        squareView.delegate = self
        squareView.dataSource = self
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        
        flowLayout.itemSize = CGSizeMake(cellWidth + 20, cellHeight)
        
        flowLayout.minimumInteritemSpacing = -60
        flowLayout.minimumLineSpacing = -60
        
        //flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        shots = [Shot]()
        
        let api = DribbleAPI()
        api.loadShots("https://api.dribbble.com/v1/shots", completion: didLoadShots)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didLoadShots(shots: [Shot]){
        self.shots = shots
        squareView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       let cell = squareView.dequeueReusableCellWithReuseIdentifier("PictureCell", forIndexPath: indexPath) as PictureCell
        let shot = shots[indexPath.row]
        
        Utils.asyncLoadShotImage(shot, imageView: cell.coverImageView)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shots.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
       // performSegueWithIdentifier("details", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       /* if(segue.identifier == "details"){
            
            let selectedItems = collectionView.indexPathsForSelectedItems()
            
            let selectedIndexPath = selectedItems[0] as NSIndexPath
            let shot = shots[selectedIndexPath.row]
            
            let controller = segue.destinationViewController as ShotDetailController
            controller.shot = shot

        }*/
    }
    
     override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
         var cellWidth = calcCellWidth(size)
         flowLayout.itemSize = CGSizeMake(cellWidth, cellHeight)
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }
}