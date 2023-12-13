# {{project_name.titleCase()}}

## Installation

```bash
# clone repo
git clone <repo_url>

# globally install mason_cli
dart pub global activate mason_cli
```

## Using build runner

Build runner is used for code generation

```bash
dart run build_runner build
# or
dart run build_runner watch
```

## Using mason

```bash
# create new page - use this when creating new pages
mason make page

# create new model - use this when creating models for communication with backend
mason make model

# create new bloc
mason make bloc
```

## Generating icons .vec

```bash
# dart run vector_graphics_compiler -i <input_svg_path> -o <output_vec_path>
dart run vector_graphics_compiler -i $HOME/Downloads/Vector.svg -o assets/icons/circled_plus_small.vec
```


## Build

### Android - APK
```bash
flutter build apk --flavor <development | staging | production> --target lib/main_<development | staging | production>.dart --release
```

### Android - app bundle
```bash
flutter build appbundle --flavor <development | staging | production> --target lib/main_<development | staging | production>.dart --release
```

### iOS
```bash
flutter build ipa --flavor <development | staging | production> --target lib/main_<development | staging | production>.dart --release
```