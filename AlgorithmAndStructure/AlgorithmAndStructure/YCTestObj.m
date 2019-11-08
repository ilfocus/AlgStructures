//
//  YCTestObj.m
//  AlgorithmAndStructure
//
//  Created by WangQi on 2019/10/17.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCTestObj.h"
#import "CWTimeTool.h"
#import "CWFibObject.h"
#import "YCListNode.h"
#import "YCBothListNode.h"
#import "YCSort.h"
#include "sort.h"

@implementation YCTestObj
- (void)runTest {
//	[self complexity];
//	[self singlyLinkedListTest];
//	[self bothLinkedListTest];
	[self sort];
}
#pragma mark - 复杂度
- (void)complexity {
	CWTimeTool *time = [[CWTimeTool alloc] init];
	[time executeTimesForFunction:^{
		int j = 0;
		for (int i = 0; i < 2000000000; i ++) {
			j++;
		}
	}];
	// 2、斐波那契函数,当递归求第50个斐波那契数列时，需要69.37s
	// 时间复杂度为2+4+8+16=O(2^n)
	CWFibObject *fib = [[CWFibObject alloc] init];
	[time executeTimesForFunction:^{
		NSLog(@"%d",[fib fib_recursive:45]);
	}];
	// 优化的方法，只需要0.00s
	// 时间复杂度O(n)
	[time executeTimesForFunction:^{
		NSLog(@"%d",[fib fib_good:45]);
	}];
			
}
#pragma mark - 动态数组
#pragma mark - 单向链表
- (void)singlyLinkedListTest {
	// 创建链表并添加元素
	YCListNode *node = [[YCListNode alloc] init];
	[node addElement:@"1"];
	[node addElement:@"3"];
	[node addElement:@"4"];
	[node addElement:@"7"];
	[node addElement:@"11"];
	[node addElement:@"18"];
	[node addElement:@"2" index:1];
	if ([node isContainElement:@"3"]) {
		int index = [node indexOfElement:@"3"];
		NSLog(@"element:%d,%@",index,[node findElementByIndex:index]);
	}
	NSLog(@"ListNode1:%@",[node description]);
	YCListNode *reverseNode = [node reverseListNode:node];
	NSLog(@"ListNode2:%@",[reverseNode description]);
}
#pragma mark - 双向链表
- (void)bothLinkedListTest {
	YCBothListNode *node = [[YCBothListNode alloc] init];
	for (int i = 0; i < 6; i ++) {
		[node cw_addE:[NSString stringWithFormat:@"%d",i]];
	}
		// 0、1、2、3、4、5、6
	[node cw_addE:@"6"];
	NSLog(@"%@",node);
		// 0、1、2、8、3、4、5、6
	[node cw_addE:@"8" index:2];
	NSLog(@"%@",node);
		// 10、0、1、2、8、3、4、5、6
	[node cw_addE:@"10" index:0];
	NSLog(@"%@",node);
		// 10、0、1、2、8、3、4、5、6、20
	[node cw_addE:@"20" index:9];
	NSLog(@"%@",node);
}
#pragma mark - 算法
#pragma mark - 排序算法
- (void)sort {
	NSArray *array = @[@(10),@(9),@(56),@(19),@(28),@(37),@(34)];
	[YCSort bubbleSort:array];
	[YCSort selectSort:array];
	[YCSort insertSort:array];
	[YCSort quickSort:array.mutableCopy low:0 high:(int)array.count - 1];

	int a[7] = {10,9,56,19,28,37,34};
//	quick_sort(a, 0, 6);
//	for (int i = 0; i < 7; ++i) {
//			printf("%d,", a[i]);
//	}
//	printf("\n");
	heapSortTest();
}
@end
		
