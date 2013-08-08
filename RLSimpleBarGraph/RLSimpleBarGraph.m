//
//  Created by Robert Linnemann on 8/7/13.
//  SimpleBarGraph
//
//  Created by Robert Linnemann on 8/7/13.
//  Copyright (c) 2013
//  https://github.com/mevdev/RLSimpleBarGraph
//  MIT LICENSE

#import "RLSimpleBarGraph.h"

@implementation RLSimpleBarGraph

@synthesize showScale,barMax,scalePrecision;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self actualInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        // init code
        [self actualInit];
    }
    return self;
}

-(void)basicInit:(NSArray *)basicArray{
    barData = basicArray;
}

-(void)actualInit {
    /// ALL temporary data for testing
    if(barData == nil){
        barData = @[@1,@2,@4,@6,@8,@10,@3,@5]; //demo data
    }
    showScale = YES;
    scalePrecision = 0;
    showScale = YES;
}

-(void)layoutSubviews {
    
    NSInteger scales = 5;
    NSInteger pixelPadding = 4;
    NSInteger fontPoint = 12;
    //do it!
    //kick it!
    
    if([barData count] > 0){
    //build bars
        //check bar max, if none, calculate it.
        if(barMax == nil) barMax = [barData valueForKeyPath:@"@max.doubleValue"];
        NSMutableArray *tmpBarsArr = [[NSMutableArray alloc] init];
        
        NSInteger barY = self.bounds.size.height * 0.9; //bottom of bar
        NSInteger graphWidth = self.bounds.size.width * 0.8;
        NSInteger graphHeight = self.bounds.size.height * 0.8;
        NSInteger barX = self.bounds.size.width * 0.15;
        NSInteger barWidth = graphWidth / [barData count] - (pixelPadding);
        
        NSInteger counter = 0;
        
        //calculate how many across and how big. (with const padding)
        for (NSNumber *barNum in barData){
            NSInteger currentBarX = barX + (barWidth * counter);
            NSInteger barHeight = (([barNum doubleValue] / [barMax doubleValue]) * graphHeight);
            
            CGRect aRect = CGRectMake(currentBarX+(pixelPadding * counter), barY - barHeight, barWidth, barHeight);
            UIView *aBar = [[UIView alloc] initWithFrame:aRect];
            if(achievedColor == nil){
                aBar.backgroundColor = [UIColor blackColor];
            } else {
                if([barNum doubleValue] >= [achievementNumber doubleValue]){
                    aBar.backgroundColor = achievedColor;
                } else {
                    aBar.backgroundColor = notAchievedColor;
                }
            }
            
            [self addSubview:aBar];
            [tmpBarsArr addObject:aBar];
            counter++;
        }
    
    
    //build scale
        NSMutableArray *tmpScalesArr = [[NSMutableArray alloc] init];
        for(int i=0;i<scales;i++){
                //beginning x,y
                //x,y for MAX
                //space accordingly.
            NSInteger scaleX = self.bounds.size.width * 0.02;
            NSInteger currentBarY = (barY-12) - (((self.bounds.size.height) / scales) * i);
//            NSInteger barHeight = (( / [barMax doubleValue]) * graphHeight);
            CGRect aRect = CGRectMake(scaleX, currentBarY, 50.0, 20.0);
            UILabel *aScale = [[UILabel alloc] initWithFrame:aRect];
            aScale.font = [UIFont systemFontOfSize:fontPoint];
            aScale.backgroundColor = [UIColor clearColor];
            double scaleValue = 0.0;
            if(i==0){ //bottom
                scaleValue = 0.0;
            } else if (i==(scales-1)) { //MAX
                scaleValue = [barMax doubleValue];
            } else { //normal ones
                scaleValue = [barMax doubleValue] * ((double)i/(double)(scales-1));
            }
            aScale.text = [NSString stringWithFormat:[self getPrecision],scaleValue];
            [self addSubview:aScale];
            [tmpScalesArr addObject:aScale];
        }
        
    //draw bars?
        scaleViews = [[NSArray alloc] initWithArray:tmpScalesArr]; //save this
    }
}


-(NSString *)getPrecision {
    switch (scalePrecision) {
        case 0:
            return @"%.f";
            break;
        case 1:
            return @"%.1f";
            break;
        case 2:
            return @"%.02f";
            break;
        case 3:
            return @"%.03f";
            break;
        default:
            return @"%.f";
            break;
    }
}

-(void)setAchievementAt: (double) theAchievementNumber setAchievedColor: (UIColor *)aColor andNotAchievedColor: (UIColor *)notColor {    
    achievementNumber = [NSNumber numberWithDouble:theAchievementNumber];
    achievedColor = aColor;
    notAchievedColor = notColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
