//
//  PosHomeCollectionViewCell.m
//  YGJPos
//
//  Created by mac on 17/1/9.
//  Copyright © 2017年 HD. All rights reserved.
//

#import "YMHomeCollectionViewCell.h"
#import "UIColor+PosColor.h"
@interface YMHomeCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
@implementation YMHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.label.textColor = [UIColor colorWithHexString:@"#4A4A4A" alpha:1];
}

-(void)setupWithImageName:(NSString*)imageName title:(NSString*)title{
    
    [self.imageView setImage:[UIImage imageNamed:imageName]];
    
    self.label.text = title;
    }

@end
