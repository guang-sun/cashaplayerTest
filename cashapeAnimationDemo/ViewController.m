//
//  ViewController.m
//  cashapeAnimationDemo
//
//  Created by admin on 2017/9/15.
//  Copyright © 2017年 RZHL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    
    [self test2];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)test1 {
    
    // 四边形
//    UIBezierPath   *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
   
    // 四边形圆角
//    UIBezierPath   *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:10.0f];

    // 圆形
//    UIBezierPath   *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    //画 圆弧 3点钟方向是开始 顺时针  clockwise这个属性设置是否顺时针，若为YES，则顺时针绘制。
    

    
    UIBezierPath   *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:30.0f startAngle:0 endAngle:M_PI_2 * 3 clockwise:YES];

    
    CAShapeLayer  *layer = [[CAShapeLayer alloc]init];
    // 填充颜色
    layer.fillColor = [UIColor clearColor].CGColor;
    // 绘制颜色
    layer.strokeColor = [UIColor greenColor].CGColor;
    
    //线两头的 样式  圆角的 kCALineCapRound ;
    layer.lineCap = kCALineJoinBevel;
    
    // 拐角
    layer.lineJoin = kCALineJoinMiter;
    
    layer.lineWidth = 4;
    layer.frame = CGRectMake(20, 30, 120, 111);
    layer.path = path .CGPath;
    
    [self.view.layer addSublayer:layer];

}


- ( void)test2 {
    
    CAShapeLayer  *layer = [[CAShapeLayer alloc]init];
    // 填充颜色
    layer.fillColor = [UIColor clearColor].CGColor;
    // 绘制颜色
    layer.strokeColor = [UIColor greenColor].CGColor;
    
    //线两头的 样式  圆角的 kCALineCapRound ;
    layer.lineCap = kCALineJoinBevel;
    
    // 拐角
    layer.lineJoin = kCALineJoinMiter;
    
    layer.lineWidth = 4;
    layer.frame = CGRectMake(200, 30, 120, 111);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.path = [self path1] .CGPath;
    
    
  https://github.com/guang-sun/cashaplayerTest.git
    
    [self.view.layer addSublayer:layer];
    
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

    return path ;
}

///**
// * 如果当前有正在绘制的子路径, 该方法则会隐式的结束当前路径,
// * 并将 currentPoint 设置为指定点. 当上一条子路径被终止, 该方法
// * 实际上并不会去闭合上一条子路径. 所以上一条自路径的起始点 和
// * 结束点并没有被链接.
// * 对于大多数构造路径相关的方法而言, 在你绘制直线或曲线之前, 需要先调用这个方法.
// * @param point:   当前坐标系统中的某一点
// */
//- (void)moveToPoint:(CGPoint)point;
//
///**
// * 该方法将会从 currentPoint 到 指定点 链接一条直线.
// * Note: 在追加完这条直线后, 该方法将会更新 currentPoint 为 指定点
// *       调用该方法之前, 你必须先设置 currentPoint. 如果当前绘制路径
// *       为空, 并且未设置 currentPoint, 那么调用该方法将不会产生任何
// *       效果.
// * @param point:   绘制直线的终点坐标, 当前坐标系统中的某一点
// */
//- (void)addLineToPoint:(CGPoint)point;
//
///**
// * 该方法将会从 currentPoint 添加一条指定的圆弧.
// * 该方法的介绍和构造方法中的一样. 请前往上文查看
// * @param center: 圆心
// * @param radius: 半径
// * @param startAngle: 起始角度
// * @param endAngle: 结束角度
// * @param clockwise: 是否顺时针绘制
// */
//- (void)addArcWithCenter:(CGPoint)center
//                  radius:(CGFloat)radius
//              startAngle:(CGFloat)startAngle
//                endAngle:(CGFloat)endAngle
//               clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);
//



//- (void)startAnimate
//{
//    [self.layer addAnimation:[self pathBasicAnimate] forKey:@"animate"];
//}
//
//- (CABasicAnimation *)pathBasicAnimate
//{
//    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"path"];
//    animate.removedOnCompletion = NO;
//    animate.duration = 2;
//    animate.fillMode = kCAFillModeForwards;
//    animate.toValue = (__bridge id _Nullable)([self classTwoBezierPath].CGPath);
//    return animate;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
