## Study App — Development Plan (Non‑Technical, MVP to Launch)

This plan describes how we will build the app step by step, what you will see at each step, and when we consider a step “done.” No coding details here—just outcomes and user-facing behavior.

### Guiding principles
- Build the essentials first; polish later.
- Keep every step usable on its own so you can try it quickly.
- Favor simple data entry, clear visuals, and distraction-free sessions.

### Milestone 0 — Agree on the design (1–2 days)
- Align on the product design and this plan.
- Confirm the initial list of lessons and subjects to preload (optional).
- Decide basic app identity (name and icon direction).
- Outcome: We both agree on what we’ll build first.

Acceptance checklist:
- Design doc reviewed and accepted.
- Development plan accepted.
- Initial lessons/subjects list agreed (or we keep it empty).

### Milestone 1 — Structure & Navigation (2–3 days)
- Tabs visible: Lessons, My Books, Study, Calendar, Analytics.
- Profile menu accessible from the top-right, includes Profile, Reminders, Settings, Export.
- First‑time onboarding: collect name, class, and goal (college + major).
- Outcome: You can move around the app and complete onboarding.

Acceptance checklist:
- Onboarding saves profile data.
- Tabs and menu navigate smoothly.

### Milestone 2 — Lessons & Subjects (2–4 days)
- Lessons tab shows expandable lessons; opening one reveals subjects.
- Simple screens to add/edit/delete lessons and subjects.
- Quick action to start a study session from a subject.
- Outcome: You can organize what you study without books yet.

Acceptance checklist:
- Create, edit, delete lessons and subjects.
- List updates immediately and remains after app restarts.

### Milestone 3 — My Books (2–4 days)
- My Books shows a list of books with publisher.
- Book detail shows linked subjects and basic progress.
- Add/edit book flow; optionally link subjects to a specific book.
- Outcome: You can track progress per book.

Acceptance checklist:
- Create, edit, delete a book.
- Link subjects to books as needed.

### Milestone 4 — Study Sessions (4–6 days)
- Start a session by selecting a lesson/subject (and book if you want).
- Timer with start, pause/resume, and end; works if app is minimized.
- End-of-session form asks solved, correct, wrong, empty; checks totals.
- Outcome: You can run real sessions and log results.

Acceptance checklist:
- Timer behaves correctly across pauses and app minimization.
- Validation ensures solved = correct + wrong + empty.
- A saved session appears in history immediately.

### Milestone 5 — Calendar (3–5 days)
- Monthly calendar view shows which days have sessions.
- Tapping a day shows session cards with details (book, subject, duration, counts, net).
- From a session card, you can jump to the related book/subject.
- Outcome: You can review past work by date.

Acceptance checklist:
- Calendar reflects sessions accurately.
- Day detail matches entered data.

### Milestone 6 — Analytics & Profile (4–6 days)
- Analytics shows: total solved, total hours, average net, time per question.
- Weakest subjects and least‑solved subjects highlighted.
- Profile shows overall stats (totals) and your goal information.
- Outcome: You can see where to improve and track totals easily.

Acceptance checklist:
- Analytics numbers match calendar/session data.
- Weak/least‑solved sections make sense given sample data.

### Milestone 7 — Reminders (2–4 days)
- Enable/disable reminders.
- Choose simple schedules (e.g., daily at 19:00).
- App suggests least‑solved or weak subjects.
- Outcome: Gentle nudges to study the right topics.

Acceptance checklist:
- Reminders appear at the chosen times.
- Tapping a reminder opens the app ready to start a session.

### Milestone 8 — Export to PDF (2–4 days)
- From Profile or Analytics, export a PDF summary.
- Choose a date range (last 7/30 days or custom).
- PDF shows key stats, charts/summaries, and your profile header (name, class, goal).
- Outcome: You can share a clean progress report.

Acceptance checklist:
- PDF opens and looks neat on phone.
- Numbers match in‑app analytics for the same date range.

### Milestone 9 — Polish & Accessibility (3–5 days)
- Visual polish for key screens; consistent colors and spacing.
- Larger tap targets and readable text sizes.
- Optional: data backup/restore for peace of mind.
- Outcome: Feels smooth and friendly to use daily.

Acceptance checklist:
- No obvious rough edges in the main flows.
- Basic accessibility checks pass (tap sizes, contrast, font scale).

### Milestone 10 — Beta & Launch (2–4 days)
- Create a signed release build (APK) for testing.
- Share with your sister; gather feedback from real use.
- Fix high‑priority issues and rebuild release APK.
- Outcome: A shareable APK ready for daily use.

Acceptance checklist:
- APK installs without errors.
- Core flows work end‑to‑end on the test device.

### Collaboration & Feedback
- We’ll review each milestone together with a short demo.
- You’ll try the feature in real use and share quick feedback.
- We adjust the next milestone if needed—fast iterations.

### Success indicators for the MVP
- Your sister can plan, run, and log sessions without help.
- The calendar and analytics match her expectations.
- Reminders feel helpful, not annoying.
- She can share a PDF report easily.

### Out of scope for MVP (for later)
- Complex score simulations, advanced sync across devices, social features.
- Deep customization beyond what’s needed to study effectively.

### Risks & Mitigations (non‑technical)
- Too much complexity early → Keep the MVP tight; say “not yet” to extras.
- Data entry feels heavy → Default sensible values; reuse last selections; minimal typing.
- Over‑notifications → Provide simple controls and quiet hours.

### What I’ll do next
- Start Milestone 1: set up navigation, onboarding, and the Profile entry points so you can click through the app and complete the first‑time profile.




