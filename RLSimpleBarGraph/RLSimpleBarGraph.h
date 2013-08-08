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

///paging
//    BOOL pagingOn;
//    NSInteger currentPage;
//    NSInteger itemsPerPage;
    
    //labels and views
    NSArray *barViews;
    NSArray *scaleViews;
    
    //achievement coloring
    NSNumber *achievementNumber;
    UIColor *achievedColor;
    UIColor *notAchievedColor;
    NSString *achievedImage;
    NSString *notAchievedImage;

}
//settings
@property (nonatomic, assign) BOOL showScale;
@property (nonatomic, strong) NSNumber *barMax;
@property (nonatomic, assign) NSInteger scalePrecision;



-(void)basicInit:(NSArray *)basicArray;
//-(void)setMin: (double)minNum andMax: (double)maxNum;
-(void)setAchievementAt: (double) theAchievementNumber setAchievedColor: (UIColor *)aColor andNotAchievedColor: (UIColor *)notColor;



@end
