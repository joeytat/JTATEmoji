JTATEmoji
=========

This category allows you to convert string into given image like emoji.

## Usage

```
NSString *normalStr = @"This category allows you to convert string into given image like this [kiss] and this [hug]";
self.myTextView.attributedText = [NSAttributedString emojiAttributedString:normalStr withFont:_myTextView.font];
    
```

Emoji.plist is a dictionary. Key is the description of emoji placeholder. Value is image file name. You can replace whatever you want. 
if your file name doesn't refer to ```\\[[A-Za-z0-9]*\\]```, you should modify regular expression in ```NSAttributedString+JTATEmoji.m```