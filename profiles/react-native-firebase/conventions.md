# React Native Firebase Profile

## Assumptions

- Mobile source lives in `src/`.
- Feature code lives under `src/features/<feature>/`.
- Shared UI and utilities live under `src/shared/`.
- Firebase initialization and wrappers live under `src/shared/services/firebase`.
- Remote data access should be wrapped in feature-level services or repositories
  instead of being called directly from screens.
- Firebase Auth, Firestore, Storage, and Cloud Messaging should be considered
  during product discovery, but only used when the app needs them.

## Recommended Structure

```text
src/
├── app/
├── features/
│   └── <feature>/
│       ├── screens/
│       ├── components/
│       ├── hooks/
│       ├── model/
│       └── services/
└── shared/
    ├── services/
    │   └── firebase/
    ├── ui/
    └── utils/
```

## Product Discovery Prompts

When the user describes an app idea, suggest likely needs such as:

- sign up, login, logout, account deletion
- onboarding and first-run permissions
- profile and settings
- push notification preferences
- offline/loading/error states
- Firestore security rules
- image/file upload if user-generated content exists
- admin/moderation flow if public content exists
- analytics events if product iteration matters

Separate confirmed requirements from suggestions.

## Validation

- Run lint, typecheck, and tests when available.
- Use emulator/device checks for important UI flows when practical.
- Record meaningful work in `docs/ai/feature-log/`.

