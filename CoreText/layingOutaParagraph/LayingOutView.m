

//
//  LayingOutView.m
//  CoreText
//
//  Created by iOS on 2018/8/30.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "LayingOutView.h"
#import <CoreText/CTStringAttributes.h>
#import <CoreText/CTFramesetter.h>

@implementation LayingOutView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // Initialize a graphics context in iOS.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Flip the context coordinates, in iOS only.
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Set the text matrix.
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    // Create a path which bounds the area where you will be drawing text.
    // The path need not be rectangular.
    CGMutablePathRef path = CGPathCreateMutable();
    
    // In this simple example, initialize a rectangular path.
    CGRect bounds = CGRectMake(10.0,rect.size.height - 300.0, 200.0, 200.0);
    CGPathAddRect(path, NULL, bounds );
    
    // Initialize a string.
    CFStringRef textString = CFSTR("Hello, World! I know nothing in the world that has as much power as a word. Sometimes I write one, and I look at it, until it begins to shine.");
    
    // Create a mutable attributed string with a max length of 0.
    // The max length is a hint as to how much internal storage to reserve.
    // 0 means no hint.
    CFMutableAttributedStringRef attrString =
    CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
    
    // Copy the textString into the newly created attrString
    CFAttributedStringReplaceString (attrString, CFRangeMake(0, 0),
                                     textString);
    
    // Create a color that will be added as an attribute to the attrString.
    // 字体颜色设置.
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 12), kCTForegroundColorAttributeName, [UIColor redColor].CGColor);
    // 大小设置
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 12), kCTFontAttributeName, (__bridge CFTypeRef)([UIFont boldSystemFontOfSize:18]));
    
    //  下划线设置
    /***
     kCTUnderlineStyleNone           = 0x00,
     kCTUnderlineStyleSingle         = 0x01,
     kCTUnderlineStyleThick          = 0x02,
     kCTUnderlineStyleDouble         = 0x09
     ****/
    CFAttributedStringSetAttribute(attrString, CFRangeMake(12, 24), kCTUnderlineColorAttributeName, [UIColor greenColor].CGColor);
    CFAttributedStringSetAttribute(attrString, CFRangeMake(12, 24), kCTUnderlineStyleAttributeName, (__bridge CFTypeRef)[NSNumber numberWithInt:kCTUnderlineStyleSingle]);    
    // 字与字水平垂直间距调整
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 12), kCTKernAttributeName, (__bridge CFTypeRef)[NSNumber numberWithInt:5]);
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 12), kCTSuperscriptAttributeName, (__bridge CFTypeRef)[NSNumber numberWithInt:5]);
    // 背景颜色设置
    CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 12), kCTBackgroundColorAttributeName, [UIColor grayColor].CGColor);
    
    // Create the framesetter with the attributed string.
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString(attrString);
    CFRelease(attrString);
    
    // Create a frame.
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, 0), path, NULL);
    
    // Draw the specified frame in the given context.
    CTFrameDraw(frame, context);
    
    // Release the objects we used.
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);

}


@end
