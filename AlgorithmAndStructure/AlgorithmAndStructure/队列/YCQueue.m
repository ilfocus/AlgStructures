//
//  YCQueue.m
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/11/8.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCQueue.h"

@implementation YCQueue {
	int _n;
	int _head;
	int _tail;
	NSMutableArray *_array;
}
// 初始化
- (instancetype)initWithCapacity:(int)capacity {
	self = [super init];
	if (self) {
		_array = [NSMutableArray arrayWithCapacity:capacity];
		_n = capacity;
	}
	return self;
}
// 入队 并解决队列无空间问题
- (BOOL)enQueue:(id)item {
	if (item == nil) return NO;
	if (_head == 0) { // 真无空间
		return NO;
	}
	if (_tail == _n) {
		/*
		 _head != 0,_tail==_n.
		 说明_head前面有空间，所以要做数据搬移操作
		 */
		for (int i = _head; i < _tail; i++) {
			_array[i - _head] = _array[i];
		}
		_tail -= _head; // 最后点位置前移
		_head = 0; // head位置恢复
	}
	_array[_tail] = item;
	_tail++;
	return YES;
}
// 出队
- (id)deQueue {
	if (_head == _tail) return nil;
	id temp = _array[_head];
	_head++;
	return temp;
}
@end
