# ScheduleExercise

## Core Functionality Requirement
ScheduleExercise is an iOS application designed to display and manage sports game schedules. It fetches, processes, and presents game data, allowing users to view schedules, teams, and game details in an organized and visually appealing manner.

## Main Features
- Fetch and display a list of scheduled games from a remote or local source
- View detailed information for each game, including teams, date, and status
- Organized presentation of games by sections (e.g., by date or team)
- Modern, responsive UI with support for light and dark mode
- Local data caching for offline access

## Clean Architecture in ScheduleExercise

The project follows Clean Architecture principles, organizing code into distinct layers to ensure separation of concerns, testability, and maintainability. Below is an overview of how Clean Architecture is applied in this project:

### Layered Structure

```
Presentation
│
├── View (SwiftUI Views)
├── ViewModel (MVVM)
│
Domain
│
├── Entity (Business Models)
├── UseCase (Business Logic)
├── Repository (Abstractions)
│
Data
│
├── APIEndpoint (API Endpoints)
├── DTO (Data Transfer Objects)
├── Network (Networking)
├── RepositoryImpl (Implementations)
│
Utilities
│
├── Enum (Enums)
├── Extension (Extensions)
├── ImageView (Image Helpers)
├── Theme (App Theming)
│
Resources (Assets)
```

### Layer Descriptions

- **Presentation Layer**: Contains SwiftUI views and ViewModels. Handles UI logic and user interaction, communicates with the Domain layer via UseCases and ViewModels.
- **Domain Layer**: Contains core business logic, entities, and use case definitions. Defines repository interfaces (protocols) for data access.
- **Data Layer**: Handles data sources (network, local JSON), DTOs for data mapping, and concrete repository implementations. Converts raw data into domain entities.
- **Utilities/Resources**: Shared helpers, enums, extensions, and assets used across layers.

### Example Flow
1. **View** triggers an action (e.g., fetch schedule).
2. **ViewModel** calls a **UseCase** from the Domain layer.
3. **UseCase** requests data via a **Repository** protocol.
4. **RepositoryImpl** in the Data layer fetches data (network/local), maps DTOs to Entities, and returns them.
5. **ViewModel** updates the **View** with new data.


## Non-Functional Requirements
- Fast and responsive user interface
- Robust error handling and user feedback for network or data issues
- Modular and maintainable codebase following clean architecture principles
- Scalability for future feature additions
- Accessibility support for all users

## Technologies Applied
- Swift and SwiftUI for UI development
- MVVM (Model-View-ViewModel) architecture
- Codable for JSON parsing
- URLSession for networking
- Local data storage for offline support from JSON file
- Xcode project structure with unit testing

## Best Practices Highlighted
- Separation of concerns using Domain, Data, and Presentation layers
- Use of protocols and dependency injection for testability
- Clear and consistent naming conventions
- Use of DTOs for data transfer and mapping
- Comprehensive error handling and user feedback
- Unit tests for core business logic and services
- Asset management for images and resources

---

For more details, refer to the codebase and inline documentation.
