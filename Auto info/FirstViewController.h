//
//  FirstViewController.h
//  Auto info
//
//  Created by Wesley de Groot on 12-04-15.
//  Copyright (c) 2015 WDGWV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *tvC;
    
    IBOutlet UILabel *lblTitle;
}

@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) NSArray *ident;
@property (nonatomic, strong) NSDictionary *translate;

@end


//
// Cell.
//

@interface cell : UITableViewCell
{
    IBOutlet UILabel *lblInfo;
    IBOutlet UILabel *lblText;
}

@end
