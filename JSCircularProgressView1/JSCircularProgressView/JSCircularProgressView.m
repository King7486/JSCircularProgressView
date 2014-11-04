//
//  JSCircularProgressView.m
//  JSCircularProgressView
//
//  Created by Eric Wang on 14/10/31.
//  Copyright (c) 2014年 LinkMob. All rights reserved.
//

#define DEGREES_2_RADIANS(x) (0.0174532925 * (x))

#import "JSCircularProgressView.h"

@interface JSCircularProgressView ()
{
    float radius;
}

@end

@implementation JSCircularProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        radius = MIN(frame.size.width, frame.size.height) / 2;
        float innerRadius = radius - self.lineWidth;
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(radius - sqrt(2)/2*innerRadius, radius - sqrt(2)/2*innerRadius, sqrt(2)*innerRadius, sqrt(2)*innerRadius)];
        self.label.textColor = self.textColor;
        self.label.font = self.textFont;
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
    }
    return self;
    
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *backCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2)
                                                              radius:radius - self.lineWidth/2
                                                          startAngle:(CGFloat) - M_PI_2
                                                            endAngle:(CGFloat)(1.5 * M_PI)
                                                           clockwise:YES];
    [self.backColor setStroke];
    backCircle.lineWidth = self.lineWidth;
    [backCircle stroke];
    
    UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2)
                                                                  radius:radius - self.lineWidth/2
                                                              startAngle:(CGFloat) - M_PI_2
                                                                endAngle:(CGFloat)(- M_PI_2 + self.progress * 2 *M_PI)
                                                               clockwise:YES];
    [self.progressColor setStroke];
    progressCircle.lineWidth = self.lineWidth;
    [progressCircle stroke];
}

#pragma mark - Property Methods

- (UIColor *)progressColor {
    
    if (!_progressColor) {
        _progressColor = [UIColor whiteColor];
    }
    
    return _progressColor;
}

- (UIColor *)backColor {
    
    if (!_backColor) {
        _backColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3f];
    }
    return _backColor;
}

- (float)lineWidth {
    
    if (!_lineWidth) {
        _lineWidth = 0.2 * radius;
    }
    
    return _lineWidth;
}

- (UIFont *)textFont {
    
    if (!_textFont) {
        _textFont = [UIFont boldSystemFontOfSize:10.0];
    }
    return _textFont;
}

- (UIColor *)textColor {
    
    if (!_textColor) {
        _textColor = [UIColor whiteColor];
    }
    
    return _textColor;
}



- (void)setProgress:(float)progress {
    
    _progress = progress;
    [self setNeedsDisplay];
}



@end
