//
//  ListOfArtests.m
//  InovaTask
//
//  Created by Admin on 5/17/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ListOfArtests.h"
#import "Details.h"

@interface ListOfArtests ()

@end

@implementation ListOfArtests
- (void)viewWillAppear:(BOOL)animated{
    
    _response = [NSMutableData data];
    _albums = [NSMutableArray new];
    _artest = [NSMutableArray array];
    
    // to get the complete path of url i followed the next structure
    // https://jsonblob.com/api/jsonBlob/<blobId>
    //blobId is cfb0aab5-59be-11e8-a68f-cd6dbb6137ea from the link attached

    NSString  *urlString = @"https://jsonblob.com/api/jsonBlob/cfb0aab5-59be-11e8-a68f-cd6dbb6137ea";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *req =[NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:req delegate:self];
    [conn start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.response options:NSJSONReadingMutableLeaves error:&myError];
    
    NSMutableArray *values = [res objectForKey:@"results"];
    for (int n=0 ;n<[values count];n++){
        id value = [values objectAtIndex:n];
        theAlbum=[Album new];
        
        id  artestName = [value objectForKey:@"artist_name"];
        NSLog(@"%@",artestName);
        theAlbum.artestName=artestName;
        [_artest addObject:artestName];
        
        id  albumTitle = [value objectForKey:@"album_title"];
        NSLog(@"%@",albumTitle);
        theAlbum.albumTitle=albumTitle;
        id  albumPhoto = [value objectForKey:@"cover_art"];
        NSLog(@"%@",albumTitle);
        theAlbum.coverPhoto = albumPhoto;
        
        [_albums addObject:theAlbum];
      
    }
    
    [self.tableView reloadData];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.response appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.response setLength:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if ([_artest count]>0) {
        return [_artest count];
    }
    else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // show the album artest on table view
    cell.textLabel.text = _artest[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Details *details = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    [details setAlbum:theAlbum];
    [self.navigationController pushViewController:details animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
