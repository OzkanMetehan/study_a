## Setting the Project (Step‑by‑Step for Absolute Beginners)

This guide walks you through installing tools, creating the app, and running it. Follow each step in order. When you see a black box, copy the command inside it and paste into PowerShell, then press Enter.

Tip: Open Windows PowerShell via Start menu and keep it open while following this guide.

---

### 1) Install Git (code tool)
Download and install Git: `https://git-scm.com/download/win`.
- During setup, choose: “Git from the command line and also from 3rd‑party software”.

Optional (command alternative):
```powershell
winget install --id Git.Git -e
```

### 2) Install Android Studio (for Android tools)
Download: `https://developer.android.com/studio` and install.
After install, open Android Studio → More Actions → SDK Manager:
- SDK Platforms: install the latest stable Android version.
- SDK Tools: check “Android SDK Command‑line Tools” and “Android SDK Build‑Tools”.

### 3) Install VS Code (editor, optional but friendly)
Download: `https://code.visualstudio.com/` and install.
Then in VS Code, add extensions: “Dart” and “Flutter”.

Optional (command alternative):
```powershell
winget install --id Microsoft.VisualStudioCode -e
```

### 4) Install Flutter SDK (the app framework)
Download Flutter for Windows (stable): `https://docs.flutter.dev/get-started/install/windows`.
- Unzip it to: `C:\src\flutter` (create folders if needed). Avoid spaces in the path.
- Add `C:\src\flutter\bin` to your PATH:
  1. Windows Search → “Environment Variables” → “Environment Variables…”.
  2. Under “User variables”, select “Path” → Edit → New → paste `C:\src\flutter\bin` → OK.
Close and reopen PowerShell, then check:
```powershell
flutter --version
```

### 5) Set up Android tools (licenses + check)
Accept Android licenses (press `y` when asked):
```powershell
flutter doctor --android-licenses
```
Run a full check:
```powershell
flutter doctor
```

### 6) Choose a place for your project (your folder)
We’ll use your existing folder. In PowerShell run:
```powershell
cd "D:\Masaüstü\Business\Other Projects\Study App"
```

### 7) Create the Flutter app (one-time)
This creates a new folder called `study_a` with all files inside.
```powershell
flutter create study_a
```

### 8) Go into the app folder
You must be inside the app for most commands to work.
```powershell
cd .\study_a
```
Check you see a file named `pubspec.yaml` when you list files:
```powershell
ls
```

### 9) Enable Windows desktop (so you can run as a Windows app)
```powershell
flutter config --enable-windows-desktop
```

### 10) Run diagnostics and fix red items
```powershell
flutter doctor
```
If anything is red, read the message and follow the instructions. Common ones:
- Android licenses not accepted → run Step 5 again.
- No Android device → use Step 12 (run on Windows/Chrome instead).

### 11) Run the app (easiest targets)
Run on Windows desktop:
```powershell
flutter run -d windows
```
Or run on Chrome (web):
```powershell
flutter run -d chrome
```

### 12) (Optional) Create and use an Android emulator
Open Android Studio → Device Manager → Create Device → Pick Pixel → Select latest image → Finish. Then:
```powershell
flutter devices
flutter run
```

---

## Continue: Project structure and dependencies (do these inside your app folder)

Where to do these: use ANY of these options; they all touch the same files on disk.
- PowerShell: quick for creating folders and adding packages
- VS Code: easiest to see the folder structure in the left sidebar
- Android Studio: works too, but VS Code is simpler for Flutter

Always make sure your terminal path shows something like:
```
PS C:\Users\ozkan\study_a>
```

### 5) Create the core folder structure
Run in PowerShell from inside `study_a`:
```powershell
mkdir lib\app,lib\models,lib\services,lib\repositories,lib\screens,lib\widgets,lib\utils,lib\theme,lib\routes
mkdir lib\screens\session_setup,lib\screens\timer,lib\screens\end_session,lib\screens\calendar,lib\screens\analytics
```

Optional placeholders so empty folders show up in Git/VS Code:
```powershell
ni lib\models\.gitkeep -ItemType File
ni lib\services\.gitkeep -ItemType File
ni lib\repositories\.gitkeep -ItemType File
ni lib\widgets\.gitkeep -ItemType File
ni lib\utils\.gitkeep -ItemType File
ni lib\theme\.gitkeep -ItemType File
ni lib\routes\.gitkeep -ItemType File
```

You can see this structure in VS Code: File → Open Folder… → choose `study_a`.

### 6) Add dependencies for Phase 1 (database, state, lints)
Pick one local DB. Recommendation for MVP: Isar.

Run in PowerShell from inside `study_a`:
```powershell
flutter pub add isar isar_flutter_libs
flutter pub add --dev build_runner isar_generator
flutter pub add flutter_riverpod
flutter pub add --dev very_good_analysis
```

Create (or edit) `analysis_options.yaml` at the project root with:
```yaml
include: package:very_good_analysis/analysis_options.yaml
```

If the file already exists, just replace its contents with the single include line above.

### 7) Basic app scaffolding (make sure the app runs)
Ensure `lib/main.dart` exists (Flutter created it). We’ll route through an `App` widget soon, but for now just run:
```powershell
flutter run -d windows   # or: flutter run -d chrome
```
If it shows the counter app, your setup is correct.

### 8) Initialize Git (you already did this)
From inside `study_a`:
```powershell
git add .
git commit -m "chore: project structure and deps"
git push
```

### 9) Create a feature branch when adding features (recommended)
```powershell
git checkout -b feat/session-setup-ui
```

### 10) Launch Android emulator (optional)
```powershell
flutter emulators
flutter emulators --launch Pixel_9a   # use your emulator name EXACTLY
flutter devices
flutter run -d Pixel_9a
```

### 11) Troubleshooting quick tips
- If command says “No pubspec.yaml,” you are not inside the project → `cd study_a`.
- If `flutter` is not recognized, fix PATH to `C:\src\flutter\bin` and reopen PowerShell.
- In PowerShell do not use `<` `>` around names; they are special characters.

### 12) Next steps (what we’ll build next)
- Define models in `lib/models`
- Add local DB repository in `lib/repositories`
- Build `screens/session_setup` and wire a simple navigator
- Add save‑session flow and a simple list to verify stored sessions

### Git & GitHub (version control and backup)

From inside the `study_a` folder:
```powershell
git init
git config user.name "Your Name"
git config user.email "your.email@example.com"
git add .
git commit -m "chore: bootstrap Flutter app"
```

Create a repo on GitHub at `https://github.com/new` named `study_a` (don’t add a README). Then connect and push:
```powershell
git remote add origin https://github.com/<your-username>/study_a.git
git branch -M main
git push -u origin main
```

You’re done! Each work session:
1) Make changes →
2) `git add .` → `git commit -m "message"` → `git push`.


