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

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + BNRItemStore sharedStore" userInfo:nil];
    return nil;
}

-(instancetype) initPrivate{
    self = [super init];
    
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}


-(BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return  item;
}




@end


