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

@implementation YCTestObj
- (void)runTest {
//	[self complexity];
	[self singlyLinkedListTest];
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
@end