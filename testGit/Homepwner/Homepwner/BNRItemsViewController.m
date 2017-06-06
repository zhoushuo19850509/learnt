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
        for( int i = 0; i < 50 ; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype) initWithStyle: (UITableViewStyle)style
{
    return [self init];
}

// 指定table cell的数量
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allTtems] count];
}

// 指定table cell展示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                     forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore] allTtems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    return cell;
    
}

// view加载的时候，为tableview注册一个重用的ID
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end

