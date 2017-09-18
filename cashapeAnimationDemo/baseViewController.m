//
//  baseViewController.m
//  cashapeAnimationDemo
//
//  Created by admin on 2017/9/15.
//  Copyright © 2017年 RZHL. All rights reserved.
//

#import "baseViewController.h"

@interface baseViewController ()
@property (weak, nonatomic) IBOutlet UISlider *moveSlider;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic, strong)   CAShapeLayer  *layer ;
@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test2];
    
//    self.view.
    
    // Do any additional setup after loading the view from its nib.
}



- ( void)test2 {
    
    self.layer = [[CAShapeLayer alloc]init];
    // 填充颜色
     self.layer.fillColor = [UIColor clearColor].CGColor;
    // 绘制颜色
     self.layer.strokeColor = [UIColor greenColor].CGColor;
    
    //线两头的 样式  圆角的 kCALineCapRound ;
     self.layer.lineCap = kCALineJoinBevel;
    
    // 拐角
    self. layer.lineJoin = kCALineJoinMiter;
    
    self. layer.lineWidth = 2;
    self.  layer.frame = CGRectMake(0, 30, 375, 500);
    self. layer.backgroundColor = [UIColor yellowColor].CGColor;
    self. layer.path = [self facepath] .CGPath;
    
    
    
    
    [self.view.layer addSublayer: self.layer];
    
}

- (UIBezierPath *)facepath{
    
    UIBezierPath  *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake( (375 - 200) / 2  , 100, 200, 200)];
    
    return path ;
    
}

- (UIBezierPath *)eyepathWithisleft:(BOOL )isleft {
    
    UIBezierPath  *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 80)];
    [path addQuadCurveToPoint:CGPointMake(80, 80) controlPoint:CGPointMake(65, 70)];
    [path moveToPoint:CGPointMake(50, 80)];
    [path addQuadCurveToPoint:CGPointMake(80, 80) controlPoint:CGPointMake(65, 90)];
    [path moveToPoint:CGPointMake(65, 75)];
    [path addArcWithCenter:CGPointMake(65, 80) radius:5 startAngle:- M_PI *3 / 4  endAngle: M_PI * 2  clockwise:YES];
    
    return path ;
    
}






- (UIBezierPath *)path1 {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //    [path moveToPoint:CGPointMake(20, 100)];
    [path moveToPoint:CGPointMake(0, 0)];
    
    // 给定终点和两个控制点绘制贝塞尔曲线
    [path addQuadCurveToPoint:CGPointMake(120, 50) controlPoint:CGPointMake(69, 500)];
    [path addLineToPoint:CGPointMake(10, 100)];
    
    [path moveToPoint:CGPointMake(50, 50)];
    
    //    [path addLineToPoint:CGPointMake(10, 10)];
    [path addArcWithCenter:CGPointMake(120, 0) radius:30 startAngle:0 endAngle:M_PI clockwise:YES];
    //    [path addCurveToPoint:<#(CGPoint)#> controlPoint1:<#(CGPoint)#> controlPoint2:<#(CGPoint)#>]
    
    return path ;
}


- (UIBezierPath *)path2 {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(20, 100)];
//    [path moveToPoint:CGPointMake(0, 0)];
//    
//    // 给定终点和两个控制点绘制贝塞尔曲线
    [path addQuadCurveToPoint:CGPointMake(120, 50) controlPoint:CGPointMake(69, 500)];
//    [path addLineToPoint:CGPointMake(10, 100)];
//    
//    [path moveToPoint:CGPointMake(50, 50)];
//    
//    //    [path addLineToPoint:CGPointMake(10, 10)];
//    [path addArcWithCenter:CGPointMake(120, 0) radius:30 startAngle:0 endAngle:M_PI clockwise:YES];
    //    [path addCurveToPoint:<#(CGPoint)#> controlPoint1:<#(CGPoint)#> controlPoint2:<#(CGPoint)#>]
    
    return path ;
}




- (IBAction)changsliderValue:(id)sender {
    
    UISlider  *slider = sender ;
    
    self.layer.strokeEnd = slider.value ;

}

- (IBAction)startAnimation:(id)sender {
    
    [self.layer addAnimation:[self pathBasicAnimate] forKey:@"animate"];

}
- (CABasicAnimation *)pathBasicAnimate
{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"path"];
    animate.removedOnCompletion = NO;
    animate.duration = 2;
    animate.fillMode = kCAFillModeForwards;
    animate.toValue = (__bridge id _Nullable)([self eyepathWithisleft:YES].CGPath);
    return animate;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
