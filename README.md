# FDCountDown
一个60秒倒计时按钮
### 使用

```
    FDCountdownButtonView *countDown = [[FDCountdownButtonView alloc]initWithFrame:CGRectMake(50, 100, 100, 50)];
    [countDown ableSelectButton]; 
    countDown.delegate = self;
    [self.view addSubview:countDown];
```
