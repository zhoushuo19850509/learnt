//
//  BNRItem.m
//  Homepwner
//
//  Created by  athena on 2017/6/5.
//  Copyright © 2017年 athena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"


@implementation BNRItem

-(void)setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *)itemName
{
    return _itemName;
}

-(void)setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *)serialNumber
{
    return _serialNumber;
}

-(void)setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int)valueInDollars
{
    return _valueInDollars;
}

-(NSDate *)dateCreated
{
    return _dateCreated;
}

- (instancetype) initWithItemName:(NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber
{
    self = [super init];
    if(self){
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (NSString *) description
{
    return [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@  ",
            self.itemName,
            self.serialNumber,
            self.valueInDollars,
            self.dateCreated ];
}


+(instancetype) randomItem
{
    NSArray *randomAdjectiveList = @[@"Fluffy",@"Rusty",@"Shiny"];
    NSArray *randomNounList = @[@"Bear",@"Spork",@"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    
    NSString *randomItemName = [NSString stringWithFormat:@"%@ %@" , [randomAdjectiveList objectAtIndex:adjectiveIndex],[randomNounList objectAtIndex:nounIndex]];
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0'+arc4random() % 10,
                                    'A'+arc4random() % 26,
                                    '0'+arc4random() % 10,
                                    'A'+arc4random() % 26,
                                    '0'+arc4random() % 10];
    int randomValue = arc4random() % 100;
    
    BNRItem *newItem = [[BNRItem alloc] initWithItemName:randomItemName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

@end


