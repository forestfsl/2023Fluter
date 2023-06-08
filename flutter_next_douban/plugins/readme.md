- 1.根目录下面创建plugins文件夹

- 2.flutter create --org com.next --template=package next_widgets
```
ain  flutter create --org com.next --template=package next_widgets
Signing iOS app for device deployment using developer identity: "Apple
Development: 756613301@qq.com (FLR5YDJ433)"
Recreating project next_widgets...
Resolving dependencies in next_widgets... (6.1s)
Got dependencies in next_widgets.
This app is using a deprecated version of the Android embedding.
To avoid unexpected runtime failures, or future build failures, try to migrate
this app to the V2 embedding.
Take a look at the docs for migrating an app:
https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects
Wrote 0 files.

All done!
Your package code is in next_widgets/lib/next_widgets.dart

```
这个时候可以看到plugins里面会有next_widgets 的目录


- 3.pubspec.yaml 指定路径
```
  next_widgets:
    path: plugins/next_widgets
```

- 4. 增加popup_windows.dart 文件
```

```

- 5.lib/next_widgets.dart 中增加内容
```

```