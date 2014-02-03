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
//    [yourRLSimpleBarGraph setAchievementAt:5.0 setAchievedColor:[UIColor blueColor] andNotAchievedColor:[UIColor lightGrayColor]];
 
    
    [yourRLSimpleBarGraph  alternateColors:@[[UIColor grayColor],[UIColor blackColor],[UIColor purpleColor]]];
    //    yourRLSimpleBarGraph.showScale = NO; //for no scale guides
    //    yourRLSimpleBarGraph.numOfScales = 3 //number of guides, default 5
    yourRLSimpleBarGraph.scalePrecision = 1; //0 for no precision, 1 for 1.0, 2 for 2.00, 3 for 3.000
    yourRLSimpleBarGraph.itemsPerPage = 4;
//    yourRLSimpleBarGraph.fixedBarWidth = 21;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
