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

// 指定table cell的数量
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allTtems] count] + 1;
}

// 指定table cell展示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                     forIndexPath:indexPath];
    NSInteger count = [[[BNRItemStore sharedStore] allTtems] count];
    
    // 这个if分支为了处理最后添加上去的一行
    if(indexPath.row == count){
        NSLog(@"reach the end of the table!");
        cell.textLabel.text = @"No more items";
    }else{
        NSArray *items = [[BNRItemStore sharedStore] allTtems];
        BNRItem *item = items[indexPath.row];
        
        cell.textLabel.text = [item description];
        
        // 设置字体
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:20.0];
        cell.textLabel.font = newFont;

    }
    
    // 打印各个cell的高度
    CGFloat f = cell.frame.size.height;
    NSLog(@"print the height of the cell: %f",f);
    
    return cell;
    
}


// 定制tableViewCell的高度  Chap8 Gold Challenge
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [[[BNRItemStore sharedStore] allTtems] count];
   
    if(indexPath.row < count ){
        return 60;
    }else{
        return 44;
    }
}


// view加载的时候，为tableview注册一个重用的ID
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end

