//
//  YCListNode.m
//  AlgorithmAndStructure
//
//  Created by WangQi on 2019/10/18.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCListNode.h"

@interface YCListNode () {
	id element;
	YCListNode *next;
	YCListNode *_first;
}
@end

@implementation YCListNode
/**
 0、初始化Node节点
 */
- (instancetype)init {
	self = [super init];
	if (self) {
		self.size = 0;
		self->_first = nil;
	}
	return self;
}
- (YCListNode *)private_initListNodeNext:(YCListNode *)next element:(id)element {
	YCListNode *node = [[YCListNode alloc] init];
	node->next = next;
	node->element = element;
	return node;
}
/**
 1、新增某个元素
 */
- (void)addElement:(id)element; {
	[self addElement:element index:self.size];
}
/**
2、某个index下新增元素
*/
- (void)addElement:(id)element index:(int)index; {
	if (element == nil) {
		NSLog(@"error: node can't nil!");
		return;
	}
	[self private_addThrowException:index];
	if (index == 0) {
		self->_first = [self private_initListNodeNext:_first element:element];
	} else {
		// 添加节点
		YCListNode *prevNode = [self findNodeByIndex:index - 1];
		YCListNode *insertNode = [self private_initListNodeNext:prevNode->next element:element];
		prevNode->next = insertNode;
	}
	self.size++;
}
/**
 3、移除某个index ，返回移除的元素
*/
- (id)removeIndex:(int)index; {
	[self private_throwException:index];
	
	//YCListNode *node = [self findElementByIndex:index];
	YCListNode *node;
	id element;
	if (index == 0) {
		node = [self findNodeByIndex:index];
		self->_first = node->next;
		element = node->element;
	} else {
		// 获取前一个节点
		node = [self findNodeByIndex:index - 1];
		element = node->next->element;
		node->next = node->next->next;
	}
	self.size--;
	return element;
}
/**
4、 移除某个元素
*/
- (id)removeElement:(id)element; {
	int index = [self indexOfElement:element];
	[self private_throwException:index];
	return [self removeIndex:index];
}
/**
5、由元素查找下标
*/
- (int)indexOfElement:(id)element; {
	if (!element) {
		return -1;
	}
	int index = 0;
	YCListNode *node = self->_first;
	while (node != nil) {
		if ([node->element isEqual:element]) {
			return index;
		}
		node = node->next;
		index++;
	}
	return -1;
}
/**
6、 清空数据
*/
- (void)clear; {
	self.size = 0;
	self->_first = nil;
}
/**
7、 链表长度
*/
- (int)size; {
	return _size;
}
/**
8、是否为空
*/
- (BOOL)isEmpty; {
	return self.size == 0;
}
/**
9、 是否包含某个元素
*/
- (BOOL)isContainElement:(id)element; {
	return [self indexOfElement:element] != -1;
}
/**
10、  根据下标查找某元素
*/
- (id)findElementByIndex:(int)index; {
	[self private_throwException:index];
	YCListNode *node = self->_first;
	while (index) {
		node = node->next;
		index--;
	}
	return node->element;
}
/**
 11、反转链表,有问题,未实现
*/
- (YCListNode *)reverseListNode:(YCListNode *)head; {
	YCListNode *reverseN = NULL;
	YCListNode *node = head->_first;
	while (node != NULL) {
		YCListNode *temp = node->next;
		node->next = reverseN;
		reverseN = node;
		node = temp;
		if (temp == NULL) {
			YCListNode *lastNode = [[YCListNode alloc] init];
			lastNode->next = NULL;
			lastNode->element = @"";
			lastNode->_first = reverseN;
			reverseN = lastNode;
			break;
		}
	}
	reverseN.size = head.size;
	return reverseN;
}
/**
 12、  根据下标查找某个节点
 */
- (YCListNode *)findNodeByIndex:(int)index; {
	[self private_throwException:index];
	YCListNode *node = self->_first;
	while (index) {
		node = node->next;
		index--;
	}
	return node;
}
#pragma mark - 异常处理
/**
 12、异常检测处理
 */
- (void)private_throwException:(int)index
{
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}

/**
 13、添加异常检测处理
 */
- (void)private_addThrowException:(int)index
{
    if (index < 0 || index > self.size) {
        @throw [NSException exceptionWithName:@"listNode out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}
/**
 14、打印链表元素
 */
- (NSString *)description {
    NSString *temp = [NSString stringWithFormat:@"listNode:size-%d,[",self.size];

    YCListNode *node;
    for (int i = 0; i < self.size; i ++) {
        node = [self findNodeByIndex:i];
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%d-%@",i,node->element];
        }else{
            temp = [temp stringByAppendingFormat:@"%d-%@, ",i,node->element];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}
- (void)dealloc {
//    NSLog(@"ListNode-dealloc");
}
@end
