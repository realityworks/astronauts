# astronauts

DEVELOPMENT DESIGN WRITE UP
---------------------------

Written in : xcode 14.0
Tested on iOS 14, 15 and 16 (Didn't run on iOS 12)

Setup : 
Should be just a matter of pulling the project and waiting for SwiftPM to resolve packages.
Only thing would be to select a different team for the signing. I've set it up as my person team.
Didn't have time to setup a full fastlane Match process.

Details
The application will display a list of astronauts, with details.

The user can select an astronaut and is shown more details.

System Breakdown:

DATA MODEL 
    - List of Astronauts. 
    - Individual Astronaut.
    - Detail of an Astronaut.
DOMAIN:
    UseCase
        - Load the list of Astronauts and details for an Astronaut
    Store 
        - Manages the shared app state, as example of how we can separate concerns between the presentation layer and the business logic
SERVICES 
    - API web service to load the data model using URLSession
UTILITIES
    - UI Component management to simplify non-storyboard layout : TinyContraints
USER INTERFACE
    - MainViewController
        - Table/List View
            - Individual Cell
                - Text
                - Lazy loaded icon
    - DetailViewController
        - Text details

Dependency injection for view models
Basic dependency injection using a builder factory model for classes, as an example of how we could do DI.
