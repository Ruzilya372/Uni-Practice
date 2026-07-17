"""
Кейс-задача №1. Дан одномерный массив А размерности N. 
Найти сумму отрицательных элементов, расположенных между максимальным и минимальным. 
"""

A = [9, 1, -2, 3,-4, 5, -6, 7, -8, -10]

min_a = A.index(min(A))
max_a = A.index(max(A)) 

start = min(min_a, max_a)
finish = max(min_a, max_a)

new_A = A[start + 1:finish]
negative_sum = 0
for i in new_A:
    if i < 0:
        negative_sum += i

print("Массив:", A)
print("Минимальный элемент:", min(A))
print("Максимальный элемент:", max(A))
print("Сумма отрицательных элементов между ними:", negative_sum)
