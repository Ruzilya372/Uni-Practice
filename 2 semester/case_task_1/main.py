# Кейс-задача №1. Дан одномерный массив А размерности N. Найти сумму отрицательных элементов, расположенных между максимальным и минимальным. 

N = int(input("Введите кол-во элементов в одномерном массиве: "))
A = []
for num in range(N):
  a = int(input("Введите элемент массива: "))
  A.append(a)
max_element = A.index(max(A))
min_element = A.index(min(A))

negative_sum=0
start = min(min_element, max_element)
finish = max(min_element, max_element)

for element in range(start+1, finish):
  if A[element] < 0:
    negative_sum += A[element]

print("Массив: ", A)
print("Максимальный элемент:",max(A), "Минимальный элемент:", min(A))
print("Сумма негативных элементов:", negative_sum)
