# Mental Wellness Companion App


Flutter based Mental Wellness Companion Mobile App designed to promote mental well-being. This application includes features guided meditations, breathing exercises, mood tracking, and journaling prompts. By leveraging state management techniques and integrating with available mental health resources, the app offers personalized experiences to promote mental wellness. The app also features goal setting and reminder functionalities to help users maintain their mental health routines.


##Features
**Guided Meditations:** Provide users with a variety of guided exercises, therapies and other resources to help reduce stress and promote relaxation.
**Breathing Exercises:** Includes a start/stop button and interactive breathing cycle for guiding users.
**Mood Tracking:** Allow users to record their mood daily and track their emotional trends over time.
**Journaling Prompts:** Offer daily prompts to encourage users to reflect and write about their thoughts and feelings.
**Reminder Notifications:** Set reminders for activities like meditation, journaling, or taking breaks to ensure users stay on track with their mental wellness routines.
**Physical Exercises:** Display a list of physical exercises fetched from an external API, allowing users to explore various exercises.


##Technology Stack
**Framework:** Flutter
**Language:** Dart
**State Management:** Provider
**Development Tools:** Android Studio, VS Code
**Version Control:** Git


##Key Components
**Splash Screen:** An initial screen with animation that appears for a few seconds before navigating to the home screen.
**Home Screen:** The screen includes a mood logging section and a reminder notification section. User can also navigate to mood history screen and add reminder screen.
**Mood Tracking Screen:** The screen displays the user's mood history of each recorded mood with its date and time using a ListView.
**Journal Screen:** A section which allows users to view, add, and delete journal entries. On tapping a note opens a detailed NotesScreen. A floating action button is also given which allows adding new notes via AddNoteScreen.
**Add Note Screen**: A screen that allows users to create new journal entries, including a topic and the main text.
**Show Note Screen:** A detailed view of individual journal notes, displaying the topic and the content written by the user.
**Meditation Exercises Screen: **
**Breathing Exercise Screen:** Screen includes a start/stop button and interactive breathing cycle for guiding users.
**Music Therapy Screen:** Screen that showcases the importance of music therapy for relaxation and provide several calming songs known for their relaxing effects using a ListView.
**Physical Exercise Screen:** The Screen fetches and displays a list of physical exercises through API. It shows a loading indicator while fetching data, handles errors, and displays the exercise details in a ListView once loaded.
**Reminder Screen:** A screen displaying all set reminders, allowing users to manage and edit their reminders.
**Add Reminder Screen:** A screen where users can create new reminders, specifying the date and time of notifications.
**Bottom Navigation Bar:** A navigation component at the bottom of the screen for quick access to Home Screen, Meditation Exercises Screen, Journal Screen.


##User Interface
Intuitive and user-friendly UI
Consistent design language and branding
Interactive elements for engaging user experience
Responsive layout for different screen sizes


##Testing:
Unit testing for individual components and functions
Integration testing for testing interactions between components
Widget testing for UI components
Manual testing for usability and user experience validation
