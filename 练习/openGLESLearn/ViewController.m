//
//  ViewController.m
//  openGLESLearn
//
//  Created by Fei Yuan on 2021/3/8.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>
#import "LearnView.h"


@interface ViewController ()

@property (nonatomic , strong) LearnView*   myView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myView = (LearnView *)self.view;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
