//
//  ViewController.h
//  XMLDemo
//
//  Created by openxcell on 7/4/13.
//  Copyright (c) 2013 openxcell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"


@interface ViewController : UIViewController<WebServicesDelegate>
{
    IBOutlet UITableView *tblView;
    NSArray *aryXmlData;
}

@end
