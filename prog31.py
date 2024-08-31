"""

Programação orientada a objeto

Classe, Atributos, Métodos e objetos

"""
if __name__ == '__main__':
    pass

# PascalCase -> Toda palavra definida por classe possui a primeira letra em Maiusculo Pokemon
# cameCase -> Nome de metodo e função gerarReceita()
# UPPER_CASE -> Para constantes BIT = 1

class Pokemon:
    # Metodos e Atributos(nome, tipo, hp)
    def __init__(self, nome: str, tipo: str, hp: int):
         self._nome = nome
         self._tipo = tipo
         self._hp = hp

    # O metodo GET retornar o valor do campo correspondente.
    def get_nome(self):
        return self._nome
    # O metodo SET atribuir um valor ao campo correspondente
    def set_nome(self, novo_nome):
        self._nome = novo_nome

    # O metodo GET retornar o valor do campo correspondente.
    def set_tipo(self):
        return self._tipo
    # O metodo SET atribuir um valor ao campo correspondente
    def tipo(self, novo_tipo):
        self._tipo = novo_tipo
    
    # Abaixo temos uma outra forma de utilizarmos o GET(property) e SET(nome_fun.setter)
    @property
    def hp(self):
        return self._hp
     
    @hp.setter
    def hp(self, novo_hp):
        self._hp = novo_hp

    def atacar(self):
        print(f'{self._nome} Atacou')

    def desviar(self):
        print(f'{self._nome} Desviou')

    def defendeu(self):
        print(f'{self._nome} Defendeu')

if __name__ == '__main__':

    # Aqui estamos instanciando a classe pokemon. Essa classe já está sendo inicializada com os atributos.
    pikachu = Pokemon(
        
        nome='Pikachu',
        tipo='Elétrico',
        hp=100
    )

    print(pikachu.get_tipo())
    pikachu.set_tipo("Aquático")
    print(pikachu.get_tipo())

    print(pikachu.hp)
    pikachu.hp = 50
    print(pikachu.hp)

class Celular():
    def __init__(self):
        self._ligado = False
    
    def ligar(self):
        self._ligado = True

    def estado(self):
        return self._ligado
    
nokia = Celular()

print(f'Desligado {nokia.estado()}')
nokia.ligar()
print(f'Ligado {nokia.estado()}')
