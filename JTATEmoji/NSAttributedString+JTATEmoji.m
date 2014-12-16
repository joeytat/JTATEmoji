//
//  NSAttributedString+JTATEmoji.m
//  Example
//
//  Created by Joey on 12/16/14.
//  Copyright (c) 2014 Joeytat. All rights reserved.
//

#import "NSAttributedString+JTATEmoji.h"

@implementation NSAttributedString (JTATEmoji)

+ (NSAttributedString *)emojiAttributedString:(NSString *)string withFont:(UIFont *)font
{
    @autoreleasepool {
        NSMutableAttributedString *parsedOutput = [[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName : font}];
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[[A-Za-z0-9]*\\]" options:0 error:nil];
        NSArray* matches = [regex matchesInString:[parsedOutput string]
                                          options:NSMatchingWithoutAnchoringBounds
                                            range:NSMakeRange(0, parsedOutput.length)];
        
        
        NSDictionary *emojiPlistDic = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Emoji" ofType:@"plist"]];
        
        // Make emoji the same size as text
        __block CGSize emojiSize = CGSizeMake(font.lineHeight, font.lineHeight);
        
        for (NSTextCheckingResult* result in [matches reverseObjectEnumerator]) {
            NSRange matchRange = [result range];
            NSRange captureRange = [result rangeAtIndex:0];
            
            // Find emoji images by placeholder
            NSString *placeholder = [parsedOutput.string substringWithRange:captureRange];
            UIImage *emojiImage = [UIImage imageNamed:emojiPlistDic[placeholder]];
            
            // Resize Emoji Image
            UIGraphicsBeginImageContextWithOptions(emojiSize, NO, 0.0);
            [emojiImage drawInRect:CGRectMake(0, 0, emojiSize.width, emojiSize.height)];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            NSTextAttachment* textAttachment = [NSTextAttachment new];
            textAttachment.image = resizedImage;
            
            // Replace placeholder with image
            NSAttributedString *rep = [NSAttributedString attributedStringWithAttachment:textAttachment];
            [parsedOutput replaceCharactersInRange:matchRange withAttributedString:rep];
        }
        
        return [parsedOutput copy];
    }
}

@end
