//
//  Details.h
//  InovaTask
//
//  Created by Admin on 5/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface Details : UIViewController
@property Album* album;


@property (weak, nonatomic) IBOutlet UILabel *albumTitle;

@property (weak, nonatomic) IBOutlet UIImageView *cover;

@end
