//
//  KITextAttachment.m
//  KITextAttachmentExample
//
//  Created by Matt Styles on 29/04/2015.
//  Copyright (c) 2015 Matthew Styles. All rights reserved.
//

#import "KITextAttachment.h"

@implementation KITextAttachment

- (instancetype)initWithWidth:(CGFloat)width drawingBlock:(KIDrawingBlock)block
{
    self = [super init];
    if (self)
    {
        _width = width;
        _drawingBlock = block;
    }
    
    return self;
}

+ (instancetype)textAttachmentWithWidth:(CGFloat)width drawingBlock:(KIDrawingBlock)block
{
    return [[KITextAttachment alloc] initWithWidth:width drawingBlock:block];
}

#pragma mark -

/**
 *  Override to support the drawing block image source.
 */
- (UIImage *)imageForBounds:(CGRect)imageBounds textContainer:(NSTextContainer *)textContainer characterIndex:(NSUInteger)charIndex
{
    if (self.drawingBlock)
    {
        UIGraphicsBeginImageContextWithOptions(imageBounds.size, NO, [UIScreen mainScreen].scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        _drawingBlock(context, imageBounds.size);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    else
    {
        return [super imageForBounds:imageBounds textContainer:textContainer characterIndex:charIndex];
    }
}

/**
 *  Override that calculates the bounds rect for an inline image if the drawing block is set.
 */
- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    if (_drawingBlock)
    {
        // Calculate the with for the image
        CGFloat widthForImage = lineFrag.size.height;
        if (_width != 0)
        {
            widthForImage = _width;
        }

        // Retrieve the font for the glyph position. Used to offset the image bounds otherwise it
        // will be drawn on the baseline, which is not what we want.
        UIFont *font = [textContainer.layoutManager.textStorage attribute:NSFontAttributeName
                                                                  atIndex:charIndex
                                                           effectiveRange:nil];
        
        return CGRectMake(0, font.descender, widthForImage, lineFrag.size.height);
    }
    
    // No drawing block so fallback on the original implementation
    return [super attachmentBoundsForTextContainer:textContainer proposedLineFragment:lineFrag glyphPosition:position characterIndex:charIndex];
}

@end
