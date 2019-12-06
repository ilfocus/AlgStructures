import UIKit
// 插入排序
func insertionSort(_ arr:[Int]) -> [Int] {
	if arr.count <= 1 {
		return arr
	}
	var sortedArr = arr
	var keyInt:Int
	for i in 0..<arr.count {
		keyInt = sortedArr[i]
		for j in stride(from: i, to: -1, by: -1) {
			if keyInt < sortedArr[j] { // 向前面有序数列中插入值
				sortedArr.remove(at: j+1)// 移出KEY
				sortedArr.insert(keyInt, at: j)
			}
		}
	}
	return sortedArr
}
//let array = [55, 94, 87, 1, 4, 32, 11, 77, 39, 42, 64, 53, 70, 12, 9]
//print(array)
//print(insertionSort(array))



// 归并排序

	// 合并两个序列
func mergeArray(_ arr: inout [Int],low:Int, mid:Int, high:Int) {
	var i = low
	var j = mid + 1
	var k = 0
	var tempArr = Array<Int>(repeating: 0, count: high - low + 1)
	while i <= mid && j <= high {
		if arr[i] < arr[j] {
			tempArr[k] = arr[i]
			i += 1
			k += 1
		} else {
			tempArr[k] = arr[j]
			j += 1
			k += 1
		}
	}
	while i <= mid {
		tempArr[k] = arr[i]
		i += 1
		k += 1
	}
	while j <= high {
		tempArr[k] = arr[j]
		j += 1
		k += 1
	}
	// 将排序好的序列复制回原数组
	k = 0;
	for i in low...high {
		arr[i] = tempArr[k]
		k += 1
	}
}
// 分解合并序列
func mergePass(_ arr: inout [Int], gap:Int) {
	var i = 0
	let count = arr.count
	while i + 2 * gap - 1 < count {
		mergeArray(&arr, low: i, mid: i + gap - 1, high: i + 2 * gap - 1)
		i += 2 * gap
	}
	// 合并剩余序列
	if i + gap -  1 < count {
		mergeArray(&arr, low: i, mid: i + gap - 1, high: count - 1)
	}
}
// 归并排序
func mergeSort(_ arr: inout [Int]) {
	var gap = 1
	while gap < arr.count {
		mergePass(&arr, gap: gap)
		gap *= 2
	}
}

func search(_ nums: [Int], _ target: Int) -> Int {
	var low: Int = 0
	var high: Int = nums.count - 1
	while low <= high {
		let mid = (low + high) / 2
		if nums[mid] < target {
			high = mid - 1
		} else if nums[mid] > target {
			low = mid + 1
		} else {
			return mid
		}
	}
	return -1
}
//var array1 = [-1,0,3,5,9,12]
//print(search(array1, 9))

var A : [Int] = [Int]()
var B : [Int] = [Int]()
for _ in 0...1000 {
	A.append(Int(arc4random() % 1000) + 1)
	B.append(Int(arc4random() % 1000) + 1)
}
for i in 0...1000 {
	if (A[i] % B[i]) != (A[i] & (B[i] - 1)) {
		print("i=\(i) A=\(A[i]) B=\(B[i])")
	}
}
