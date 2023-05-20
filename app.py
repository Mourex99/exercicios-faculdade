# exercicio 1
idade = int(input("Digite sua idade: "))

if idade < 16:
    print("Não-eleitor")
elif 18 <= idade <= 65:
    print("Eleitor obrigatório")
else:
    print("Eleitor facultativo") 

#exercicio 2

a = int(input("Digite o valor de a: "))
b = int(input("Digite o valor de b: "))
c = int(input("Digite o valor de c: "))

if a == 0:
    print("Não é equação do segundo grau")
else:
    delta = b**2 - 4*a*c
    if delta > 0:
        raiz1 = (-b + delta**0.5) / (2*a)
        raiz2 = (-b - delta**0.5) / (2*a)
        print(f"As raízes da equação são {raiz1} e {raiz2}")
    elif delta == 0:
        raiz = -b / (2*a)
        print(f"A raiz da equação é {raiz}")
    else:
        print("Não há raízes reais") 

#exercio 3 

nome_produto = input("Digite o nome do produto: ")
valor_compra = float(input("Digite o valor de compra do produto: "))

if valor_compra < 10:
    valor_venda = valor_compra * 1.7
    lucro = '70%'
elif valor_compra < 30:
    valor_venda = valor_compra * 1.5
    lucro = '50%'
elif valor_compra < 50:
    valor_venda = valor_compra * 1.4
    lucro = '40%'
else:
    valor_venda = valor_compra * 1.3
    lucro = '30%'

print("Nome do produto:", nome_produto)
print("Valor de venda: R$ {:.2f} ({})".format(valor_venda, lucro))

#exercicio 4

valor1 = float(input("Digite o primeiro valor: ")) 
valor2 = float(input("Digite o segundo valor: ")) 

operacao = (input("Digite qual a operação  (+, - , * , / ): "))

if operacao == "+":
    resultado = valor1 + valor2
    print(f"O valor da soma é: {resultado}")
   
elif operacao == "-":
    resultado = valor1 - valor2
    print(f"O valor da subtração é: {resultado}")
     
elif operacao == "*":
    resultado = valor1 * valor2
    print(f"O valor da multiplicação é: {resultado}")

elif operacao == "/":
    resultado = valor1 / valor2
    print(f"O valor da subtração é: {resultado}")