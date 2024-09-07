if __name__ == '__main__':
# Heroi
    import random
    class Heroi():
        def __init__(self, nome: str, ataque: int, defesa: int, hp: int):
            self._nome = nome
            self._ataque = ataque
            self._defesa = defesa
            self._hp = hp

        def get_nome(self):
            return self._nome
        def set_nome(self, novo_nome):
            self._nome = novo_nome

        def get_ataque(self):
            return self._ataque
        def set_ataque(self, novo_ataque):
            self._ataque = novo_ataque

        def get_defesa(self):
            return self._defesa
        def set_defesa(self, nova_defesa):
            self._defesa = nova_defesa

        def get_hp(self):
            return self._hp
        def set_defesa(self, novo_hp):
            self._hp = novo_hp

        # Metodos
        def atacar(self):
            return self._ataque + random.randint(1,12)

        def defender(self):
            return self._defesa

        def perder_vida(self, quantidade):
            self._hp -= quantidade
            if self._hp < 0: 
                self._hp = 0

# Monstro
    class Monstro():
        def __init__(self, nome: str, ataque: int, defesa: int, hp: int):
            self._nome = nome
            self._ataque = ataque
            self._defesa = defesa
            self._hp = hp

        def get_nome(self):
            return self._nome
        def set_nome(self, novo_nome):
            self._nome = novo_nome

        def get_ataque(self):
            return self._ataque
        def set_ataque(self, novo_ataque):
            self._ataque = novo_ataque

        def get_defesa(self):
            return self._defesa
        def set_defesa(self, nova_defesa):
            self._defesa = nova_defesa

        def get_hp(self):
            return self._hp
        def set_hp(self, novo_hp):
            self._hp = novo_hp

        # Metodos
        def atacar(self):
            return self._ataque + random.randint(1,12)

        def defender(self):
            return self._defesa

        def perder_vida(self, quantidade):
            self._hp -= quantidade
            if self._hp < 0: 
                self._hp = 0

    class Rodada():
        def __init__(self, heroi, monstro):
            self.heroi = heroi
            self.monstro = monstro

        def iniciar(self):
        # Herói ataca o monstro
            ataque_heroi = self.heroi.atacar()
            defesa_monstro = self.monstro.defender()            
            dano_monstro = max(ataque_heroi - defesa_monstro, 0)
            self.monstro.perder_vida(dano_monstro)
            
        # Monstro defende
            defesa_heroi = self.heroi.defender()
            ataque_monstro = self.monstro.atacar()
            dano_heroi = max(ataque_monstro - defesa_heroi, 0)
            self.heroi.perder_vida(dano_heroi)            

            if dano_monstro < dano_heroi:
                print(f'Dano do Heroi: {dano_heroi} e maior que o do Monstro: {dano_monstro}')
                print(f'{self.heroi.get_nome()} Venceu!')
            else:
                print(f'Dano do Monstro: {dano_monstro} e maior que o do Heroi: {dano_heroi}')
                print(f'{self.monstro.get_nome()} Venceu!')

                
        # Status final da rodada
            print(f"{self.heroi.get_nome()} - HP: {self.heroi.get_hp()}")
            print(f"{self.monstro.get_nome()} - HP: {self.monstro.get_hp()}")

heroi = Heroi(
    nome='Pedro',
    ataque=25,
    defesa=15,
    hp=100
)

heroi.set_ataque(30)

monstro = Monstro(
    nome="Dragão",
    ataque=25,
    defesa=15,
    hp=100
)


r = Rodada(heroi, monstro)
r.iniciar()