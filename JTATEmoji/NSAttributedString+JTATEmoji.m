//
//  NSAttributedString+JTATEmoji.m
//  JTATEmoji
//
//  Created by Joey on 12/16/14.
//  Copyright (c) 2014 Joeytat. All rights reserved.
//

#import "NSAttributedString+JTATEmoji.h"

@implementation NSAttributedString (JTATEmoji)

+ (NSAttributedString *)emojiAttributedString:(NSString *)string withFont:(UIFont *)font
{
    NSMutableAttributedString *parsedOutput = [[NSMutableAttributedString alloc]initWithString:string attributes:@{NSFontAttributeName : font}];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[[A-Za-z0-9]*\\]" options:0 error:nil];
    NSArray* matches = [regex matchesInString:[parsedOutput string]
                                      options:NSMatchingWithoutAnchoringBounds
                                        range:NSMakeRange(0, parsedOutput.length)];
    
    
    NSDictionary *emojiPlistDic = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Emoji" ofType:@"plist"]];
    
    // Make emoji the same size as text
    CGSize emojiSize = CGSizeMake(font.lineHeight, font.lineHeight);
    
    for (NSTextCheckingResult* result in [matches reverseObjectEnumerator]) {
        NSRange matchRange = [result range];
        
        // Find emoji images by placeholder
        NSString *placeholder = [parsedOutput.string substringWithRange:matchRange];
        UIImage *emojiImage = [UIImage imageNamed:emojiPlistDic[placeholder]];
        
        // Resize Emoji Image
        UIGraphicsBeginImageContextWithOptions(emojiSize, NO, 0.0);
        [emojiImage drawInRect:CGRectMake(0, 0, emojiSize.width, emojiSize.height)];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSTextAttachment *textAttachment = [NSTextAttachment new];
        textAttachment.image = resizedImage;
        
        // Replace placeholder with image
        NSAttributedString *rep = [NSAttributedString attributedStringWithAttachment:textAttachment];
        [parsedOutput replaceCharactersInRange:matchRange withAttributedString:rep];
    }
    return [[NSAttributedString alloc]initWithAttributedString:parsedOutput];
}

@end
