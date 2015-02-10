//
//  PhotosTableViewController.m
//  PhotoViewer
//
//  Created by Nestor Hernandez on 11/3/14.
//  Copyright (c) 2014 Nestor Hernandez. All rights reserved.
//

#import "PhotosTableViewController.h"

@interface PhotosTableViewController (){
    NSMutableArray *photos;
}

@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Hard Ciders";
    
    //create array
    photos = [[NSMutableArray alloc] init];
    
    Photo *pic = [[Photo alloc] init];
    pic.name = @"Farmhouse Select Cider";
    pic.filename =@"Adam_Barhan_Farmhouse_Select";
    pic.notes = @"The first of the Farmhouse Select Series: Original ’91. It’s a throwback to our early days in cider making. The year was 1991. A winemaker began tinkering with apples in a Proctorsville, Vermont garage. It gave birth to an original American hard cider. Woodchuck Hard Cider.";
    
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Draft Cider Limited Release";
    pic.filename= @"Lynn_F_Draft_Cider_LR";
    pic.notes =@"Limited Release. Made in Vermont.";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Woodchuck Draft Cider: Granny Smith";
    pic.filename= @"Lynn_F_GrannySmith";
    pic.notes =@"It is made using 100% Granny Smith apples. This cider has a mouth-watering flavor that is tangy and tart, with just a touch of sweetness.";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Woodchuck Craft Cider: Oak Aged";
    pic.filename= @"Lynn_F_Oak_Aged";
    pic.notes =@"Woodchuck Draft Cider® Oak Aged is a perfect culmination of Premium French and Traditional American Oak, giving the cider great complexity and broad characteristics that neither style could produce on its own.";
    [photos addObject:pic];
    
    pic = [[Photo alloc] init];
    pic.name = @"Woodchuck Hard Cider";
    pic.filename= @"Woodchuck_Hard_Cider";
    pic.notes =@"Woodchuck Amber Draft Cider was the first style of cider produced under the Woodchuck label. It is made from a blend of apples and fermented with champagne yeast to produce a great tasting and refreshing product. ";
    [photos addObject:pic];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return photos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Photo *current = [photos objectAtIndex:indexPath.row];
    cell.textLabel.text = [current name];
    
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    DisplayViewController *pvc =[segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    //what's the selected cell?
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Photo *c = photos[path.row];
    [pvc setCurrentPhoto:c];
    //or pvc.currentPhoto = c;   doesn't matter
}


@end
