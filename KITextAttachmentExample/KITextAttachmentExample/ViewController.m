//
//  ViewController.m
//  KITextAttachmentExample
//
//  Created by Matt Styles on 29/04/2015.
//  Copyright (c) 2015 Matthew Styles. All rights reserved.
//

#import "ViewController.h"
#import "KITextAttachment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Start by creating an attributed string, we can add attachments to this.
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"This label has drawings embedded within it."];
    
    // A badly drawn spakline (You get the point)
    KITextAttachment *sparkLineAttachment = [KITextAttachment textAttachmentWithWidth:32 drawingBlock: ^(CGContextRef context, CGSize size) {
        [[UIColor lightGrayColor] setFill];
        [[UIColor blackColor] setStroke];
        CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
        CGContextMoveToPoint(context, 0, size.height / 2.0);
        CGContextAddLineToPoint(context, size.width / 2.0, 0.0);
        CGContextAddLineToPoint(context, size.width, size.height);
        CGContextStrokePath(context);
        CGContextStrokeRect(context, CGRectMake(0, 0, size.width, size.height));
    }];

    // An even more badly drawn smiley
    KITextAttachment *smileyAttachment = [KITextAttachment textAttachmentWithWidth:0 drawingBlock: ^(CGContextRef context, CGSize size) {
        CGRect bounds = CGRectMake(0, 0, size.width, size.height);
        CGRect innerBounds = CGRectInset(bounds, 8, 8);
        
        [[UIColor yellowColor] setFill];
        [[UIColor blackColor] setStroke];
        CGContextFillEllipseInRect(context, bounds);
        CGContextStrokeEllipseInRect(context, bounds);
        
        [[UIColor blackColor] setFill];
        CGContextFillEllipseInRect(context, CGRectMake(CGRectGetMinX(innerBounds), CGRectGetMinY(innerBounds), 2, 2));
        CGContextFillEllipseInRect(context, CGRectMake(CGRectGetMaxX(innerBounds), CGRectGetMinY(innerBounds), 2, 2));
        CGContextMoveToPoint(context, CGRectGetMinX(innerBounds), CGRectGetMaxY(innerBounds));
        CGContextAddLineToPoint(context, CGRectGetMaxX(innerBounds), CGRectGetMaxY(innerBounds));
        CGContextStrokePath(context);
    }];

    // Add the attachment at random locations in the text
    srand([NSDate timeIntervalSinceReferenceDate]);
    [text insertAttributedString:[NSAttributedString attributedStringWithAttachment:sparkLineAttachment] atIndex:rand() % text.length];
    [text insertAttributedString:[NSAttributedString attributedStringWithAttachment:smileyAttachment] atIndex:rand() % text.length];
    _label.attributedText = text;
}


@end
