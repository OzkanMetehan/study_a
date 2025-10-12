# 🚀 STUDY-A: FLUTTER DEVELOPMENT ACTION PLAN

**Status:** Ready to Build (UI 90% Complete, Data Structure Defined)
**Goal:** Achieve MVP (Log Session, View on Calendar, Export Report)
**Storage Plan:** Local Storage First (MVP) -> Google Drive Sync (Phase 3)
**Time Commitment:** Full-Time / Aggressive Timeline

---

## PHASE 1: FOUNDATION & MINIMUM VIABLE PRODUCT (MVP)

**GOAL:** Complete the core data loop: Log Session → Store Data → View Data List.

| Task # | Focus Area | Detailed Action | Target State |
| :---: | :--- | :--- | :--- |
| **1.1** | **Setup** | Initialize Flutter project and set up core structure (e.g., `lib/models`, `lib/services`, `lib/screens`). | Project scaffolding ready. |
| **1.2** | **Data Model** | Define the `Session_Log` data model and any necessary supporting models (e.g., `Subject`, `Topic`). | Data structure complete in Dart code. |
| **1.3** | **Local DB** | Implement the chosen local database solution (e.g., **Hive** or **Isar**). Set up the main data repository/service for CRUD operations (Create, Read, Update, Delete). | Core database functionality confirmed. |
| **1.4** | **Static Data** | Implement hardcoded or locally stored lists for **Subjects** and **Topics**. Build the basic **Library Tab** UI to display these lists. | Subjects/Topics are selectable in the app. |
| **1.5** | **Session Setup UI** | Build the **Session Setup** and **Timer/Break Screen** UI. Implement navigation to the end session screen. | User can start/pause a session. |
| **1.6** | **Data Entry & Logging** | Build the **End Session Data Entry** UI (Questions, Correct, Wrong, Mood, Location). Implement the function to **save a complete session** to the local database. | Data successfully saves to the database. |
| **1.7** | **Basic View** | Implement a simple debug screen or a basic list view to **read and display all logged sessions** (the chronological log). | **MVP: Data logging loop is verified.** |

---

## PHASE 2: CORE LOGIC & FEEDBACK LOOP

**GOAL:** Complete the primary user actions: See Data on Calendar and Generate Initial Report.

| Task # | Focus Area | Detailed Action | Target State |
| :---: | :--- | :--- | :--- |
| **2.1** | **Core Calculations** | Implement functions for: **Net Score** (`Q_Correct - (Q_Wrong / 4)`), **Accuracy (W/ & WO Empties)**, and **QPM**. | All session-level metrics are calculated immediately upon session end. |
| **2.2** | **Insights Card** | Implement the calculation logic for the **Insights Card** (e.g., **Streaks**, **Study-to-Break Ratio**, **Time Since Last Study** for a Subject). | Insights card displays real, live, calculated data. |
| **2.3** | **Calendar Tab** | Build the final **Calendar UI**. Implement logic to read session data and display session markers/dots on the correct days. Show a summary on day-select. | Calendar accurately reflects logged sessions. |
| **2.4** | **Analytics Dashboard** | Build the UI structure for the **Analytics Tab**. Display the **Overall Performance Summary** (Totals, Overall Averages) and the live **Insights Card**. | Main Analytics dashboard is functional. |
| **2.5** | **Export Function (MVP)** | Integrate a package (e.g., `csv` or `excel`) to **read all data and export it as a CSV file**. This fulfills the final MVP requirement. | **MVP Achieved:** User can log, view, and export data. |

---

## PHASE 3: DETAILED ANALYSIS & ESSENTIAL INTEGRATION

**GOAL:** Implement complex PivotTable logic and the required Google Drive sync.

| Task # | Focus Area | Detailed Action | Target State |
| :---: | :--- | :--- | :--- |
| **3.1** | **Aggregation Logic** | Write functions to aggregate and group data (your **PivotTable logic**) for: **Subject Breakdown**, **Topic Breakdown**, and **Daily Analysis**. | Functions return grouped data ready for tabular display. |
| **3.2** | **Detailed Report UI** | Build the final UI for the **Detailed Report** within the Analytics tab, populating all PivotTable-based views. | Detailed report mirrors the Excel blueprint. |
| **3.3** | **User Setup (Onboarding/Profile)** | Implement the **Onboarding Screens** and build the **Profile Tab** to collect name, grade, and display initial total stats. | User profile is editable and functional. |
| **3.4** | **Google Drive Setup** | Implement **Google Sign-In** and set up the connection/permissions for the Google Drive API. | App can connect to the user's Drive. |
| **3.5** | **Cloud Sync** | Write the service to **backup the entire local database file** (or a clean JSON/CSV export) to Google Drive and **restore** it upon app launch or user command. | Data is automatically backed up/synced. |

---

## PHASE 4: FINAL POLISH & LAUNCH

**GOAL:** Feature completeness, bug fixes, and preparation for release.

| Task # | Focus Area | Detailed Action | Target State |
| :---: | :--- | :--- | :--- |
| **4.1** | **Gamification** | Implement the logic and UI for the **Badges/Awards** system based on milestones (e.g., streaks, question count). | Badges are earned and displayed correctly. |
| **4.2** | **Export Polish** | Add functionality to export as a formatted **XLSX** or **PDF** (more complex but better presentation). | All export options are available. |
| **4.3** | **Final Polish** | Final pass on UI/UX: animations, transitions, responsiveness, and handling of edge cases (e.g., zero data). | App feels polished and professional. |
| **4.4** | **Testing & Debugging** | Rigorous testing of all calculations (especially aggregation and complex formulas) and the cloud sync/restore process. | Critical bugs are eliminated. |
| **4.5** | **Launch** | Create final app icon, screenshots, and app store descriptions. **DEPLOY TO STORES!** | Project is publicly available. |


