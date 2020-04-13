# flutter_charades

## Flutter

If you want to learn about Flutter. Check [flutter.dev](https://flutter.dev)

## Learnings

### ChangeNotifier vs BLOC library

1. BLOC library needs more code :(
2. ChangeNotifier is harder to test when some streams are listened in it. I like that I can use yield/yield* operator in Bloc's mapEventToStream method. For me this syntax is more understandable.
3. Testing BLOCs is easy. Unfortunately blocTest (from bloc_test package) sometimes fails when using private internal events. But RxDart comes with beautiful operators that helps to refactor code, that using private operators won't be necessary.