//
//  Details.m
//  InovaTask
//
//  Created by Admin on 5/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "Details.h"

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.albumTitle.text = _album.albumTitle;

    NSString *baseUrl= _album.coverPhoto;
    NSString *posterUrl= [baseUrl stringByAppendingString:[_album coverPhoto]];
    [_cover sd_setImageWithURL:[NSURL URLWithString:posterUrl]];
    
    
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
