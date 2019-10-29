//
//  YCArrayList.h
//  AlgorithmAndStructure
//
//  Created by WangQi on 2019/10/17.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/** 模拟动态数组的内部实现:
	1、 基于Array的操作
	2、扩容1.5倍
	3、降容1.5倍
 */
@interface YCArrayList : NSObject
@property (nonatomic, assign) int size;/**数组 Size*/
@property (nonatomic, assign) int capacity;/**数组的内存大小*/
@property (nonatomic, strong) NSMutableArray *array;/**数组*/

/**
 1、清空数据
 */
- (void)clear;
/**
 2、数组大小
 */
- (int)size;
/**
 3、数组是否为空
 */
- (BOOL)isEmpty;
/**
 4、 是否包含某个元素
*/
- (BOOL)isContainElement:(id)element;
/**
 5、根据下标查找某个元素
*/
- (id)findElementByIndex:(int)index;
/**
 6、根据下标设置某个元素，返回 旧的元素
*/
- (id)setElementByIndex:(int)index Element:(id)element;
/**
 7、新增某个元素
*/
- (void)addElement:(id)element;
/**
 8、 新增某个index下元素
*/
- (void)addElement:(id)element Index:(int)index;
/**
 9、 移除index
*/
- (id)removeIndex:(int)index;
/**
 10、移除元素
*/
- (id)removeElement:(id)element;
/**
 11、根据元素查找下标
*/
- (int)indexOfByElement:(id)element;
@end

NS_ASSUME_NONNULL_END
