//
//  RLSimpleBarGraph.h
//  SimpleBarGraph
//
//  Created by Robert Linnemann on 8/7/13.
//  Copyright (c) 2013
//  https://github.com/mevdev/RLSimpleBarGraph
//  MIT LICENSE
//
//  A simple UIView Bar Graph

#import <UIKit/UIKit.h>

@interface RLSimpleBarGraph : UIView
{
    //data
    NSArray *barData; //nsnumbers.
    NSNumber *barMax;
    NSNumber *achievementNumber;
    
    
    //settings
    BOOL showScale;
    NSInteger scalePrecision;

    //paging
    BOOL pagingOn;
    NSInteger currentPage;
    NSInteger itemsPerPage;
    
    //labels and views
    NSArray *barViews;
    NSArray *scaleViews;
    
    //achievement coloring
    UIColor *achievedColor;
    UIColor *notAchievedColor;
    NSString *achievedImage;
    NSString *notAchievedImage;

}



-(void)basicInit:(NSArray *)basicArray;
-(void)setMin: (double)minNum andMax: (double)maxNum;
-(void)setAchievementAt: (double) theAchievementNumber setAchievedColor: (UIColor *)aColor andNotAchievedColor: (UIColor *)notColor;



@end
