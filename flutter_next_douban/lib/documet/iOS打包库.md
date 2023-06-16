- [x] 新创建iOS工程
- [x] 将ios的framework 拷贝到新创建的iOS工程
- [x] 拷贝插件文件到工程
初始化代码，在didFinishLaunchingWithOptions 中添加如下方法
```
- (void)initApp {
    NativeViewController *nativeVC = [NativeViewController alloc]init];
    self.rootVC = nativeVC;
    self.naviController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController: self.naviController];
    [self.window makeKeyAndVisible];
}

- (void)initFlutter {
    self.NextFlutterEngine = [[FlutterEngine alloc] initWithName:@"\next.flutterengine" project:[[FlutterDartProject alloc] init]];
    [self.NextFlutterEngine runWithEntryPoint: nil];
    self.nextFlutterVC = [[FlutterViewController alloc]initWithEngine:self.NextFlutterEngine nibName:nil bundle:nil];
}

```