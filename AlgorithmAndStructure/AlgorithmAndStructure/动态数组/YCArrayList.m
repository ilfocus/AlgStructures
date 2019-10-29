//
//  YCArrayList.m
//  AlgorithmAndStructure
//
//  Created by WangQi on 2019/10/17.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#import "YCArrayList.h"

@implementation YCArrayList
- (instancetype)init {
	self = [super init];
	if (self) {
		self.capacity = 10;
		self.array = [[NSMutableArray alloc] initWithCapacity:self.capacity];
		self.size = 0;
	}
	return self;
}
#pragma mark - method
/**
1、清空数据数据
*/
- (void)clear {
	for (int i = 0; i < self.size; i++) {
		self.array[i] = [NSNull null];
	}
	self.size = 0;
}
/**
2、数组的大小
*/
- (int)size {
	return self.size;
}
/**
3、数组是否为空
*/
- (BOOL)isEmpty {
	return self.size == 0;
}
/**
4、是否包含某元素
*/
- (BOOL)isContainElement:(id)element {
	return [self indexOfByElement:element] != -1;
}
/**
5、根据下标查找某元素
*/
-  (id)findElementByIndex:(int)index {
	[self private_throwException:index];
	return self.array[index];
}
/**
6、根据下标设置某元素，返回旧的元素
*/
- (id)setElementByIndex:(int)index Element:(id)element {
	[self private_throwException:index];
	id obj = self.array[index];
	self.array[index] = element;
	return obj;
}
/**
7、新增某元素
*/
- (void)addElement:(id)element {
	[self addElement:element Index:self.size];
}
/**
8、新增某个index下新增元素
*/
- (void)addElement:(id)element Index:(int)index {
	if (element == nil) {
		@throw [NSException exceptionWithName:@"array add nil" reason:@"array can't add nil" userInfo:nil];
	}
	[self private_throwException:index];
    [self private_expandCap];
    for (int i = self.size; i > index; i--) {
        self.array[i] = self.array[i-1];
    }
    self.array[index] = element;
    self.size++;
}
/**
9、移除某个index
*/
- (id)removeIndex:(int)index {
	[self private_throwException:index];
	[self private_reduceCap];
	
	id obj = self.array[index];
	for (int i = index; i < self.size - 1; i++) {
	   self.array[i] = self.array[i + 1];
	}
	// 数组对象内存管理
	self.array[self.size - 1] = [NSNull null];
	self.size--;
	return obj;
}
/**
10、移除元素
*/
- (id)removeElement:(id)element {
	int index = [self indexOfByElement:element];
	return [self removeIndex:index];
}
/**
11、根据元素查找下标
*/
- (int)indexOfByElement:(id)element {
	for (int i = 0;i < self.size; i++) {
        if ([self.array[i] isEqual:element]) {
            return i;
        }
    }
    return -1;
}
#pragma mark - 异常处理
/**
  12、异常检测处理
 */
- (void)private_throwException:(int)index {
    if (index < 0 || index >= self.size) {
        @throw [NSException exceptionWithName:@"array out of bounds" reason:@"index out of bounds" userInfo:nil];
    }
}
/**
 13、动态数组的capacity扩容
*/
- (void)private_expandCap {
	if (self.size == self.capacity) {
		self.capacity = (int)(1.5 * self.capacity);
		NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.capacity];
		for (int i = 0; i < self.size; i++) {
			newArray[i] = self.array[i];
		}
		self.array = newArray.mutableCopy;
	}
}
/**
 14、动态数组的capacity降容
 */
- (void)private_reduceCap {
    if ((int)(self.capacity / 1.5) == self.size) {
        self.capacity = (int)(self.capacity/1.5);
        NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.capacity];
        for (int i = 0; i < self.size; i++) {
            newArray[i] = self.array[i];
        }
        self.array = newArray.mutableCopy;
    }
}
/**
 15、打印动态数组元素
 */
- (NSString *)description
{
    NSString *temp = [NSString stringWithFormat:@"capacity=%d,count=%d [",self.capacity,self.size];
    
    for (int i = 0; i < self.size; i ++) {
        if (i == self.size -1) {
            temp = [temp stringByAppendingFormat:@"%d-%@",i,self.array[i]];
        }else{
            temp = [temp stringByAppendingFormat:@"%d-%@, ",i,self.array[i]];
        }
    }
    temp = [temp stringByAppendingString:@"]"];
    return temp;
}


- (void)dealloc
{
    NSLog(@"ArrayList-dealloc");
}
@end
