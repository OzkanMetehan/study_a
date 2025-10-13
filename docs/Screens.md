## Screens Catalogue

We will define every screen here before writing code. For each screen, paste a screenshot and fill the template so we are 100% aligned.

Duplicate the template section for each screen you want to add.

---

### Screen Name
- Purpose: What should the user achieve on this screen?
- Entry points: Where does the user come from? (tab, button, link)
- Exit points: Where can the user go next?
- Primary actions: The main CTAs (buttons) and what they do.
- Secondary actions: Optional controls (filters, menus, etc.).
- Data shown: List the fields/cards/metrics shown.
- Local state: Inputs, selections, toggles.
- Performance notes: Anything that should feel instant, or can load lazily.
- Edge cases: Empty state, loading, error.

Attachments:
- Screenshot(s): paste below

Notes:
- Any constraints, animations, or UX details we must follow.

### HOME
- Purpose: The main hub for users to see a summary of their app. The general overview
- Entry points: The bottom navigation bar, there's a button with a home icon on it.
- Exit points: The bottom navigation bar lets users to go to; library, calendar, analytics and profile. On the top right corner the user avatar will also send them to the profile. In the center of the screen "Start Studying" button will send them to the "Session Setup" screen.
- Primary actions: "Start Studying" button for setting a session. Above it Subject cards for upcoming scheduled sessions (swipebale and also chevrons for navigating left and right). Avatar on the top right corner. And obviously the bottom navigation bar.
- Secondary actions: "Previous Session" summary card with details on it. "Target Progress" card for monitoring target. 
- Data shown: Date, Hi [Name], Avatar, Target Progress card, upcoming scheduled sessions card(s) Start Studying Card and the button on the center of it. Above the button in the same card the current live time (clock). Under the start study card previous session summary card with its date, question amouns, subjects, graph etc.
- Local state: 
- Performance notes: 
- Edge cases: 

Attachments:
- Screenshot(s): 

Notes:
- Any constraints, animations, or UX details we must follow.
---
### SESSION SETUP 
- Purpose: Adjusting the settings of a session and starting the session itself.
- Entry points: Through the "Start Studying" button in the home screen.
- Exit points: Through the "Back" arrow on the top left corner. 
- Primary actions: Selecting subjects and topics from dropdown lists. Setting a stopwacht or countdown timer (adjustable with a toggle switch), Initializing the actual session. Switching to the Mock Test Mode with a toggle switch
- Secondary actions: Selecting and deselecting the remaining options like mood, location, break reminder and preset
- Data shown: Duration/Timer Subject, topic, reminder interval, current mood(s), current location and (ifchosen) a preset.
- Local state: 
- Performance notes: 
- Edge cases:

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.

### LIBRARY 
- Purpose: Monitoring and viewing the books that are owned and their progress as well as details/
- Entry points: Through the `library` button on the bottom bar (the farthest left)
- Exit points: Through the other buttons from the bar
- Primary actions: Viewing books and seeing the details when clicking on them. Adding a new book.
- Secondary actions: Filtering the books by subject, completion and alphabetic. Also seeing the books in `all` `completed` `whishlist` and `favorites` tabs
- Data shown: Book cover images, names, completion percentages
- Local state: 
- Performance notes: 
- Edge cases:

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.

### CALENDAR 
- Purpose: Seeing time specific details of sessions like for particular day/week/month or mondays/tuesdays etc
- Entry points: Through the `calendar` button on the bottom bar 
- Exit points: Through the other buttons from the bar
- Primary actions: Changing the month at the top title/button with the chevrons on both of its sides, The day we tap will shown at the bottom as a details card with the details of the session(s) of that day. The days will be shown in a 7x5 grid with each day is a circular button with green tone according to the questions solved that day (heatmap) Under the calendar grid it'll be a legend for the icons and their meanings (sick day, rest day, streak is saved) and a toggle for turning on and off the question amount under each day. 
- Secondary actions: At the bottom right, just above the bottom bar it'll be a warning pop op and if we tap on it it'll expand to the left and the neglected subjects will appear there
- Data shown: Question Solved, Hours spent, wrong,empty,net,accuracy inside the details card
- Local state: 
- Performance notes: 
- Edge cases:

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.

### PROFILE 
- Purpose: Seeing the details of the account with name, grade, title, total questions solved, total hours studies and amount of total sessions. As well as Badges, Preferences and Setting sections.
- Entry points: Through the `profile` button on the bottom bar 
- Exit points: Through the other buttons from the bar
- Primary actions: Viewing the current badges owned. Changing the preferences and settings of the app
- Secondary actions: Accesing the profile edit section with a button, Changing the color theme of the app. Exporting profile data with a button
- Data shown: Name, Title, Grade, Total questions, hours and sessions
- Local state: 
- Performance notes: 
- Edge cases:

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.

### ANALYTICS 
- Purpose: Seeing the statistics of the sessions in every possible detail.
- Entry points: Through the `profile` button on the bottom bar 
- Exit points: Through the other buttons from the bar
- Primary actions: Viewing the current badges owned. Changing the preferences and settings of the app
- Secondary actions: Accesing the profile edit section with a button, Changing the color theme of the app. Exporting profile data with a button
- Data shown: Name, Title, Grade, Total questions, hours and sessions
- Local state: 
- Performance notes: 
- Edge cases:

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.


### Example — Home (placeholder)
- Purpose: Landing screen after app opens; shows a welcome and navigation.
- Entry points: App start.
- Exit points: Tabs or navigation to other screens.
- Primary actions: N/A.
- Secondary actions: N/A.
- Data shown: App title only.
- Local state: None.
- Performance notes: Instant.
- Edge cases: N/A.

Attachments:
- (add screenshot here)

Notes:
- This is only an example block; replace with real screens.


