"""
Кейс-задача № 2
Написать тестовую программу, которая демонстрирует работу методов базового и производного классов.
"""

# Базовый класс - Животное
class Animal:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def make_sound(self):
        print(self.name, "издает звук")
    
    def eat(self):
        print(self.name, "ест")

    def info(self):
        print("Животное:", self.name, ", возраст:", self.age, "лет")


# Производный класс - Собака
class Dog(Animal):
    def __init__(self, name, age, breed):
        Animal.__init__(self, name, age)
        self.breed = breed    # порода
    
    def make_sound(self):
        print(self.name, "гавкает: Гав-гав!")
    

    def info(self):
        print("Собака:", self.name, ", возраст:", self.age, "лет, порода:", self.breed)
    

    def fetch(self):
        print(self.name, "приносит палку")


# Производный класс - Кошка
class Cat(Animal):
    def __init__(self, name, age, color):
        Animal.__init__(self, name, age)
        self.color = color
    
    def make_sound(self):
        print(self.name, "мяукает: Мяу-мяу!")
    
    def info(self):
        print("Кошка:", self.name, ", возраст:", self.age, "лет, цвет:", self.color)
    
    def scratch(self):
        print(self.name, "точит когти")


# ============ ТЕСТИРОВАНИЕ ============

print("-" * 40)
print("Тестирование классов")
print("-" * 40)

print("Создаем объект базового класса:")
animal = Animal("Безымянное", 3)
animal.info()
animal.make_sound()
animal.eat()

print("Создаем объект класса Собака:")
dog = Dog("Рэкс", 5, "Овчарка")
dog.info()
dog.make_sound()
dog.eat()
dog.fetch()

print(" Создаем объект класса Кошка:")
cat = Cat("Муся", 2, "Серая")
cat.info()
cat.make_sound()
cat.eat()
cat.scratch()

# Создаем список с разными животными
animals = [
    Dog("Бобик", 4, "Доберман"),
    Cat("Барсик", 3, "Белый"),
    Dog("Тузик", 6, "Дворняга"),
    Cat("Мурка", 1, "Рыжая")
]

# Проходим по списку и вызываем одни и те же методы
for animal in animals:
    print("\n---")
    animal.info()
    animal.make_sound()
    animal.eat()
