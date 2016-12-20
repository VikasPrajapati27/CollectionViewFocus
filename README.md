# CollectionViewFocus
This is a CollectionView Focus Update for tv-os .

## Problem :

Now, In tv-os application developement you can not move focus at button(which is in collectionViewCell) and collectionViewCell vice versa . 

## Solution :

You can use this library for move focus at button and Cell viceVersa

## Preview :
<img src="https://github.com/VikasPrajapati27/CollectionViewFocus/blob/master/CollectionViewFocus.gif" width="420"/>

##  How to use it:
Put this code in your collectionViewCell file, i have two button in collectionViewCell and i am able to move focas in butoon and cell vice versa.
<code>

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
</code>
