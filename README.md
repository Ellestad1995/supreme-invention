# supreme-invention
Welcome to the supreme-invention wiki!


> This is a repo for my free to use Swift code. 
> You're welcome to use any bit and byte of it. 
> Every subfolder contains a project or a file to use.
> Go to the relevant section below to find out how to implement it.

### Supreme-invention contains the following project or help files
- Bottom Sheet 
- Selective CollectionView
- Sloth
- Tutorial slides (A view with slides(images) to make a tutorial)

## Bottom Sheet

A Bottom Sheet. Much like iOS Apple Maps application.
Very eazy to implement.
![Bottom Sheet example](http://i.imgur.com/UCybHN5.png)

``` Swift
  //MARK! - Adding the BottomSheet
  self.bottomSheet = BottomSheet(frame: self.view.frame)
        
        
  //Add it to the bottom - the bottom sheet calculate the ofset itself
  self.bottomSheet.bottomPoint = self.view.frame.height
        
  //It shouldn't go higher than the statusBar
  self.bottomSheet.topPoint = (UIApplication.shared.statusBarFrame.height)
  //Add it to the view before running setup()
  self.view.addSubview(self.bottomSheet)
  self.bottomSheet.setup()
  
  self.bottomSheet.content = SomeCustomView() //There is a content view where you can add your own content
  self.bottomSheet.isSearchBarAdded = true //Adds a searchbar above the content view
```



## Selective CollectionView

A UICollectionView with animating cells.

Fill the cells with information, let user tap them, and add cells.

![CollectionView screenshot](http://i.imgur.com/nTxkTcw.png)

## Sloth

Some functions for verification of different types of data.
Some functions are:

``` Swift
- isValidEmail(email: String) ->
- isValidRegNumber(withRegNumber: String) -> Bool //Norwegian registration numbers
- isValidPhoneNumber(withPhoneNumber: String) -> Bool //8 numbers. Norwegian phone numbers, Excluding country code
- isValidPostalNumber(withPostalNumber: String) -> Bool //Verification of Norwegian phone numbers
- isValidISBNNumber(with ISBN: String)-> (Bool, ISBNType) //Verification of ISBN 13 and ISBN 10
```

## Tutorial Slides

A project for a simple tutorial thingy for iOS. Present this view modally, and the user will get a tutorial by scrolling through the images.
Connect a new/empty viewcontroller to TutorialSlides.
You should add some logic to now present this view every time. Maybe through UserDefaults.

```
if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TutorialSlides") as? TutorialSlides {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion: nil)
        }
```

![Tutorial Slides Screenshot Example](http://i.imgur.com/eaQVdkW.png)

![Tutorial Slides Screenshot Example](http://i.imgur.com/ezmOEtZ.png)

Remember to add the storyBoard identifier:

![Add storyboard identifier](http://i.imgur.com/Za2GxbZ.png)
