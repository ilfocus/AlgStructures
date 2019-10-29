//
//  YCBothListNode.m
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/10/29.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCBothListNode.h"

@interface YCBothListNode () {
	id ele;                     // 元素
	YCBothListNode *_first;			// 头链表
	YCBothListNode *_last;			// 尾链表
}
@property (nonatomic, strong) YCBothListNode *next;
@property (nonatomic, weak) id prev;
@end

@implementation YCBothListNode

/**
 0、初始化node节点
 */
- (instancetype)init{
	if (self = [super init]) {
		self.size = 0;
		self->_first = nil;
		self->_last = nil;
	}
	return self;
}

- (YCBothListNode *)private_initListNodeNext:(YCBothListNode *)next prev:(YCBothListNode *)prev E:(id)E {
	YCBothListNode *node = [[YCBothListNode alloc] init];
	node.next = next;
	node.prev = prev;
	node->ele = E;
	node->_first = nil;
	node->_last = nil;
	return node;
}
/**
 1、链表新增某元素
 */
- (void)cw_addE:(id)E
{
	[self cw_addE:E index:self.size];
}
/**
 2、链表新增某个index下新增元素
 */
- (void)cw_addE:(id)E index:(int)index
{
	[self private_addThrowException:index];
	// 1、第一个元素和添加最后
	if (index == self.size) {
		YCBothListNode *lastN = self->_last;
		YCBothListNode *currenN = nil;
		// 1-1、第一次添加的元素
		if (lastN == nil) {
			currenN = [self private_initListNodeNext:nil prev:nil E:E];
			self->_first = currenN;
			self->_last = currenN;
		} else {
			currenN = [self private_initListNodeNext:nil prev:lastN E:E];
			lastN.next = currenN;
			self->_last = currenN;
		}
	} else { // 2、往中间位置添加元素（包含头位置）
		YCBothListNode *target = [self cw_getIndex:index];
		YCBothListNode *prevN = target.prev;
		YCBothListNode *newN = [self private_initListNodeNext:target prev:prevN E:E];
		if (prevN == nil) {
			self->_first = newN;
		}else{
			prevN.next = newN;
		}
	}
	self.size++;

}
/**
 3、链表移除index元素
 */
- (id)cw_removeIndex:(int)index {
	[self private_throwException:index];

	YCBothListNode *node = [self cw_getIndex:index];
	YCBothListNode *nextN = node.next;
	YCBothListNode *prevN = node.prev;

	// 删除第一个元素
	if (prevN == nil) {
		self->_first = nextN;
	} else {
		prevN.next = nextN;
	}

	// 删除最后一个元素
	if (nextN == nil) {
		self->_last = prevN;
	} else {
		nextN.prev = prevN;
	}
	self.size--;
	return node->ele;
}
/**
 4、链表移除index元素
 */
- (id)cw_removeE:(id)E
{
	int index = [self cw_indexOf:E];
	return [self cw_removeIndex:index];
}
/**
 5、链表根据元素查找下标
 */
- (int)cw_indexOf:(id)E {
	int index = 0;
	YCBothListNode *node = self->_first;
	while (node != nil) {
		if ([node->ele isEqual:E]) {
			return index;
		}
		node = node.next;
		index++;
	}
	return -1;
}
/**
 6、清空链表数据
 */
- (void)cw_clear {
	self.size = 0;
	// iOS开发的内存优化处理
	YCBothListNode *node = self->_last;
	self->_first = nil;
	self->_last = nil;
	while (node != nil) {
		node.next = nil;
		node = node.prev;
	}
}
/**
 7、链表的大小
 */
- (int)cw_size
{
	return self.size;
}
/**
 8、链表是否为空
 */
- (BOOL)cw_isEmpty
{
	return self.size == 0;
}
/**
 9、是否包含某元素
 */
- (BOOL)cw_isContainE:(id)E
{
	return [self cw_indexOf:E] != -1;
}
/**
 10、根据下标查找某元素
 */
- (id)cw_getIndex:(int)index {
	[self private_addThrowException:index];
	YCBothListNode *node = nil; // index处于前半部分
	if (index <= self.size / 2) { // 或者self.size >> 1
		node = self->_first;
		for (int i = 0; i < index; i++) {
			node = node.next;
		}
	} else if (index > self.size / 2){ // index处于后半部分
		node = self->_last;
		for (int i = self.size - 1; i > index; i--) {
			node = node.prev;
		}
	}
	return node;
}
/**
 11、异常检测处理
 */
- (void)private_throwException:(int)index
{
	if (index < 0 || index >= self.size) {
		@throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
	}
}
/**
 12、添加异常检测处理
 */
- (void)private_addThrowException:(int)index {
	if (index < 0 || index > self.size) {
		@throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
	}
}

/**
 13、打印链表元素
 */
- (NSString *)description
{
	NSString *temp = [NSString stringWithFormat:@"listNode:["];
	YCBothListNode *node = self->_first;;
	for (int i = 0; i < self.size; i ++) {

		if (i == self.size -1) {
			temp = [temp stringByAppendingFormat:@"%@",node->ele];
		}else{
			temp = [temp stringByAppendingFormat:@"%@->",node->ele];
		}
		node = node.next;

	}
	temp = [temp stringByAppendingString:@"]"];
	return temp;
}
@end
