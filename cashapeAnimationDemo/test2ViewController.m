//
//  test2ViewController.m
//  cashapeAnimationDemo
//
//  Created by admin on 2017/9/18.
//  Copyright © 2017年 RZHL. All rights reserved.
//

#import "test2ViewController.h"

@interface test2ViewController ()

@end

@implementation test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    
    [self test2];
    
    [self test3];
    // Do any additional setup after loading the view.
}


- (void)test1 {
    
    UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 50, 50)];
    lineView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:lineView];
    
// 已x, y ,z 轴为中心轴 旋转
    
    CABasicAnimation  *lineAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    lineAnimation.duration = 1.f;
    lineAnimation.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]  ;
    lineAnimation.beginTime = 0.0;
    //    lineAnimation.autoreverses = NO;
    lineAnimation.fromValue =  @(M_PI_2);
    lineAnimation.toValue  = @(-M_PI_2);
    
    lineAnimation.repeatCount = HUGE_VALF ;
    
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    positionAnima.fromValue = @(M_PI_2);
    positionAnima.toValue =  @(-M_PI_2);
    
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = HUGE_VALF ;

    
    //    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    //    transformAnima.fromValue = @(0);
    //    transformAnima.toValue = @(M_PI);
    //    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 2.0f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = YES;
    animaGroup.animations = @[positionAnima,lineAnimation];
    
    //    [self.imageView.layer addAnimation:animaGroup forKey:@"Animation"];
    
    [lineView.layer addAnimation:animaGroup forKey:@"lineAnimation"];
}


- (void)test2 {
    
    UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(200, 30, 50, 50)];
    lineView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:lineView];
    
    
    CABasicAnimation  *positionAnima = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnima.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100) ];
    positionAnima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200) ]; ;
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.duration = 3.0f;
    
//    [lineView.layer addAnimation:positionAnima forKey:@"positionAnima"];
    CABasicAnimation  *scaleAnimX = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimX.fromValue = @(0.2);
    scaleAnimX.toValue = @(1.4) ;
    scaleAnimX.duration = 2 ;
    scaleAnimX.autoreverses = true ;
    scaleAnimX.repeatCount = HUGE_VALF ;
    
    CAAnimationGroup  *aniGroup = [CAAnimationGroup animation];
    aniGroup.duration = 2.0f ;
    aniGroup.fillMode = kCAFillModeBackwards;
    aniGroup.removedOnCompletion = YES ;
    aniGroup.animations = @[positionAnima,scaleAnimX];
    [lineView.layer addAnimation:aniGroup forKey:@"aniGroup"];
    
    
    
    
    
}


- (void)test3 {
    UIView  *lineView = [[UIView alloc]initWithFrame:CGRectMake(50, 130, 100, 50)];
    lineView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:lineView];
    UIView *animView = [[UIView alloc]initWithFrame:CGRectMake(50, 155, 10, 10)];
    animView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:animView];
    
    
    UIBezierPath  *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 50)];
    UIBezierPath  *bezier1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50,130, 100, 50)];
    
    CAShapeLayer  *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor ;
    shapeLayer.fillColor =  [UIColor redColor].CGColor ;
    shapeLayer.lineWidth = 0.5 ;
    shapeLayer.lineJoin = kCALineJoinRound ;
    shapeLayer.lineCap = kCALineCapRound ;
    shapeLayer.path = bezier.CGPath ;

    
    [lineView.layer addSublayer:shapeLayer];
    CAKeyframeAnimation  *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAni .duration = 3.0f ;
    keyAni.path = bezier1.CGPath ;
    keyAni.calculationMode = kCAAnimationPaced ;
    keyAni.fillMode = kCAFillModeBackwards;
    keyAni.rotationMode = kCAAnimationRotateAutoReverse;
    
    [animView.layer addAnimation:keyAni forKey:@"keyAni"];
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
