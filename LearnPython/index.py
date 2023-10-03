# Learning Python 
print('Start of learning Python')
# Variable 
variable = "Hello world !"
nbm_of_wheels = 4
print(variable, nbm_of_wheels, "jean")
print(f"Bonjour ma voiture a {nbm_of_wheels} roues")


# Typing
# int
a = 1
# float
b = 1.5
# str
c = 'Hello world !'
# bool
d = True
# list // modifiable
e = [1,'',True]
# tuple // not modifiable
f = (2,'world', True)
# set
g = {3, 'Hello', -2.3}
# dict
h = {
    '1','Hello world',
    2, True,
    True, "4"
}
# none
i = None

print(type(a),type(b),type(c),type(d),type(e),type(f),type(g),type(h),type(i))

condition = False
nombre = 500

if not condition and nombre != 0:
    print("Condition 1 atteinte")
elif nombre == 500 or nombre == 600:
    print("Nombre egal a 500")
else:
    print("Condition 1 non atteinte")
if nombre:
    print("Condition 2 atteinte")