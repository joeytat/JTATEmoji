//
//  ViewController.m
//  Example
//
//  Created by Joey on 12/16/14.
//  Copyright (c) 2014 Joeytat. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+JTATEmoji.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *normalStr = @"This category allows you to convert string into given image like this [kiss] and this [hug]";
    self.myTextView.attributedText = [NSAttributedString emojiAttributedString:normalStr withFont:_myTextView.font];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
