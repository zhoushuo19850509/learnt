//
//  BNRItemStore.m
//  Homepwner
//
//  Created by  athena on 2017/6/5.
//  Copyright © 2017年 athena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItemStore.h"

@interface BNRItemStore ()

// declear
@property (nonatomic) NSMutableArray *privateItems;

@property (nonatomic) NSMutableArray *privateSmallItems;   // 保存不大于$50的items
@property (nonatomic) NSMutableArray *privateLargeItems;    // 保存大于$50的items

@end



@implementation BNRItemStore

+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
        
    }
    return sharedStore;
}

-(NSArray *) allTtems
{
    return self.privateItems;
}

// return items whose valueInDolllars no more than 50
-(NSArray *) smallTtems
{
    return self.privateSmallItems;
}

// return items whose valueInDollars more than 50
-(NSArray *) largeTtems
{
    return self.privateLargeItems;
}



- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + BNRItemStore sharedStore" userInfo:nil];
    return nil;
}

-(instancetype) initPrivate{
    self = [super init];
    
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
        _privateLargeItems = [[NSMutableArray alloc] init];
        _privateSmallItems = [[NSMutableArray alloc] init];
    }
    return self;
}


-(BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    if( item.valueInDollars > 50){
        [self.privateLargeItems addObject:item];
    }else{
        [self.privateSmallItems addObject:item];
    }
    
    return  item;
}




@end


