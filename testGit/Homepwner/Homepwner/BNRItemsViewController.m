//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by  athena on 2017/6/5.
//  Copyright © 2017年 athena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"


@implementation BNRItemsViewController

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        for( int i = 0; i < 5 ; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype) initWithStyle: (UITableViewStyle)style
{
    return [self init];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allTtems] count];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
*/
@end

