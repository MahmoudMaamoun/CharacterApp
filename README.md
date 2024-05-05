# Character App
Character Project is showing a List of Characters in a paginated manner with viper design pattern and Unit testing
Project is build with SwiftUI for small views and UIKit 

## Viper Architcture Pattern 
![viper](https://github.com/MahmoudMaamoun/CharacterApp/assets/4027697/17ab1b97-467a-45d1-b21b-bea2fedbd37d)

## Assumptions and Decisions
### reason for choosing viper design pattern
### ADD Unit Testing
## Challenges Encountered
1. Challenge 1: Since we are using swiftui CharacterListItemView with UIKit
   so presenter should connect to that swiftui inside UICell and update it
   with the presented data in seperation manner.
    
Solution: 
- created an Observable Object with a publishd viewModel Data Property
- get the data into that observable object through a presenter configureCell function
- dynamically the swiftui cell view get notified with the Published viewModel property

