# How Was Your Day?

A calm, local-first Flutter journal for rating the day, writing a short note,
noticing patterns, and explicitly requesting an occasional AI reflection.

## Languages

The app follows the device language by default and supports English, French,
Spanish, Italian, German, Portuguese, and Arabic. A persistent override is
available under **Settings → Language**. Unsupported device languages fall back
to English. Arabic uses Flutter's standard locale-driven RTL directionality.

Translations live in `lib/l10n/*.arb` and are generated with Flutter's standard
`gen-l10n` tooling. Built-in tags are stored with stable IDs such as `work` and
`exercise`; legacy English tag values are migrated when local entries load.

## Privacy model

- Entries and generated reflections are stored in Hive on the Android device.
- The journal, history, and all statistics work offline and without an account.
- Nothing is sent when the app opens, saves, or changes tabs.
- Only the selected week or month is sent when the user presses a reflection
  button and accepts the first-use explanation.
- Reflection requests include the active app language so newly generated AI
  content uses that language. Existing saved reflections are never translated
  or regenerated.
- The backend does not persist entries and does not log journal content.

## Run the Flutter app

Install Flutter, connect an Android device or emulator, then run:

```sh
flutter pub get
flutter run --dart-define=BACKEND_BASE_URL=http://10.0.2.2:3000
```

`10.0.2.2` reaches the host machine from the standard Android emulator. For a
physical device, use an HTTPS URL reachable by that device. The debug Android
manifest allows cleartext traffic for local development only; release builds
should use HTTPS.

The app defaults to `http://10.0.2.2:3000`, but the URL is centralized in
`lib/main.dart` and is overridden through `BACKEND_BASE_URL` at build/run time.

## Run the reflection backend

The API requires Node.js 20 or newer.

```sh
cd backend
npm install
copy .env.example .env
```

Edit `backend/.env` and provide your server-side key:

```dotenv
OPENAI_API_KEY=your_key_here
PORT=3000
```

Then start the server:

```sh
npm run dev
```

The backend uses the Responses API with `gpt-6-luna`. Send a reflection from
the app, or POST a valid weekly or monthly request to
`http://localhost:3000/api/reflection`.

The key remains on the backend. Never pass it with `--dart-define` or place it
in Flutter source. `.env` is ignored by Git.

## Verification

```sh
flutter analyze
flutter test
cd backend
npm run typecheck
npm test
```

The backend limits request bodies to 128 KB, accepts at most 31 entries,
validates every field, rate-limits requests, applies an AI timeout, validates
structured AI output, and returns safe errors for provider failures.
