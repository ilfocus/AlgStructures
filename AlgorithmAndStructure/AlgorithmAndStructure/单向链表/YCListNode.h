//
//  YCListNode.h
//  AlgorithmAndStructure
//
//  Created by WangQi on 2019/10/18.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCListNode : NSObject
@property (nonatomic, assign) int size; // 链表节点数目

/**
 1、新增某个元素
 */
- (void)addElement:(id)element;
/**
2、某个index下新增元素
*/
- (void)addElement:(id)element index:(int)index;
/**
3、移除某个index
*/
- (id)removeIndex:(int)index;
/**
4、 移除某个元素
*/
- (id)removeElement:(id)element;
/**
5、由元素查找下标
*/
- (int)indexOfElement:(id)element;
/**
6、 清空数据
*/
- (void)clear;
/**
7、 链表长度
*/
- (int)size;
/**
8、是否为空
*/
- (BOOL)isEmpty;
/**
9、 是否包含某个元素
*/
- (BOOL)isContainElement:(id)element;
/**
10、  根据下标查找某元素
*/
- (id)findElementByIndex:(int)index;
/**
 11、反转链表
*/
- (YCListNode *)reverseListNode:(YCListNode *)head;
/**
 12、  根据下标查找某个节点
 */
- (YCListNode *)findNodeByIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
