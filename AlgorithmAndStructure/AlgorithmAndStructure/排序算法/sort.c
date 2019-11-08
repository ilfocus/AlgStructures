//
//  sort.c
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/11/7.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#include "sort.h"

char *say_hello(void) {
	char some[] = "hello world";
	char *first = some;
	printf("hello world");
	return first;
}
void quick_sort(int a[],int left, int right) {
	if (left < right) {
		int i = left;
		int j = right;
		int key = a[left];
		while (i < j) {
			while (i < j && a[j] >= key) {
				j--;
			}
			if (i < j) {
				a[i] = a[j];
				i++;
			}
			while (i < j && a[i] < key) {
				i++;
			}
			if (i < j) {
				a[j] = a[i];
				j--;
			}
		}
		a[i] = key;
		quick_sort(a, left, i - 1);
		quick_sort(a, i + 1, right);
	}
}
void swap(int *a, int *b) {
	int temp = *b;
	*b = *a;
	*a = temp;
}

void max_heapify(int arr[], int start,int end) {
	// 建立父节点和子节点
	int dad = start;
	int son = dad * 2 + 1;
	while (son <= end) {// 子节点在指标范围内才做比较
		if (son + 1 <= end && arr[son] < arr[son + 1]) {
			//先比较两个子节点大小，选择最大的
			son++;
		}
		if (arr[dad] > arr[son]) {// 如果父节点大于子节点代表调整完毕，直接跳出函数
			return;
		} else { // 否则交换父子内容再继续子节点和孙节点比较
			swap(&arr[dad], &arr[son]);
			dad = son;
			son = dad * 2 + 1;
		}
	}
}
void heap_sort(int arr[],int len) {
	int i; // 初始化，i从最后一个父节点开始调整
	for (i = len / 2 - 1; i >= 0; i--) {
		max_heapify(arr, i, len - 1);
	}
//	max_heapify(arr, 0, len - 1);
	for (i = len - 1; i > 0; i--) {
		swap(&arr[0], &arr[i]);
		max_heapify(arr, 0, i - 1);
	}
}

void heapSortTest() {
	int arr[] = { 3, 5, 3, 0, 8, 6, 1, 5, 8, 6, 2, 4, 9, 4, 7, 0, 1, 8, 9, 7, 3, 1, 2, 5, 9, 7, 4, 0, 2, 6 };
	int len = (int) sizeof(arr) / sizeof(*arr);
	heap_sort(arr, len);
	int i;
	for (i = 0; i < len; i++)
		printf("%d ", arr[i]);
	printf("\n");
}
