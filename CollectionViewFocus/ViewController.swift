//
//  ViewController.swift
//  CollectionViewFocus
//
//  Created by Vikas on 12/12/16.
//  Copyright © 2016 Vikas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var cvList:UICollectionView!

    fileprivate var arrayCV:[Any] = []

    private func initialization(){
        
        arrayCV = ["1","2","1","2","1","2","1","2","1","2","1","2"]
        self.cvList.delegate = self
        self.cvList.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initialization()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK:- UICollectionViewDelegate

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayCV.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCollectionViewCell", for: indexPath) as! FocusCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        return CGSize(width: 700, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if (context.previouslyFocusedView != nil){
            
            coordinator.addCoordinatedAnimations({
                
                context.previouslyFocusedView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
                }, completion: nil)
        }
        
        if (context.nextFocusedView != nil){
            coordinator.addCoordinatedAnimations({
                context.nextFocusedView?.transform = CGAffineTransform(scaleX: 1.2, y: 1.3);
                
                }, completion: nil)
        }
    }
}





