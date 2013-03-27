//
//  UIImage+ImageWithUIView.m
//

#import "UIImage+ImageWithUIView.h"

@implementation UIImage (ImageWithUIView)
#pragma mark -
#pragma mark TakeScreenShot

+ (UIImage *)imageWithUIView:(UIView *)view
{
  CGSize screenShotSize = view.bounds.size;
  UIImage *img = nil;
  UIGraphicsBeginImageContext(screenShotSize);
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  if ([view isKindOfClass: [UIScrollView class]]) {
    UIScrollView *scrollView = (UIScrollView *)view;
    CGContextTranslateCTM(ctx, -scrollView.contentOffset.x, -scrollView.contentOffset.y);
  }

  [view.layer renderInContext: ctx];
  img = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return img;
}
@end
