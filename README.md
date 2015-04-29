# KITextAttachment
NSTextAttachment subclass for iOS 7+ that allows images to be drawn in text with blocks.

It's currently just a proof of concept but may be of use.

<img width=256 src="https://raw.github.com/Krelborn/KITextAttachment/master/Screenshot.png" alt="KILabel Screenshot">

## Install
### Copy
Download or checkout sources and drag KITextAttachment.h and .m into your XCode project.

### CocoaPods
<pre>
	pod 'KITextAttachment', :git => 'https://github.com/Krelborn/KITextAttachment.git'
</pre>

## Example
Here's a quick example of setting up an attachment to render at the start of a string.
``` objective-c
// First you need an attributed string
NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"This label has drawings embedded within it."];

// Create the attachment, speciying the image width and a block to draw it
KITextAttachment *attachment = [KITextAttachment textAttachmentWithWidth:128 drawingBlock: ^(CGContextRef context, CGSize size) {
  [[UIColor redColor] setStroke];
  CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
}];

// Now add the attachment to your text before you set it to your label
NSAttributedString *textWithImage = [NSAttributedString attributedStringWithAttachment:attachment];
[text insertAttributedString:textWithImage atIndex:0];

label.attributedText = text;
```

## License
NSTextAttachment is available under the MIT license.

## Contact
Open an issue to report bugs or request a feature.