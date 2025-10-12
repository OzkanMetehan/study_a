## Setup and Launch Guide (Windows + Android APK)

This guide walks you from installing Flutter to building and sharing an APK your sister can install.

### 1) Install prerequisites (Windows)
1. Install Flutter SDK (Windows): follow [Flutter for Windows setup](https://docs.flutter.dev/get-started/install/windows)
   - Download the stable ZIP → extract to a folder like `C:\src\flutter`.
2. Install Android Studio: download from the [Android Studio site](https://developer.android.com/studio)
   - During setup, install: Android SDK, Android SDK Platform, Android Virtual Device (AVD).
3. Device drivers (if using a physical Android device): install OEM drivers and enable USB debugging in Developer options.

### 2) Add Flutter to PATH
- Permanent (recommended): Windows Search → “Environment Variables” → Edit system environment variables → Environment Variables…
  - Add new system variable: `FLUTTER_HOME = C:\src\flutter`
  - Edit `Path` and add: `%FLUTTER_HOME%\bin`
- Temporary (current PowerShell session only):
```powershell
$env:Path += ";C:\src\flutter\bin"
```

### 3) Verify setup
```powershell
flutter doctor
flutter doctor --android-licenses
```
Ensure all items are green or give clear instructions to fix. If licenses prompt appears, accept them.

### 4) Get the project
We’ll create or share the repository URL when the code is ready. Then:
```powershell
git clone <REPO_URL>
cd <PROJECT_FOLDER>
flutter pub get
```

### 5) Run the app (debug)
- Start an Android emulator from Android Studio (AVD) or connect a physical device with USB debugging.
```powershell
flutter devices
flutter run
```

### 6) App identity and version (before release)
- File: `pubspec.yaml` → set `name`, `description`, and `version` (e.g., `1.0.0+1`).
- Android package name (applicationId): `android/app/build.gradle` → `defaultConfig { applicationId "com.yourdomain.studyapp" }`
- App name (launcher label): `android/app/src/main/AndroidManifest.xml` → `android:label="Study App"`
- App icon: use [Flutter launcher icons](https://pub.dev/packages/flutter_launcher_icons) later for a professional icon.

### 7) Create a signing key (release)
Generate once and keep the file and passwords safe.
```powershell
"C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe" -genkey -v -keystore C:\keys\studyapp-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias studyapp
```
You’ll be asked for passwords and organization info.

### 8) Configure signing in Android
Create `android/key.properties` with your paths/passwords:
```properties
storeFile=C:\\keys\\studyapp-release-key.jks
storePassword=YOUR_STORE_PASSWORD
keyAlias=studyapp
keyPassword=YOUR_KEY_PASSWORD
```
The Flutter template’s `android/app/build.gradle` already reads `key.properties` and applies release signing.

### 9) Build a release APK
```powershell
flutter clean
flutter pub get
flutter build apk --release
```
Output:
- `build/app/outputs/flutter-apk/app-release.apk`

Optional (Play Store later):
```powershell
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### 10) Test the APK locally
- Copy `app-release.apk` to the phone and install (enable “Install unknown apps”).
- Or via USB with adb:
```powershell
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

### 11) Share the APK
- Upload `app-release.apk` to a file host (e.g., Google Drive/Dropbox/OneDrive) and share a view link.
- Your sister taps the link on Android → downloads → opens to install.

### 12) Updating the app
1. Make changes → `flutter pub get` if dependencies changed.
2. Bump version in `pubspec.yaml` (e.g., `1.0.1+2`). The number after `+` is `versionCode` for Android.
3. Rebuild: `flutter build apk --release`
4. Share the new APK link.

### 13) Troubleshooting
- Licenses: `flutter doctor --android-licenses`
- SDK not found: Open Android Studio → SDK Manager → install latest SDK + Platform Tools; ensure `ANDROID_HOME` or `ANDROID_SDK_ROOT` is set by Android Studio.
- Build cache issues: `flutter clean` then build again.
- Emulator issues: Cold boot AVD or create a new AVD with a stable system image.

### 14) What I will do next
- Initialize the Flutter project, set up tabs and navigation, add app identity, and prepare a signed release configuration so you can produce an APK with one command.


