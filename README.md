## Steps To Run Project

  1) **sudo gem install cocoapods**
  2) **sudo arch -x86_64 gem install ffi**
  3) **pod install** (run this command in project folder) 
  4) If step 3 does not solve the issue run this command  
      **arch -x86_64 pod install** (run this command in project folder)
  5) Once cocoapods installation is done run the project by double click this file **KitchenAnywhere.xcworkspace**

- **Note** - If project will open directly it will not run because of cocoapods so **Step-5** is mandatory.

## Team Members

  - Milan Sheladiya (2092040)
  - Namra Patel (2093971)
  - Nency Patel (2093945)
  - Dishant Desai (2094440)

## Project Credentials

- **Foodie**
    
      email - namr@gmail.com
      password - Namra@123
      
- **Chef**

      email - johm@gmail.com
      password - 123456
      
- **Admin**

      email - admin
      password - admin

## Project Contribution

- ***Milan Sheladiya(Team Leader)***
 
        Signup:
            => User registration with firebase
            => After registration new user added to firebase

        Foodie:
            => Bottom Bar
                  UI(Profile/Home/Settings) 
                  Navigation respected screens
            => DishDetail
                  User can change the quantity using number picker
                  Add selected dish to cart with selected quantity
            => View Order
                  Fetch all order list for chef added dish 
                  Group based on orderId

        Chef:
            => List of Dishes 
                  UI
                  Fetch list of dishes from firestore and display based on chef
            => Add Dish 
                  UI 
                  Validation 
            => Edite Dish 
                  Update changed data to firestore
            => View Order 
                  UI 
                  Fetch all order list for chef added dish
                  Group based on orderId

- ***Namra Patel (2093971) ***

       Login:
            => Login With Firebase/UI
            
       Foodie:
            => Home Screen 
                  List of popular dishes 
                  Delicious Dishes 
                  Add favorite icon and functionality for dish card 
            => DishDetail
                  UI 
                  Set data of dishe from firebase
            => Cart 
                  UI
                  Change the quantity
                  Delete dishes from cart
            => Order
                  Create proper formate of order and all dish of order
                  Add order detail to firebase
            => Payment
                  UI
            => Favorite
                  UI
                  List favorite dish

- ***Nency Patel***

      Documentation:
            => Class Diagram
            => Activity Diagram
            => Sequence Diagram
            => Use Case Diagram
            => User Stories
      Signup
            => Validation
      Foodie:
            => Profile
                  UI
                  Update profile detail to firestore
            => View Order
                  UI 
      Chef:
            => Dashboard Screen 
                  UI
                  Navigate to different features
            => Profile
                  UI
                  Update profile detail to firestore


- ***Dishant Desai***


      Login:
            => Redirect user based on useType(Admin,Chef,Foodie)
            => If chef user profile is pending or rejected prevent from login
      Signup:
            => Signup UI
      Foodie:
            => Home Screen 
                  UI 
                  Category 
                  Search dishes 
                  Add favorite icon and functionality for dish card
            => Settings
                  UI(Orders,Favourite,Logout)
                  Navigation respected screens
       Admin 
            => List chef UI 
            => Filter based on userType
            => Approve and reject chef profile (UI and firebase integration)
      Chef
            => Add Dish 
                  Upload Image to firebase 
                  Add all dish data to firestore


      







