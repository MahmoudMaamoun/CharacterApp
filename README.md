# Character App
Character Project is showing a List of Characters in a paginated manner with Filteration with Unit testing
the project is built with viper design pattern with SwiftUI for small views and UIKit 

## Viper Architcture Pattern 
Understanding VIPER Architecture

![viper](https://github.com/MahmoudMaamoun/CharacterApp/assets/4027697/17ab1b97-467a-45d1-b21b-bea2fedbd37d)


VIPER Architcture stands for View, Interactor, Presenter, Entity, and Router. This architecture divides the application into seperated modules, each module is very seperated, scalable , maintainable and testable
it divides the application into distinct components, each reponsible for a specific task 

#### 1. View: Displays the user interface and forwards user input to the Presenter.

#### 2. Interactor: Contains the business logic and communicates with the data layer.

#### 3. Presenter: Acts as an intermediary between the View and Interactor, handling user input and updating the View.

#### 4. Entity: Represents the data model or business objects.

#### 5. Router: Handles navigation between different modules of the application.

This separation of concerns enhances modularity, scalability, and testability.

## Unit Testing - Assumptions and Decisions

Lets start by automating the app and scroll within the table then male a tap on the cell
so in this project we will perform the tests to the following components

### Interactor
The Interactor contains the application’s business logic. 
so let's test our Module Interactor functionns (Geting Data , Pagination , Filtering)
 Assumption : Consider a scenario where the Interactor fetches data from a remote API. 

 ### Presenter
 Presenter acts between the View and Interactor. it handles user input, updates the View, and communicates with the Interactor
 Assumption : Assume a scenario where the Presenter transforms data before updating the View.

### Router
 The Router handles navigation between different modules of the application. Unit tests for the Router should cover navigation scenarios.
 Assumption: Assum that router navigates to another screen 
 
 ### View
 The View is responsible for displaying the user interface and forwarding user input to the Presenter. In unit tests, you can use mock objects to simulate user interactions and verify that the View correctly communicates with the Presenter.

 ### Entity
 For an Entity that represents a Character, a unit test might check on momdel properties constrains or formats. 

 
## Challenges Encountered
1. Challenge: in using swiftui CharacterListItemView with UIKit
   ,presenter should retrive data item to that swiftui inside UIKit
    
Solution: 
- created an Observable Object with a publishd viewModel Data Property
- get the data into that observable object through a presenter configureCell function
- dynamically the swiftui cell view get notified with the Published viewModel property

