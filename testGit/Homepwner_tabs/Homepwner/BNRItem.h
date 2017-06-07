//
//  BNRItem.h
//  Homepwner
//
//  Created by  athena on 2017/6/5.
//  Copyright © 2017年 athena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

// variables defined here
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

// getters and setters
-(void)setItemName:(NSString *)str;
- (NSString *)itemName;

-(void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

-(void)setValueInDollars:(int)v;
- (int)valueInDollars;

-(NSDate *)dateCreated;

+(instancetype) randomItem;

@end
