# creevek_flutter_sandbox

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=Flat-square&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=Flat-square&logo=dart&logoColor=white)

## Getting Started 🚀

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Mason](https://brickhub.dev/)

### Sandbox setup

1. Run `mason init` in the root directory of your project
2. Open the `mason.yaml` file and add the following:

```yaml
bricks:
  creevek_flutter_sandbox:
    git:
      url: "https://github.com/CreevekCZ/creevek_flutter_sandbox"
      ref: main
  creevek_flutter_sandbox_feature:
    git:
      url: "https://github.com/CreevekCZ/creevek_flutter_sandbox_feature"
      ref: main
```

3. Run `mason get` to download the bricks
4. Run `mason make creevek_flutter_sandbox` to run the generator
5. Run `flutter pub get` to install dependencies
6. Run build_runner to generate files `flutter pub run build_runner build --delete-conflicting-outputs`

### Create new feature

Automatically create new feature with all nessesary folders in `lib/features` folder.

1. Run `mason make creevek_flutter_sandbox_feature` to run the generator

## Included packages

In the list, you can see the most important packages used in this sandbox.

- hook_riverpod
- flutter_hooks
- go_router
- freeze
- get_it
- injectable

## Mason

- [Official Mason Documentation][2]
- [Code generation with Mason Blog][3]
- [Very Good Livestream: Felix Angelov Demos Mason][4]

[2]: https://github.com/felangel/mason/tree/master/packages/mason_cli#readme
[3]: https://verygood.ventures/blog/code-generation-with-mason
[4]: https://youtu.be/G4PTjA6tpTU
