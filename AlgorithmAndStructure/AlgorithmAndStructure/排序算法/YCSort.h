//
//  YCSort.h
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/10/30.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCSort : NSObject
+ (void)bubbleSort:(NSArray *)array;
+ (void)selectSort:(NSArray *)array;
+ (void)insertSort:(NSArray *)array;
+ (void)quickSort:(NSMutableArray *)m low:(int)low high:(int)high;
@end

NS_ASSUME_NONNULL_END
