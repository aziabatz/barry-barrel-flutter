# Flutter Barcode Scanner
## Codename (WIP): `BarryBarrel`

This is the repository for my _barcode scanner & stock manager_ app, codenamed BarryBarrel. The application is currently in early development and focuses on providing efficient barcode scanning functionality and a ugly but consistent UI.

## Features

- **Barcode Scanning:** Quickly and accurately scan barcodes, including various 2D barcode and QR types, to obtain detailed product information for stock items.

- **Stock Management:** The application is designed specifically for tracking and managing stock items using a local database.

## Additional Features (working on it)

- **Filtering and Search:** Enhancement upon the stock management with filtering and search capabilities to quickly find specific items.

- **Notifications:** Notifications for important updates and alerts related to inventory items.

- **App Customization:** The app can be tailored with customizable settings and configurations. This can include look'n'feel.

- **User-Friendly Interface:** The application is designed will offer a clean and intuitive interface to facilitate a straightforward experience.

- **Platform Support:** BarryBarrel will be available for Linux, Android, and macOS.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/aziabatz/barry-barrel-flutter.git

   # for ssh
   git clone git@github.com:aziabatz/barry-barrel-flutter.git
   ```

2. **Navigate to the Project:**
   ```bash
   cd barrybarrel
   ```

3. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

   See extra [dependencies (click here)](#more-dependencies) for desktop platforms.

4. **Build the app (optional for Android):**

    | :exclamation:  You need a functional Android SDK and set up environment for this step  |
    |----------------------------------------------------------------------------------------|

    ```bash
    flutter build apk 
    
    ```

5. **Run the App:**
   ```bash
   flutter run
   ```

## More dependencies

For now you only need SQLite3 library installed if you are using the app on desktop platforms (ie. GNU/Linux).

## Contributing

Contributions are appreciated. If you have ideas for improvements, feature requests, or bug reports, please open an issue or submit a pull request.

**DO NOT** OPEN PRs FOR THE **MAIN** BRANCH. Use the `devel` branch or an issue branch if it is for specific code.

I strongly recommend using Visual Studio Code for developing with Flutter.

## License

This project is licensed under the BSD-3 Clause License. Refer to the [LICENSE](LICENSE) file for details.

## Acknowledgments

BarryBarrel is the result of collaborative efforts within the Flutter community and contributions from open-source developers.
<details>
<summary>Expand to see community libraries used in this project</summary>
<br>
> cupertino_icons
> camera
> sqflite
> path
> floor
> floor_generator
> build_runner
> sqlite3_flutter_libs
> sqlite3
</details>

<br>

Thank you for considering and getting by this point in the README. Stay tuned for updates as I continue to develop and refine the functionality of the application.
