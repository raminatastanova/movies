# Movies

This iOS app allows users to explore trending movies and view detailed information about each movie.

### Features:
- Displays a list of trending movies fetched from RapidAPI.
- Allows users to select a movie and view detailed information (title, description, release date, etc.).
- MVVM architecture for clean and maintainable code.
- Uses UIKit for UI elements and SnapKit for auto-layout.
- Fetches data using `URLSession` for network requests.

### Setup Instructions

#### Prerequisites:
- Xcode 12.0 or higher.
- macOS 10.15 (Catalina) or higher.
- An active RapidAPI account and an API key.

#### 1. Clone the repository:
```bash
git clone https://github.com/your-username/movies-ios-app.git
```

#### 2. Add your RapidAPI key:
The app requires a valid **RapidAPI key** to fetch data from the RapidAPI service.

1. Open the `Release.xcconfig` file located in your project folder.
2. Locate the line `API_KEY = ENTER_YOUR_KEY`.
3. Replace `ENTER_YOUR_KEY` with your personal RapidAPI key.

   Example:
   ```xcconfig
   // Release.xcconfig
   BASE_URL = https://movies-tv-shows-database.p.rapidapi.com
   API_KEY = ENTER_YOUR_KEY
   ```

#### 3. Configure API Base URL:
The app uses a base URL defined in the `Release.xcconfig` file:
```xcconfig
BASE_URL = https://movies-tv-shows-database.p.rapidapi.com
```

Ensure that this URL matches the correct endpoint for the RapidAPI Movies service you’re using.

#### 4. Open the project in Xcode:
1. Open the `.xcodeproj` or `.xcworkspace` file in Xcode.
2. Make sure the correct build configuration (Release) is selected to use the settings from `Release.xcconfig`.

#### 5. Install Dependencies:
This project uses SnapKit for auto-layout. If you're using CocoaPods or Swift Package Manager, make sure to install any dependencies before building the project.

For CocoaPods:
```bash
pod install
```

For Swift Package Manager, dependencies will be resolved automatically.

#### 6. Build and Run:
1. Build the project by pressing `Cmd + B`.
2. Run the app on a simulator or a physical device by pressing `Cmd + R`.

### Troubleshooting

- **Missing API Key**: If you encounter an issue related to the API key, make sure you've correctly set your `API_KEY` in the `Release.xcconfig` file.
- **Build Errors**: Clean and rebuild the project (`Cmd + Shift + K` to clean, `Cmd + B` to rebuild).
- **Network Errors**: Ensure that your internet connection is stable and that you’re correctly passing the API key and base URL in your network requests.
