JTATEmoji
=========
## What is this?
This category allows you to convert file placeholder into given image like emoji.

[kiss] and [hug] will be look like this  
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

## License
JTATEmoji is published under MIT License
