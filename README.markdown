<p align="center">
 <img src="https://github.com/iamtheblackunicorn/theMansion/raw/main/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"/>
</p>

# THE MANSION

*Reading great content on your device.* :black_heart: :unicorn:

## About :books:

*The Mansion* is the official app for Android for my blog! A while back, I could not complete a coding challenge because I didn't know how to download a `JSON` API and parse and display the data that it held. *The Mansion* is the proof that I now know how to do this and that I can build an API myself using Jekyll. *The Mansion* is focussed on simplicity and elegance, two values that I hold in high regard. Feedback and contributions are more than welcome.

## Download :inbox_tray:

- Initial Release *Black Unicorn* v.1.0.0 (17.6MB): [Download]()

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
Copy and past the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Initial Release:

- upload to GitHub
- polishing of the logic
- minor fixes

## Note :scroll:

- *The Mansion* :crossed_swords: by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- licensed under the MIT license.
