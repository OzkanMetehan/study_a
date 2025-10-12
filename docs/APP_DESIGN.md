## Study App — Product Design Document (MVP)

### 1) Purpose and Vision
- **Who it’s for**: Students preparing for TYT/YKS (ÖSYM) who need a simple, reliable way to plan, track, and improve study performance.
- **Problem**: It’s hard to keep consistent study habits, remember what to do next, and see whether time invested is turning into results.
- **Solution**: An offline-first mobile app that helps track books, sessions, and progress; visualizes performance; and nudges the student to focus on weak areas.
- **Guiding principles**: Simple > complex, fast data entry, distraction-free sessions, meaningful insights (not just numbers), privacy by default.

### 2) Scope (MVP)
- **Onboarding & Profile**: First-launch setup collects name, class, and goal (target college and major). Profile screen shows overall stats (total hours, total questions) and offers Export to PDF.
- **Lessons**: A tab listing high-level lessons (e.g., Math, Geography, History) as expandable sections that reveal subjects (e.g., Triangles, Logarithm). Quick access to start a session from a subject.
- **My Books**: Add question banks (publisher/book), define subjects within each, and track progress (solved, correct, wrong, empty, net).
- **Study Sessions**: Start/pause/resume/end a focused timer; on end, log results (solved/correct/wrong/empty) tied to book and subject.
- **Calendar**: View past sessions by day; tap a date to see details (book, subject, counts, net).
- **Analytics**: Summaries by subject/book; accuracy and net trends; time per question; weak/strong subjects.
- **Reminders**: Local notifications that nudge least-solved or low-accuracy subjects.
- **Export**: One-tap export of key statistics to a nicely formatted PDF (date range selectable in a simple dialog).
- **Settings**: Basic preferences (theme, notifications) and backup/restore.

### 3) Key Concepts and Terms
- **Profile**: Student info captured on first launch: name, class, and goal (college + major). Profile aggregates overall stats and enables PDF export.
- **Lesson**: A high-level category (e.g., Math, Turkish, Physics). Each lesson contains subjects.
- **Subject**: A specific topic (e.g., Triangles, Logarithm, Paragraph). Subjects appear under lessons and can optionally be linked to book tracking.
- **Book**: A question bank from a publisher (e.g., Matematik Soru Bankası by X Publisher).
- **Session**: A focused study period with a timer (start → pause/resume → end) that produces a result entry.
- **Result Entry**: The outcome of a session for a specific book + subject: solved, correct, wrong, empty; the app computes net.
- **Net (TYT/YKS)**: net = correct − wrong/4.

### 4) User Goals (Jobs-to-be-done)
- “I want to see what I should study next (my weak areas or least-solved subjects).”
- “I want a clean focus timer that survives app minimization and interruptions.”
- “I want to quickly log results without typing too much.”
- “I want to open a calendar and remember what I studied on any day.”
- “I want to know whether I’m improving and how long questions take me.”

### 5) Navigation and Information Architecture
- **Tab bar** (always visible):
  - Lessons
  - My Books
  - Study (Start Session)
  - Calendar
  - Analytics

- Note: **Profile, Reminders, Settings, Backup, Export PDF** are accessible from the top-right profile menu on any tab (keeps the bottom bar to five items).

- **Lessons**
  - List of lessons as expandable sections (accordion/dropdowns).
  - Expanding a lesson reveals its subjects; each subject shows quick stats and a button to start a session.
  - Add/edit lessons and subjects from this tab.

- **My Books**
  - List of books (thumbnail, publisher, quick progress).
  - Book detail: subjects, overall progress, add/edit subjects.
  - Add book flow: publisher → book name → subjects → (optional) total questions.

- **Study**
  - Start session: pick book + subject → start timer.
  - In-session: large timer, pause/resume, end session. Minimal distractions.
  - End-of-session form: solved, correct, wrong, empty; app validates totals.

- **Calendar**
  - Monthly view with indicators for days containing sessions.
  - Day detail: session cards showing book, subject, duration, solved, correct/wrong/empty, net.

- **Analytics**
  - Summary cards: total solved, average net, time per question, streaks.
  - Breakdown by subject and book: accuracy, net %, trend hints.
  - “Weakest subjects” & “Least-solved subjects” sections.

- **Profile & Menu**
  - Profile header: name, class, goal (college + major).
  - Overall stats: total study hours, total questions solved, average time per question.
  - Export: button to export a PDF report (choose date range: last 7/30 days or custom).
  - Reminders, Settings, Backup/Restore.

- **More**
  - Reminders: enable/disable, schedule preference, subject targeting.
  - Settings: theme (light/dark), data export/import, about.

### 6) Core Flows (High-Level)
- **Add a book**: My Books → Add → enter publisher/book → define subjects → save.
- **Start and finish a session**: Study → pick book & subject → start timer → pause/resume as needed → end → enter results → save.
- **Review past work**: Calendar → pick date → see sessions and details; jump to book/subject if needed.
- **See insights**: Analytics → view summaries, weak/least-solved subjects, and time per question.
- **Get nudged**: Reminders → app notifies to study least-solved/weak subjects at chosen times.
- **First-time setup**: On first launch, fill Profile (name, class, goal). Option to preload common lessons and subjects.
- **Export progress**: Profile/Analytics → Export PDF → pick range → share/save PDF.

### 7) Lifecycle
- **A) User Journey Lifecycle**
  1. Setup: Add initial books and subjects.
  2. Plan: See weak/least-solved subjects; decide what to study next.
  3. Focus: Start a session and concentrate; minimize distractions.
  4. Log: End session and record solved/correct/wrong/empty quickly.
  5. Review: Check calendar and analytics to understand progress.
  6. Improve: Use insights and reminders to adjust study plan.

- **B) Study Session Lifecycle**
  1. Start: Choose book + subject and begin the timer.
  2. Focus Mode: Timer runs; user may minimize the app. The app reconciles time using timestamps when returning.
  3. Pause/Break: User pauses; timer stops counting.
  4. Resume: Continue until done.
  5. End Session: User taps end; enters solved, correct, wrong, empty. App validates solved = correct + wrong + empty.
  6. Save & Reflect: Session is saved; user sees quick feedback (net, duration, time/question).

- **C) App Lifecycle & Interruptions**
  - Foreground: Normal interaction with UI and timer.
  - Background/Minimized: Session continues conceptually; app uses timestamps to ensure accurate elapsed time when user returns.
  - Interruption (phone call/notification): Timer remains accurate; on return, elapsed time is reconciled.
  - Offline: All features work offline; data stays on device. Backup/restore is manual.

- **D) Notification Lifecycle**
  - User configures reminders (e.g., daily at 19:00; target least-solved/weak subjects).
  - App schedules local notifications.
  - Tapping a reminder opens Study tab pre-filtered to a suggested subject (if possible).

### 8) Data (Non-Technical View)
- **Profile**: Name, class, goal (college + major).
- **Lessons & Subjects**: Lessons are broad areas (Math, etc.); each contains subjects (Triangles, etc.).
- **Publishers & Books**: Who made the question bank and the book’s name.
- **Sessions**: A time-bounded study period.
- **Results**: For each session, how many solved, correct, wrong, empty; the app computes net and time per question.
- **Insights**: Aggregations and trends by subject/book/lesson and over time.

### 9) Validation and Safeguards
- End-of-session validation: solved must equal correct + wrong + empty.
- Gentle prompts if numbers look unusual (e.g., zero solved after long duration).
- Undo/Adjust: Allow editing a session shortly after saving.

### 10) Privacy, Accessibility, and Tone
- **Privacy**: Data is stored locally on the device; no sign-in required. Backup/restore is optional and user-initiated.
- **Accessibility**: Large tap targets, clear typography, color-blind friendly palettes, haptic hints, and minimal required input.
- **Tone/UX**: Calm, encouraging, and focused. Avoid guilt; celebrate consistency and progress.

### 11) Success Criteria (MVP)
- The user can complete onboarding with profile info.
- The user can add at least one book and subjects easily, and manage lessons/subjects.
- The user can run multiple sessions per day and log results in seconds.
- Calendar accurately reflects past sessions with details.
- Analytics surfaces weak/least-solved subjects and time per question.
- Profile shows overall stats (total hours, total questions) and can export a PDF report.
- Reminders nudge the user without feeling spammy.

### 12) Future (Post-MVP Ideas)
- Score calculators and scenario simulators.
- Cross-device sync (optional/opt-in).
- Smart recommendations (spaced repetition for subjects).
- Deep export (CSV, PDF summaries) and shareable weekly reports.

### 13) Onboarding Page - Detailed Specifications

#### 13.1) Page Layout & Visual Elements
- **Profile Picture Area**: Large circular container (center-top) displaying selected avatar
  - Default: Placeholder with generic avatar icon
  - Size: 120px diameter for main circle
  - Border: Thin gray outline (2px, #E0E0E0)
  - Background: White (#FFFFFF)

- **Avatar Selection Indicator**: Small circular button (30px diameter) positioned outside main circle
  - Location: Right side, slightly below horizontal center
  - Visual: Plus icon (+) or edit icon (pencil)
  - Purpose: Triggers avatar selection modal

- **Language Toggle**: Horizontal switch in top-right corner
  - Position: Top-right, below status bar
  - States: EN (English) | TR (Turkish)
  - Active state: Light green background (#4CAF50) with white text
  - Inactive state: Gray background (#E0E0E0) with dark gray text
  - Toggle animation: Smooth slide transition

#### 13.2) Form Fields & Validation

**Name Field:**
- Type: Single-line text input
- Max length: 50 characters
- Validation rules:
  - No numbers (0-9)
  - No special characters/punctuation (except spaces and hyphens)
  - Only letters (A-Z, a-z), spaces, and hyphens allowed
  - Minimum length: 2 characters
  - Trim leading/trailing spaces
- Placeholder: "Enter your name"
- Error message: "Name can only contain letters, spaces, and hyphens"

**Grade Field:**
- Type: Dropdown/select menu
- Options:
  - 9th Grade
  - 10th Grade
  - 11th Grade
  - 12th Grade
  - Gap Year / Retake
- Default: No selection (shows placeholder)
- Required field: Yes
- Placeholder: "Select your grade"

**Exam Field:**
- Type: Dropdown/select menu
- Options:
  - TYT Only
  - TYT + AYT Sayısal (Numerical)
  - TYT + AYT Sözel (Verbal)
  - TYT + AYT Foreign Language (English)
  - TYT + AYT Eşit Ağırlık (Mixed)
- Default: No selection (shows placeholder)
- Required field: Yes
- Placeholder: "Select exam type"

**Goal Field:**
- Type: Multi-line text input
- Max length: 200 characters
- Required: No (optional field)
- Placeholder: "Enter your target university and major (optional)"
- Character count: Display remaining characters below field
- Auto-resize: Expand height as user types

#### 13.3) Navigation & Confirmation

**Next Button:**
- Style: Large rounded rectangle button
- Position: Bottom center of screen
- Size: Full width minus margins (16px on each side)
- Height: 56px
- Background: Light gray (#F5F5F5) when disabled, blue (#2196F3) when enabled
- Text: "NEXT" in white, bold, 18px
- States:
  - Disabled: When required fields are empty
  - Enabled: When all required fields are filled
  - Loading: Show spinner when processing

**Confirmation Flow:**
1. User taps "NEXT"
2. Show confirmation dialog:
   - Title: "Confirm Profile Details"
   - Content: Display summary of entered information
   - Buttons: "Edit" (left) and "Continue" (right)
3. If "Continue" selected, proceed to next onboarding screen
4. If "Edit" selected, return to form

#### 13.4) Avatar System - Development Specifications

**Avatar Selection Modal:**
- Trigger: Tap on small circle indicator
- Modal content:
  - Grid layout: 3x4 or 4x3 grid of avatar options
  - Scrollable if more than 12 avatars
  - Each avatar: 80x80px preview with selection indicator
  - Categories: Animals, Fantasy Characters, Abstract

**Avatar Assets:**
- Format: SVG or high-resolution PNG (120x120px minimum)
- Style: Hand-drawn, cute, friendly aesthetic
- Color scheme: Consistent with app's design language
- File naming: `avatar_[category]_[number].svg`

**Avatar Storage & Management:**
- Local storage: Store selected avatar ID in device preferences
- Default avatar: Generic placeholder until user selects
- Avatar switching: Allow users to change avatar later in profile settings

#### 13.5) Technical Implementation Notes

**Form Validation:**
- Real-time validation as user types
- Debounce input validation (300ms delay)
- Field-level error states with visual indicators
- Form-level validation before enabling Next button

**Data Persistence:**
- Store form data locally during onboarding
- Save to permanent storage only after completion
- Allow form recovery if app is closed mid-onboarding

**Accessibility:**
- Screen reader support for all form elements
- Keyboard navigation support
- High contrast mode compatibility
- Voice input support for text fields

**Performance:**
- Lazy load avatar assets
- Optimize form validation for smooth typing experience
- Minimal re-renders during form updates

#### 13.6) Error Handling & Edge Cases

**Network Issues:**
- Avatar loading fallbacks
- Graceful degradation if assets fail to load

**Data Validation:**
- Sanitize all input before storage
- Handle special characters gracefully
- Provide clear error messages in user's selected language

**Form Recovery:**
- Auto-save form progress every 30 seconds
- Restore form state if app is interrupted
- Clear temporary data after successful completion

#### 13.7) Onboarding Continue Screen - Detailed Specifications

**Screen Purpose:** Second step of onboarding where users configure subjects, set study targets, and choose app preferences.

#### 13.7.1) Visual Layout Changes from Previous Screen

**Profile Picture Area:**
- **Size**: Increased to 140px diameter (from 120px)
- **Position**: Moved higher on screen, closer to top
- **Edit Button**: Removed (no avatar selection on this screen)
- **Display**: Shows selected avatar from previous screen

**Welcome Message:**
- **Dynamic Content**: "Welcome to StudyApp!" + "[USER_NAME]"
- **Name Display**: Shows actual selected name from previous screen
- **Subtitle**: "Let's add details." (smaller, lighter gray text)

#### 13.7.2) Subject Selection System

**Default Subject Inheritance:**
Based on exam selection from previous screen:

**TYT Only:**
- Turkish, History, Geography, Philosophy, Religion, Maths, Physics, Chemistry, Biology

**TYT + AYT Sayısal (Numerical):**
- All TYT subjects + Advanced Maths, Advanced Physics, Advanced Chemistry, Advanced Biology

**TYT + AYT Sözel (Verbal):**
- All TYT subjects + Advanced Turkish, Advanced History, Advanced Geography, Advanced Philosophy

**TYT + AYT Foreign Language (English):**
- All TYT subjects + Advanced English, Advanced Turkish, Advanced History, Advanced Geography

**TYT + AYT Eşit Ağırlık (Mixed):**
- All TYT subjects + Advanced Maths, Advanced Turkish, Advanced History, Advanced Geography

**Subject Display:**
- **Format**: Pill-shaped labels with rounded corners
- **Colors**: Light green background (#E8F5E8) with dark green text (#2E7D32)
- **Size**: Height 32px, auto-width based on content
- **Spacing**: 8px between pills
- **Layout**: Wrap to multiple lines if needed

**Subject Management:**
- **Remove Button**: Small "×" icon on right side of each pill
- **Add Button**: Gray pill with "+" icon, positioned after existing subjects
- **Custom Subjects**: Allow adding subjects not in default list
- **Validation**: Minimum 1 subject required, maximum 20 subjects

#### 13.7.3) Target Setting

**Target Input Field:**
- **Type**: Number input field
- **Max Length**: 5 digits (0-99999)
- **Validation**: Positive integers only, no decimals
- **Placeholder**: "Enter target number"
- **Size**: Width 120px, height 40px
- **Border**: Gray outline (#E0E0E0)

**Time Period Dropdown:**
- **Position**: After target input, following "question per" text
- **Options**: 
  - Day
  - Week (default)
  - Month
- **Style**: Rounded rectangular button with dropdown arrow
- **Size**: Height 40px, auto-width
- **Background**: White with gray border

**Target Validation:**
- **Required**: Yes
- **Range**: 1-99999 questions
- **Error Message**: "Please enter a valid target number (1-99999)"

#### 13.7.4) Preference Toggles

**Toggle 1: Reminder Notifications**
- **Label**: "Remind me if I'm under quota"
- **Purpose**: Send notifications when user solves fewer questions than daily/weekly/monthly target
- **Default State**: OFF (red toggle)
- **Behavior**: 
  - ON: App checks daily/weekly/monthly progress and sends reminder if below target
  - OFF: No reminder notifications

**Toggle 2: Motivational Quotes**
- **Label**: "Show motivational quotes during sessions"
- **Purpose**: Display encouraging quotes during study sessions
- **Default State**: ON (green toggle)
- **Behavior**:
  - ON: Show motivational quotes at session start and during breaks
  - OFF: No quotes displayed

**Toggle Styling:**
- **ON State**: Green background (#4CAF50) with white circle on right
- **OFF State**: Red background (#F44336) with white circle on left
- **Size**: 51px width, 31px height
- **Animation**: Smooth slide transition (300ms)

#### 13.7.5) Navigation & Confirmation

**Back Button:**
- **Position**: Bottom-left corner
- **Style**: Gray triangular arrow pointing left
- **Size**: 24x24px
- **Action**: Return to previous onboarding screen
- **Behavior**: Preserve all entered data when going back

**Finish Button:**
- **Position**: Bottom center
- **Style**: Large rounded rectangle with gray outline
- **Size**: Full width minus margins (16px on each side), height 56px
- **Text**: "FINISH" in gray (#666666)
- **States**:
  - **Disabled**: When required fields are empty
  - **Enabled**: When all required fields are filled
  - **Loading**: Show spinner when processing

**Confirmation Flow:**
1. User taps "FINISH"
2. Show confirmation dialog:
   - Title: "Complete Profile Setup"
   - Content: Summary of all selected options
   - Buttons: "Review" (left) and "Complete" (right)
3. If "Complete" selected:
   - Save all profile data permanently
   - Create user account
   - Navigate to main app
4. If "Review" selected, return to form

#### 13.7.6) Data Flow & Validation

**Required Fields:**
- At least one subject selected
- Target number entered
- Time period selected

**Data Persistence:**
- Auto-save progress every 30 seconds
- Store in temporary local storage until completion
- Clear temporary data after successful profile creation

**Subject Management Logic:**
- **Default Loading**: Populate subjects based on exam selection
- **Custom Addition**: Allow adding new subjects with validation
- **Removal**: Remove subjects with confirmation if only one remains
- **Persistence**: Remember custom subjects for future use

#### 13.7.7) Technical Implementation Notes

**Subject Inheritance:**
- Create mapping object for exam → subjects
- Load subjects on screen initialization
- Handle edge cases for custom exam combinations

**Target Validation:**
- Real-time number validation
- Prevent non-numeric input
- Handle edge cases (0, negative numbers, decimals)

**Toggle Management:**
- Store preference states in local storage
- Implement notification scheduling logic
- Handle permission requests for notifications

**Performance Considerations:**
- Lazy load subject data
- Optimize toggle state updates
- Efficient subject pill rendering with virtualization if needed

### 14) Home Page - Detailed Specifications

**Screen Purpose:** Main landing page after onboarding completion, displaying previous session summary, session starter, and calendar overview.

#### 14.1) Previous Session Panel

**Panel Location:** Top of screen, below status bar
**Panel Style:** Rounded rectangular card with subtle shadow
**Background:** White (#FFFFFF) with light gray border (#E0E0E0)

**Empty State:**
- **Message:** "No previous session yet"
- **Style:** Centered text in light gray (#999999)
- **Icon:** Optional clock or calendar icon above text
- **Height:** 80px minimum

**Session Data Display:**
When previous session exists, show in two-column layout:

**Left Column (Session Details):**
- **Date:** "Today", "Yesterday", or actual date
- **Duration:** "2h 15m" format
- **Pauses:** "2 pauses" or "No pauses"
- **Question Count:** "Solved: 45 questions"
- **Subjects:** "Math, Physics" (comma-separated)
- **Topics:** "Calculus, Mechanics" (comma-separated)

**Right Column (Statistics):**
- **Pie Chart:**
  - Size: 80px diameter
  - Colors: Green (correct), Red (wrong), Gray (empty)
  - Legend: Small labels below chart
- **Numerical Stats:**
  - Correct: [number] (green text)
  - Wrong: [number] (red text)
  - Empty: [number] (gray text)
  - Net: [calculated value] (bold)

#### 14.2) Session Starter Panel

**Panel Location:** Center of screen, below previous session panel
**Panel Style:** Large rounded card with prominent "Start Session" button
**Background:** White (#FFFFFF) with blue accent border (#2196F3)

**Panel Components (Top to Bottom):**

**1. Calendar Gallery (Top Section):**
- **Type:** Horizontal scrollable gallery
- **Layout:** 7 days visible, center day prominent
- **Center Day:**
  - Size: 60px x 60px
  - Background: Blue (#2196F3)
  - Text: White, bold, larger font
  - Border: 3px white outline
- **Side Days:**
  - Size: 45px x 45px
  - Background: Light gray (#F5F5F5)
  - Text: Dark gray (#666666)
  - Opacity: 0.7

**Calendar Day Information:**
- **Past Days:**
  - "You had 3 sessions - click to see details"
  - "Leisure day"
  - "No sessions done"
- **Current Day:**
  - "Today" (highlighted)
- **Future Days:**
  - "You planned a session at 6:00 PM"
  - "Study day planned"
  - "No plans yet"

**2. Current Time Display (Center):**
- **Format:** 24-hour format (14:30)
- **Size:** Large, prominent text (48px)
- **Color:** Dark gray (#333333)
- **Update:** Real-time system clock
- **Style:** Monospace font for consistent width

**3. Start Session Button (Bottom):**
- **Style:** Large rounded rectangle button
- **Size:** Full width minus margins (16px each side), height 64px
- **Background:** Blue gradient (#2196F3 to #1976D2)
- **Text:** "START SESSION" in white, bold, 20px
- **Shadow:** Subtle drop shadow for depth
- **States:**
  - **Normal:** Blue gradient
  - **Pressed:** Darker blue
  - **Loading:** Show spinner with "Starting..." text

#### 14.3) Tab Navigation

**Location:** Bottom of screen, above system navigation
**Style:** Horizontal bar with 5 tabs
**Background:** White (#FFFFFF) with top border (#E0E0E0)

**Tab Layout (Left to Right):**

**1. Library Tab:**
- **Icon:** Book or library icon
- **Label:** "Library"
- **Purpose:** Access to My Books section

**2. Calendar Tab:**
- **Icon:** Calendar icon
- **Label:** "Calendar"
- **Purpose:** Monthly and detailed calendar view

**3. Home Tab (Current):**
- **Icon:** House icon
- **Label:** "Home"
- **State:** Active (current page)
- **Visual:** Larger icon, brighter color (#2196F3)

**4. Analytics Tab:**
- **Icon:** Chart or graph icon
- **Label:** "Analytics"
- **Purpose:** Performance insights and statistics

**5. Profile Tab:**
- **Icon:** User or profile icon
- **Label:** "Profile"
- **Purpose:** User settings and profile management

**Tab Styling:**
- **Active Tab:**
  - Icon: 24px, blue color (#2196F3)
  - Label: Blue text (#2196F3), bold
  - Indicator: Blue underline or dot
- **Inactive Tabs:**
  - Icon: 20px, gray color (#999999)
  - Label: Gray text (#999999), normal weight
- **Spacing:** Equal distribution across screen width
- **Height:** 60px total height

#### 14.4) Calendar Gallery Interaction

**Scrolling Behavior:**
- **Smooth scrolling** with momentum
- **Snap to center** when scrolling stops
- **Touch gestures** for left/right swipe
- **Visual feedback** during scroll

**Day Selection:**
- **Tap to select** any visible day
- **Center alignment** when day is selected
- **Visual feedback** with subtle animation
- **Data loading** for selected day

**Calendar Data Sources:**
- **Past Days:** Session history from database
- **Current Day:** Real-time system date
- **Future Days:** Planned sessions and goals

#### 14.5) Data Integration & State Management

**Previous Session Data:**
- **Source:** Most recent completed session
- **Update:** Refresh when returning to Home tab
- **Fallback:** Show empty state if no sessions exist
- **Caching:** Store session data locally for quick display

**Calendar Data:**
- **Past Sessions:** Query session database by date
- **Future Plans:** User-scheduled sessions and goals
- **Real-time Updates:** Refresh when data changes
- **Performance:** Lazy load calendar data as needed

**Session Starter State:**
- **Ready State:** Button enabled, show current time
- **Loading State:** Button disabled, show spinner
- **Error State:** Button disabled, show error message
- **Navigation:** Button leads to session setup flow

#### 14.6) Technical Implementation Notes

**Performance Optimization:**
- **Lazy Loading:** Load calendar data on demand
- **Image Caching:** Cache calendar day icons
- **State Management:** Efficient re-rendering of components
- **Memory Management:** Clean up unused calendar data

**Responsive Design:**
- **Adaptive Layout:** Adjust panel sizes for different screen sizes
- **Touch Optimization:** Large touch targets for mobile
- **Orientation Support:** Handle landscape/portrait changes

**Accessibility:**
- **Screen Reader Support:** Proper labels for all interactive elements
- **High Contrast:** Ensure sufficient color contrast
- **Touch Targets:** Minimum 44px touch targets
- **Focus Management:** Clear focus indicators for navigation

**Error Handling:**
- **Network Issues:** Graceful fallback for data loading
- **Data Corruption:** Handle corrupted session data
- **System Clock:** Fallback if system time unavailable
- **Permission Issues:** Handle notification permission denials


