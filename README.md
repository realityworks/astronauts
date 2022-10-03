# astronauts

DEVELOPMENT DESIGN WRITE UP
---------------------------

The application will display a list of astronauts, with details.

The user can select an astronaut and is shown more details.

System Breakdown

DATA MODEL 
    - List of Astronauts. 
    - Individual Astronaut.
    - Detail of an Astronaut.
USECASE 
    - Load the list of Astronauts and details for an Astronaut
SERVICES 
    - REST web service to load the data model using URLSession
UTILITIES
    - UI Component management to simplify non-storyboard layout : TinyContraints
USER INTERFACE
    - ViewController
        - Search bar
        - Table/List View
            - Individual Cell
    - Styling extensions
        - Colours
        - Fonts


Additional Technical notes
Dependency injection for view models.
