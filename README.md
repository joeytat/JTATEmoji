JTATEmoji
=========

This category allows you to convert string into given image like emoji.

![](http://i.gyazo.com/994bca6b90f0df664b635b2e2a35f99b.png)

## Usage

```
#import "NSAttributedString+JTATEmoji.h"
```

```
NSString *normalStr = @"This category allows you to convert string into given image like this [kiss] and this [hug]";
self.myTextView.attributedText = [NSAttributedString emojiAttributedString:normalStr withFont:_myTextView.font];
    
```

### How to add new images
Emoji.plist is a dictionary. Key is the description of emoji placeholder. Value is image file name. You can replace whatever you want.   

if your file name doesn't refer to ```\\[[A-Za-z0-9]*\\]```, you should modify regular expression in ```NSAttributedString+JTATEmoji.m```