
# Navigator example

Stack of routes (full screen widgets)
Route is handled by a `Navigator` widget.

Imperatively manage the stack with push and pop.

## Change current screen with new screen

```dart

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// and

Navigator.pop(context);

```

### Named navigator routes

routes is usually managed by its name

### Route can return a value

### Custom page

pageBuilder and transitionsBuilder

### Nested navigator

## 유저 시나리오

- App has bottom tab bar and each tab has its own stack of screens
