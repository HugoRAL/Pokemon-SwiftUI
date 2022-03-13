//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Hugo Lopes on 13/12/2021.
//

import Foundation

struct PokemonGame {
    
//MARK: - Declaração variáveis e structs
    
    var PokemonEmUso = 0
    var VidaPokemon = 100
    var PokemonInimigo = 0
    var VidaInimigo = 100
    var LvlInimigo = 1
    var EndBatlle = 0 // 1 - Pokémon Morto 2 - Pokémon Inimigo Morto 3 - Pokémon Capturado
    
    var PokemonC:Array<PokemonCapturados>
    struct PokemonCapturados:Identifiable{
        var id=UUID()
        var Nome:String         //Nome do Pokémon
        var Lvl:Int             //Nível do Pokémon
        var Exp:Int             //Exp do Pokémon
        var Attack:Int          //1º Ataque do Pokémon
        var Attack1:Int         //2º Ataque do Pokémon
        var Attack2:Int         //3º Ataque do Pokémon
        var Attack3:Int         //4º Ataque do Pokémon
        var PodexNumber:Int     //Número do Pokémon na Pokedex
    }
    init() {
        PokemonC=Array<PokemonCapturados>()
    }
    
    let Pokedex:[(Nome:String, Env:String ,Lvl:Int,Env1:String,Lvl1:Int,Tipo:String,Defense:Int,Force:Int, Attack:Int, Attack1:Int, Attack2:Int, Attack3:Int)]=[
        (Nome:"Bulbasaur", Env: "Ivysaur" , Lvl: 3 , Env1: "Venusaur" , Lvl1: 5 , Tipo: "Grass", Defense:20 ,Force:20 , Attack: 1, Attack1: 6, Attack2: 4, Attack3: 7 ),
        (Nome:"Charmander", Env: "Charmeleon" , Lvl: 3 , Env1: "Charizard" , Lvl1: 5, Tipo: "Fire", Defense:10 ,Force:40, Attack: 1, Attack1: 4, Attack2: 6, Attack3: 5 ),
        (Nome:"Squirtle", Env: "Squirtle" , Lvl: 3 , Env1: "Squirtle" , Lvl1: 5, Tipo: "Water", Defense:15 ,Force:10, Attack: 1, Attack1: 2, Attack2: 6, Attack3: 3 )
        //(Nome:"", Env: "" , Lvl:  , Env1: "" , Lvl1: , Tipo: "", Defense: , Force: , Attack: , Attack1: , Attack2: , Attack3:  )
    ]
    let AttackList: [(Name: String, Description: String, type: String, Power: Int)] = [
        //(Name: "" , Description: "" , type: "" , Power: ),
        (Name: "", Description: "", type: "", Power: 0),
        //Normal Attack
        (Name: "Growl", Description: "May cause flinching.", type: "Normal", Power: 15),
        
        //Water Attack
        (Name: "Bubble" , Description: "May lower opponent's Speed." , type: "Water" , Power: 35),
        (Name: "Surf" , Description: "May lower opponent's Speed." , type: "Water", Power: 60),
        
        //Fire Attack
        (Name: "Ember", Description: "May burn opponent." , type: "Fire" , Power: 35),
        (Name: "Flamethrower" , Description: "May burn opponent." , type: "Fire" , Power: 60),
        
        //Grass Attack
        (Name: "Razor Leaf" , Description: "User recovers half the HP inflicted on opponent." , type: "Grass" , Power:35 ),
        (Name: "Solar Beam", Description: "User recovers half the HP inflicted on opponent.", type: "Grass", Power:60)
        
    ]
    var Historico:[(PokemonEmUso:String ,PokemonInimigo:String, Estado:String)]=[]
    
    //MARK: - Funções do PokemonC
    
    mutating func PokeAdd (nome:String,lvl:Int,exp:Int,attack:Int,attack1:Int,attack2:Int,attack3:Int,Podex:Int){
        PokemonC.append(PokemonCapturados(Nome: nome, Lvl: lvl, Exp: exp, Attack: attack, Attack1: attack1, Attack2: attack2, Attack3: attack3, PodexNumber: Podex))
    }
    mutating func AlterarPokemon(numero:Int, nome:String, lvl:Int,exp:Int ) {
        PokemonC[numero].Nome = nome
        PokemonC[numero].Exp = exp
        PokemonC[numero].Lvl = lvl
    }
    
    mutating func EliminarPokemon (numero:Int){
        PokemonC.remove(at: numero)
    }
    
    //MARK: - Batalha
    
    mutating func GerarInimigo(){
        PokemonInimigo = Int.random(in: 0...Pokedex.count-1)
        LvlInimigo = Int.random(in: PokemonC[PokemonEmUso].Lvl-2...PokemonC[PokemonEmUso].Lvl+1)
        if LvlInimigo<0 {
            LvlInimigo=1
        }
    }
    mutating func Run(){
        var Apanhado = Int.random(in: 0...100)
        Apanhado*=2
        if (Apanhado>VidaInimigo) {
            EndBatlle = 4
        }
    }
    mutating func BatalhaComecou()   {
        VidaInimigo=100
        VidaPokemon=100
        EndBatlle = 0
    }
    mutating func EstouMorto(){
        if VidaPokemon<=0 {
            EndBatlle = 1
        }
    }
    
    //MARK: - Ataques
    
    mutating func Attack(Number:Int){
        switch Number {
        case 0:
            VidaInimigo -= CalculoDano(Dano: AttackList[PokemonC[PokemonEmUso].Attack].Power, SouEuAtacar: true, TipoDoAtaque: AttackList[PokemonC[PokemonEmUso].Attack].type)
            VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            EstouMorto()
            
        case 1:
            VidaInimigo -= CalculoDano(Dano: AttackList[PokemonC[PokemonEmUso].Attack1].Power, SouEuAtacar: true, TipoDoAtaque: AttackList[PokemonC[PokemonEmUso].Attack1].type)
            VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            EstouMorto()
            
        case 2:
            VidaInimigo -= CalculoDano(Dano: AttackList[PokemonC[PokemonEmUso].Attack2].Power, SouEuAtacar: true, TipoDoAtaque: AttackList[PokemonC[PokemonEmUso].Attack1].type)
            VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack1].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            EstouMorto()
            
        case 3:
            VidaInimigo -= CalculoDano(Dano: AttackList[PokemonC[PokemonEmUso].Attack3].Power, SouEuAtacar: true, TipoDoAtaque: AttackList[PokemonC[PokemonEmUso].Attack1].type)
            VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack3].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            EstouMorto()
            
        case 5:
            CapturarPokemon()
            if EndBatlle != 3 {
                VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            }
            EstouMorto()
            
        case 6:
            Run()
            VidaPokemon -= CalculoDano(Dano: AttackList[Pokedex[PokemonInimigo].Attack].Power, SouEuAtacar: false, TipoDoAtaque: AttackList[Pokedex[PokemonInimigo].Attack].type)
            EstouMorto()
            
        default:
            print("ERRO no Ataque")
        }
        
        if VidaInimigo <= 0 {
            EndBatlle = 2
            EndBattle()
        }
    }
    
    //MARK: - Dano dos Ataques
    
    func CalculoDano(Dano:Int, SouEuAtacar: Bool,TipoDoAtaque: String) -> Int {
        var Dar = 0
        var DarNivel = 0.0
        var Receber = 0
        var ReceberNivel = 0.0
        var DanoFinal:Double = Double(Dano)
        
        if SouEuAtacar {
            Dar = PokemonC[PokemonEmUso].PodexNumber
            DarNivel = Double(PokemonC[PokemonEmUso].Lvl)*0.5
            Receber = PokemonInimigo
            ReceberNivel = Double(LvlInimigo)*0.5
        }else{
            Receber = PokemonC[PokemonEmUso].PodexNumber
            ReceberNivel = Double(PokemonC[PokemonEmUso].Lvl*Int(0.5))
            Dar = PokemonInimigo
            DarNivel = Double(LvlInimigo*Int(0.5))
        }
        if TipoDoAtaque == "Water" && Pokedex[Receber].Tipo == "Fire"{
            DanoFinal*=2
        }else if TipoDoAtaque == "Fire" && Pokedex[Receber].Tipo == "Grass" {
            DanoFinal*=2
        }else if TipoDoAtaque == "Grass" && Pokedex[Receber].Tipo == "Water" {
            DanoFinal*=2
        }else if TipoDoAtaque == "Fire" && Pokedex[Receber].Tipo == "Water" {
            DanoFinal/=2
        }else if TipoDoAtaque == "Water" && Pokedex[Receber].Tipo == "Fire" {
            DanoFinal/=2
        }else if TipoDoAtaque == "Grass" && Pokedex[Receber].Tipo == "Water" {
            DanoFinal/=2
            
        }
        DanoFinal = (Double(Pokedex[Dar].Force)*DarNivel)+DanoFinal
        DanoFinal = DanoFinal - (Double(Pokedex[Receber].Defense)*ReceberNivel)
        if DanoFinal<0 {
            DanoFinal=0
        }
        
        return Int(DanoFinal)
    }
    
    //MARK: - Pokémon Capturado
    
    mutating func CapturarPokemon(){
        let Apanhado = Int.random(in: 0...100)
        
        if (Apanhado>VidaInimigo) {
            EndBattle()
            var Attack3 = 0
            var Attack2 = 0
            var NomePokemon = " "
            if(LvlInimigo >= 5){
                NomePokemon = Pokedex[PokemonInimigo].Env1
                Attack2 = Pokedex[PokemonInimigo].Attack2
                Attack3 = Pokedex[PokemonInimigo].Attack3
            }else if (LvlInimigo >= 3 ){
                NomePokemon = Pokedex[PokemonInimigo].Env
                Attack2 = Pokedex[PokemonInimigo].Attack2
            }else{
                NomePokemon = Pokedex[PokemonInimigo].Nome
            }
            
            PokemonC.append(PokemonCapturados(Nome: NomePokemon , Lvl: PokemonC[PokemonEmUso].Lvl, Exp: 0, Attack: Pokedex[PokemonInimigo].Attack, Attack1: Pokedex[PokemonInimigo].Attack1, Attack2: Attack2, Attack3: Attack3 , PodexNumber: PokemonInimigo))
            EndBatlle = 3
            
        }
    }
    
    //MARK: - Fim da Batalha
    
    mutating func EndBattle() {
        PokemonC[PokemonEmUso].Exp += 1
        if PokemonC[PokemonEmUso].Lvl == PokemonC[PokemonEmUso].Exp{
            PokemonC[PokemonEmUso].Exp = 0
            PokemonC[PokemonEmUso].Lvl += 1

            if PokemonC[PokemonEmUso].Lvl == 3 {
                PokemonC[PokemonEmUso].Nome = Pokedex[PokemonC[PokemonEmUso].PodexNumber].Env
                PokemonC[PokemonEmUso].Attack2 = Pokedex[PokemonC[PokemonEmUso].PodexNumber].Attack2
            } else if PokemonC[PokemonEmUso].Lvl == 5 {
                PokemonC[PokemonEmUso].Nome = Pokedex[PokemonC[PokemonEmUso].PodexNumber].Env1
                PokemonC[PokemonEmUso].Attack3 = Pokedex[PokemonC[PokemonEmUso].PodexNumber].Attack3
            }
        }
    }
    
    //MARK: - 2P
    mutating func Attack2P(Number: Int ,Pokemon:Int,Jogador1:Bool){
        var Dano = 0
        switch Number {
        case 0:
            Dano = CalculoDano(Dano: AttackList[PokemonC[Pokemon].Attack].Power, SouEuAtacar: Jogador1, TipoDoAtaque: AttackList[PokemonC[Pokemon].Attack].type)
            
            
        case 1:
            Dano = CalculoDano(Dano: AttackList[PokemonC[Pokemon].Attack1].Power, SouEuAtacar: Jogador1, TipoDoAtaque: AttackList[PokemonC[Pokemon].Attack1].type)
            
            
        case 2:
            Dano = CalculoDano(Dano: AttackList[PokemonC[PokemonEmUso].Attack2].Power, SouEuAtacar: Jogador1, TipoDoAtaque: AttackList[PokemonC[Pokemon].Attack1].type)
            
            
        case 3:
            Dano = CalculoDano(Dano: AttackList[PokemonC[Pokemon].Attack3].Power, SouEuAtacar: Jogador1, TipoDoAtaque: AttackList[PokemonC[Pokemon].Attack1].type)
            
        default:
            print("ERRO no Ataque")
        }
        EstouMorto()
        if Jogador1{
            VidaInimigo -= Dano
        }else{
            VidaPokemon -= Dano
        }
        if VidaInimigo <= 0 || VidaPokemon <= 0  {
            EndBatlle = 2
            EndBattle()
        }
    }
}
