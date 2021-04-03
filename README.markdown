<p align="center">
 <img src="https://github.com/iamtheblackunicorn/theMansion/raw/main/assets/images/banner.png"/>
</p>

# THE MANSION

*Reading great content on your device.* :black_heart: :unicorn:

## About :books:

*The Mansion* is the official app for Android for my blog! A while back, I could not complete a coding challenge because I didn't know how to download a `JSON` API and parse and display the data that it held. *The Mansion* is the proof that I now know how to do this and that I can build an API myself using Jekyll. *The Mansion* is focussed on simplicity and elegance, two values that I hold in high regard. Feedback and contributions are more than welcome.

## Download :inbox_tray:

- *The Black Unicorn* (v.1.0.0): [Download](https://github.com/iamtheblackunicorn/theMansion/releases/download/v.1.0.0/TheMansion-v1.0.0-BlackUnicorn-Release.apk) (18.2 MB)
- *The Speed Update* (v.1.1.0): [Download](https://github.com/iamtheblackunicorn/theMansion/releases/download/v.1.1.0/TheMansion-v1.1.0-SpeedUpdate-Release.apk) (17.5 MB)
- *The Smoothness Update* (v.1.2.0): [Download](https://github.com/iamtheblackunicorn/theMansion/releases/download/v.1.2.0/TheMansion-v1.2.0-SmoothnessUpdate-Release.apk) (17.5 MB)
- *The March Update* (v.1.3.0): [Download](https://github.com/iamtheblackunicorn/theMansion/releases/download/v.1.3.0/TheMansion-v1.3.0-MarchUpdate-Release.apk) (17.2 MB)
- *The Clarity Update* (v.1.4.0): [Download](https://github.com/iamtheblackunicorn/theMansion/releases/download/v.1.4.0/TheMansion-v1.4.0-ClarityUpdate-Release.apk) (17.2 MB)

## Building :hammer:

Make sure that you have the following programs installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *The Mansion*.

## Extending the supported languages :book:

Notely is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and paste the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Version 1.0.0: Initial Release:

- upload to GitHub
- polishing of the logic
- minor fixes

### Version 1.1.0: Speed Update:

- API is now directly pulled from the interwebs
- smooth animations and loading times
- better error handling

### Version 1.2.0: The Smoothness Update:

- added sorting of posts
- added content updates
- minor fixes

### Version 1.3.0: The March Update:

- many new design improvements
- minor fixes
- performance improvements

### Version 1.4.0: The Clarity Update

- minor fixes
- more performance improvements
- updated logo

## Note :scroll:

- *The Mansion* :unicorn: by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- licensed under the MIT license.
