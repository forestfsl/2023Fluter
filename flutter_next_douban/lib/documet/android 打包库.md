- [x] 1. 去到项目目录下，执行flutter build apk --release
```
 ~/Documents/Flutter/flutterProject/2023Fluter   main  cd flutter_next_douban
 ~/Documents/Flutter/flutterProject/2023Fluter/flutter_next_douban   main  flutter build apk --release

┌─────────────────────────────────────────────────────────┐
│ A new version of Flutter is available!                  │
│                                                         │
│ To update to the latest version, run "flutter upgrade". │
└─────────────────────────────────────────────────────────┘

Font asset "MaterialIcons-Regular.otf" was tree-shaken, reducing it from 1645184 to 2096 bytes (99.9% reduction). Tree-shaking can be disabled by providing the --no-tree-shake-icons flag when building your app.
Running Gradle task 'assembleRelease'...                           69.9s
✓  Built build/app/outputs/flutter-apk/app-release.apk (22.8MB).
```
- 2.去到apk release 目录下,解压文件(将apk改成zip)
```
 ~/Documents/Flutter/flutterProject/2023Fluter/flutter_next_douban/build/app/outputs/apk/release   main  pwd
/Users/fengsonglin/Documents/Flutter/flutterProject/2023Fluter/flutter_next_douban/build/app/outputs/apk/release
```
解压目录之后会发现存在以下内容
```
puts/apk/release/app-release   main  ls
AndroidManifest.xml assets              lib
DebugProbesKt.bin   classes.dex         res
META-INF            kotlin              resources.arsc
```
- 3 打包成ar
- 3.1 用vs打开工程，去到android->app->build.gradle
```
apply plugin: 'com.android.application'  -> apply plugin: 'com.android.library'
将applicationId "com.example.flutter_next_douban" 注释
```
 - 3.2 重新执行flutter build apk --release