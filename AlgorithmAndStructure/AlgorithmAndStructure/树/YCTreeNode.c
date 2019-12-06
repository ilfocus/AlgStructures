//
//  YCTreeNode.c
//  AlgorithmAndStructure
//
//  Created by qi wang on 2019/11/11.
//  Copyright © 2019 $(PRODUCT_NAME). All rights reserved.
//

#include "YCTreeNode.h"


#define MAX_TREE_SIZE 100

typedef int TElemType;
typedef struct PTNode {
	TElemType data;
	int parent;
} PTNode;
typedef struct {
	PTNode nodes[MAX_TREE_SIZE];
	int r,n;// 根位置和结点数
} PTree;
