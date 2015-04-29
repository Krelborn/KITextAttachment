//
//  KITextAttachment.h
//  KITextAttachmentExample
//
//  Created by Matt Styles on 29/04/2015.
//  Copyright (c) 2015 Matthew Styles. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Block for callback to draw images into a context
 *
 *  @param context CGContextRef to draw into
 *  @param size    Size of the image to draw
 */
typedef void (^KIDrawingBlock)(CGContextRef context, CGSize size);

/**
 *  An NSTextAttachment that lets you embed inline images within text. Will behave like a standard
 *  NSTextAttachment unless a drawingBlock is attached. When this happens the image will be generated
 *  with the specified width and drawn with the drawingBlock callback.
 */
@interface KITextAttachment: NSTextAttachment

/**
 *  The width of the image. If this is non-zero then a square image will be created to fit within the
 *  line height.
 */
@property CGFloat width;

/**
 *  Callback to draw. Is called whenever the image requested.
 */
@property (strong) KIDrawingBlock drawingBlock;

/**
 *  Construct a new instance of KITextAttachmnent that will draw an inline image.
 *
 *  @param width Width of the image to draw
 *  @param block Callback to draw the image when requested
 *
 *  @return New instance
 */
- (instancetype)initWithWidth:(CGFloat)width drawingBlock:(KIDrawingBlock)block;

/**
 *  Convenience method to construct a new instance of KITextAttachment that will draw an inline image.
 *
 *  @param width Width of the image to draw
 *  @param block Callback to draw the image when requested
 *
 *  @return New instance
 */
+ (instancetype)textAttachmentWithWidth:(CGFloat)width drawingBlock:(KIDrawingBlock)block;

@end
