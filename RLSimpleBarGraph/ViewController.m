//
//  ViewController.m
//  RLSimpleBarGraph
//
//  Created by Robert Linnemann on 8/7/13.
//  Copyright (c) 2013
//  https://github.com/mevdev/RLSimpleBarGraph
//  MIT LICENSE
//
//  A simple UIView Bar Graph
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
	// This is the only call you actually need, but it's just a plain black bar graph
    [yourRLSimpleBarGraph basicInit: @[@1,@2,@4,@6,@8,@10,@3,@1,@1,@15,@7]];
    
    //Now whichever bars are over 5.0 are color blue and lower are light gray
    [yourRLSimpleBarGraph setAchievementAt:5.0 setAchievedColor:[UIColor blueColor] andNotAchievedColor:[UIColor lightGrayColor]];
    
//    yourRLSimpleBarGraph.showScale = NO; //for no scale guides
//    yourRLSimpleBarGraph.numOfScales = 3 //number of guides, default 5
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
