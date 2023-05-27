# flutter_corner_banner

[![release](https://github.com/cove1205/Plume/actions/workflows/release.yaml/badge.svg?branch=master)](https://github.com/cove1205/Plume/actions/workflows/release.yaml)
![Pub Version (including pre-releases)](https://img.shields.io/pub/v/flutter_corner_banner?include_prereleases)
![GitHub](https://img.shields.io/github/license/happy-flutter/flutter_corner_banner)

A widget that build a custom child with banner at the corner contain text or icons.

## Features:
- Supports any child widgets
- Supports four corner banner positions
- Support custom styles to achieve various animation effects
- Support Text and custom widget(like icons)


## Installation
i. Add the latest version of this package to your pubspec.yaml file, and run: 'dart pub get':
```yaml
dependancies:
  flutter_corner_banner: ^1.0.0
```

ii. Import the package in your Flutter App and use it.
```dart
import 'package:flutter_corner_banner/flutter_corner_banner.dart';
```


## Sample

```dart
 BannerWidget(
          bannerText: 'Banner text',
          bannerColor: Colors.blue,
          bannerPosition: BannerPosition.topRight,
          bannerSize: 70,
          child: CustomWidget()
        )
```

## Author

[happy-flutter](https://github.com/happy-flutter)

## License

Flutter Banner is available under the MIT license. See the LICENSE file for more info.