//
//  YCSort.m
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/10/30.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCSort.h"
/*
 算法之排序
 排序之基本排序算法
	 选择排序
	 插入排序
	 冒泡排序
 排序之高效排序算法
	 桶排序
	 希尔排序
	 快速排序
	 堆排序
 牺牲空间节约时间的高效排序
	 归并排序（Merge Sort）
	 基数排序（非比较排序）
	 计数排序（非比较排序）
 */
@implementation YCSort
#pragma mark - 值交换
+ (void)swap:(int)fValue s:(int)sValue {

}
#pragma mark - 冒泡排序
+ (void)bubbleSort:(NSArray *)array {
	NSMutableArray *tempArray = array.mutableCopy;
	int length = (int)tempArray.count;
	for (int i = 0; i < length - 1; i++) {
		for (int j = 0; j < (length - 1) - i; j++) {
			if ([tempArray[j] intValue] > [tempArray[j + 1] intValue]) {
				id temp = tempArray[j];
				tempArray[j] = tempArray[j + 1];
				tempArray[j + 1] = temp;
			}
		}
	}
	NSLog(@"冒泡排序后的数组值：%@",tempArray);
}
#pragma mark - 选择排序
+ (void)selectSort:(NSArray *)array {
	NSMutableArray *tempArray = array.mutableCopy;
	int length = (int)tempArray.count;
	for (int i = 0; i < length - 1; i++) {
		// 找到i后面所有数据中的最小值
		int minIndex = i;
		for (int j = i + 1; j < length; j++) {
			if ([tempArray[j] intValue] < [tempArray[minIndex] intValue]) {
				minIndex = j;
			}
		}
		// 交换i位置与最小值的数据
		id temp = tempArray[minIndex];
		tempArray[minIndex] = tempArray[i];
		tempArray[i] = temp;
	}
	NSLog(@"选择排序后的数组值：%@",tempArray);
}
#pragma mark - 插入排序
+ (void)insertSort:(NSArray *)array {
	NSMutableArray *tempArray = array.mutableCopy;
	int length = (int)tempArray.count;
	// 初始tempArray[0]为已经排序好的队列
	for (int i = 1; i < length; i++) {
		int x = [tempArray[i] intValue]; // 待插入的元素
		int j = i - 1; // 从待插入元素前一个元素开始比较
		while (j >= 0 && [tempArray[j] intValue] > x) {
			tempArray[j + 1] = tempArray[j]; // 值后移
			j--;
		}
		tempArray[j + 1] = @(x);// 把数据插入到比较的地方
	}
	NSLog(@"插入排序后的数组值：%@",tempArray);
}
#pragma mark - 希尔排序
#pragma mark - 快速排序
+ (void)quickSort:(NSMutableArray *)m low:(int)low high:(int)high {
	if (low >= high) {
		return;
	}
	int i = low;
	int j = high;
	id key = m[i];
	while (i < j) {
		while (i < j && [m[j] intValue] >= [key intValue]) {
			j--;
		}
		if (i == j) { // 当key是目前最小时，会出现i==j的情况
			break;
		}
		m[i++] = m[j];
		while (i < j && [m[i] intValue] <= [key intValue]) {
			i++;
		}
		if (i == j) break; // 当key是目前最大的数时(m[j]的前面)，会出现i=j的情况
		m[j--] = m[i];
	}
	m[i] = key;
	[self quickSort:m low:low high:i - 1];
	[self quickSort:m low:i + 1 high:high];
	NSLog(@"快速排序后的数组值：%@",m);
}
@end

