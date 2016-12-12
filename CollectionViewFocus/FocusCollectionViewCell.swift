//
//  FocusCollectionViewCell.swift
//  CollectionViewFocus
//
//  Created by Vikas on 12/12/16.
//  Copyright © 2016 Vikas. All rights reserved.
//

import UIKit

class FocusCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    
    private var isbtnFirst  = false
    private var isbtnSecond = false
    private var isDefault   = false
    
    override var preferredFocusEnvironments: [UIFocusEnvironment]{
        
        switch true {
        case isbtnFirst:
            return [btnFirst]
        case isbtnSecond:
            return [btnSecond]
        case isDefault:
            return [self]
            
        default:
            return [btnFirst]
        }
        
    }

    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        
        switch true {
            
        case isbtnFirst:
            isbtnFirst = false
            return true
        case isbtnSecond:
            isbtnSecond = false
            return true
        case isDefault:
            isDefault = false
            return true
            
        default:
            return true
        }
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        print("previouslyFocusedView : \n  \(context.previouslyFocusedView) \n \n")
        print("nextFocusedView :  \n\(context.nextFocusedView) \n")
        
        if (context.previouslyFocusedView != nil) && (context.nextFocusedView != nil){
            
            if context.nextFocusedView is FocusCollectionViewCell && context.previouslyFocusedView  !=  self.btnSecond {
                self.isbtnFirst = true
                self.setNeedsFocusUpdate()
            }
            if context.nextFocusedView  ==  self.btnFirst && context.previouslyFocusedView  ==  self.btnFirst{
                self.isbtnSecond = true
                self.setNeedsFocusUpdate()
            }
            if context.nextFocusedView  ==  self.btnSecond && context.previouslyFocusedView  ==  self.btnSecond{
                self.isDefault = true
                self.setNeedsFocusUpdate()
            }
        }
    }


}
