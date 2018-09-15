//
//  ListOfArtests.h
//  InovaTask
//
//  Created by Admin on 5/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface ListOfArtests : UITableViewController<NSURLConnectionDataDelegate , NSURLConnectionDelegate>
{
    Album *theAlbum;
    
}
@property NSMutableData *response;
@property NSMutableArray *artest;
@property NSMutableArray *albums;

@end
