//
//  BNRItemStore.h
//  Homepwner
//
//  Created by  athena on 2017/6/5.
//  Copyright © 2017年 athena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allTtems;
@property (nonatomic, readonly) NSArray *smallTtems;
@property (nonatomic, readonly) NSArray *largeTtems;

+ (instancetype) sharedStore;
- (BNRItem *) createItem;

@end

