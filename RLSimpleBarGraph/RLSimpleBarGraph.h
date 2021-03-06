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
    NSInteger currentPage;
    
    //labels and views
    NSArray *barViews;
    NSArray *scaleViews;
    
    //achievement coloring
    NSNumber *achievementNumber;
    UIColor *achievedColor;
    UIColor *notAchievedColor;
    NSString *achievedImage;
    NSString *notAchievedImage;
    NSArray *alternatingColors;
    

}
//settings
@property (nonatomic, assign) BOOL showScale;
@property (nonatomic, strong) NSNumber *barMax;
@property (nonatomic, assign) NSInteger scalePrecision;
@property (nonatomic, assign) NSInteger numOfScales;
@property (nonatomic, assign) NSInteger itemsPerPage;//if > 0 paging enabled
@property (nonatomic, assign) NSInteger fixedBarWidth;

-(void)addPagingGestures;
-(void)removeGestures;
-(void)pageLeft:(UIGestureRecognizer*)recognizer;
-(void)pageRight:(UIGestureRecognizer*)recognizer;


-(void)basicInit:(NSArray *)basicArray;
-(void) alternateColors: (NSArray *)colorsArray;
//-(void)setMin: (double)minNum andMax: (double)maxNum;
-(void)setAchievementAt: (double) theAchievementNumber setAchievedColor: (UIColor *)aColor andNotAchievedColor: (UIColor *)notColor;



@end
