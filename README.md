
# Move TextField when Keyboard Appears
## Updated to Swift 5
### This isn't a pod. 🤣

- This Includes robust hack for keyboard dismiss.
- And of course move the textfield up when keyboard appears. 

# Usage:
1) Drop a UIScrollView to your Storyboard.
2) Select UIScrollView, then go to 'Size Inspector' and and disable 'Content Layout Guides'
3) Pin Top, Left, Right and Bottom sides of the UIScrollView.
4) Place a UITextField on top of UIScrollView and add contraints to place it where you want and additionally add two extra constarints i.e., Pin to Right and Bottom (this will eliminate constraint error)
5) That's it. 
