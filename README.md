# WorldChat
Chat web application that supports real time message translation.

1. Chat pairing: The application requires user registration and log in. During the registration, the system asks the user to choose their default country and language. After registration, the user is directed to the main interface. In this interface, a chat filter which contains checkboxes for country names, languages, gender, age, etc, will be provided to the user (user A) to locate a partner with whom they will chat.  After clicking the submit button, the system will randomly pick one online user (user B) who satisfies the given requirements and it will then initiate the chat session.
2. In-time translation: By using Google Translator API, we can achieve in-time translation during chat session. For each chat session, we retrieve two users’ default language from our database,. We use this information to translate each message sent from user A to the default language of user B, and vice versa. By using the in-time translation, two users can overcome the language barrier.
3. User related functions: After the first chat, the users can then add their respective chat partners as to their friends list. From their friends list, a user can quickly recover the chat session with any friend. The application will provide a user profile interface where the user can edit basic information such as their profile picture, and manage their friends list. 
Application Security: 
4. In addition to the aforementioned functionality, all information stored by our database is encrypted for security purposes. This encryption is done using AES-256, ECB mode encryption, which is then encoded using base-64.

