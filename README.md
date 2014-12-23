JTATEmoji
=========
## 简介
此扩展可以将文件占位符转换为表情显示  

如 [kiss] 和 [hug] 显示为下图效果
![](http://i.gyazo.com/994bca6b90f0df664b635b2e2a35f99b.png)

## 使用

```
#import "NSAttributedString+JTATEmoji.h"
```

```
NSString *normalStr = @"此扩展可以将文件占位符转换为表情显示，如 [kiss] 和 [hug]";
myTextView.attributedText = [NSAttributedString emojiAttributedString:normalStr withFont:_myTextView.font];
    
```

### 计算文字转换表情后的高度
```
[myTextView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height
```

### 添加更多的图片
Emoji.plist 是一个字典文件，Key 为图片描述占位符。Value 为图片文件名。这两个参数都可以修改成任意的值。  
如果修改后的占位符不符合 ```\\[[A-Za-z0-9]*\\]```，那就需要在 ```NSAttributedString+JTATEmoji.m``` 中修改其正则表达式。  

----
## Brief
This category allows you to convert file placeholder into given image like emoji.

![](http://i.gyazo.com/994bca6b90f0df664b635b2e2a35f99b.png)

## Usage

```
#import "NSAttributedString+JTATEmoji.h"
```

```
NSString *normalStr = @"This category allows you to convert string into given image like this [kiss] and this [hug]";
myTextView.attributedText = [NSAttributedString emojiAttributedString:normalStr withFont:_myTextView.font];
    
```

### Calculate string size after converted
```
[myTextView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height
```

### Add more images
Emoji.plist is a dictionary. Key is the description of emoji placeholder. Value is image file name. You can replace whatever you want.   
If your file placeholder doesn't refer to ```\\[[A-Za-z0-9]*\\]```, you should modify regular expression in ```NSAttributedString+JTATEmoji.m```
