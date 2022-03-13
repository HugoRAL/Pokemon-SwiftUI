//
//  PokemonVM.swift
//  Pokemon
//
//  Created by Hugo Lopes on 13/12/2021.
//

import SwiftUI

class PokemonVM: ObservableObject{
    
//MARK: - Campos
    
    var model:PokemonGame=PokemonGame()
    @Published var round = 0
    var BattleText:String = " "
    @Published var Player1 = true
    @Published var Player1Escolhido = false
    @Published var P2Pokemon = 0
    @Published var P1Pokemon = 0
    @Published var NumberOfPokemons = 0
//MARK: - Adicionar Pokémon
    
    func PokeAdd(nome:String,lvl:Int,exp:Int,attack:Int,attack1:Int,attack2:Int,attack3:Int,PodexNumber:Int){
        model.PokeAdd(nome: nome, lvl: lvl, exp: exp, attack: attack, attack1: attack1, attack2: attack2, attack3: attack3, Podex: PodexNumber)
    }//Adiciona um novo pokemon ao array
//MARK: - Pokedex

//-------------------- Get Info ----------------------
    func NumberOfPokemon(){
        NumberOfPokemons = model.PokemonC.count
    }//Numero de Pokemons Adquiridos
    func NumberOfBattles() -> Int {
        model.Historico.count
    }//Numero de Batalhas Realizadas
    func GetPokedex(Number: Int) -> (String,Int,Int,Color) {
        let Numero = Number
        var Type:Color = .black
        if NumberOfPokemons <= Numero {
            return("", 1,1 , Type  )
        }
        
        if model.PokemonEmUso == Numero {
            Type = (.init(red: 0.128, green: 0.128, blue: 0.128, opacity: 0.5))
        }else if model.Pokedex[model.PokemonC[Numero].PodexNumber].Tipo == "Fire" {
            Type = (.init(red: 1, green: 0, blue: 0, opacity: 0.5))
        } else if model.Pokedex[model.PokemonC[Numero].PodexNumber].Tipo == "Water" {
            Type = (.init(red: 0, green: 0, blue: 1, opacity: 0.5))
        } else if model.Pokedex[model.PokemonC[Numero].PodexNumber].Tipo == "Grass" {
            Type = (.init(red: 0, green: 1, blue: 0, opacity: 0.5))
        }
        
        return(model.PokemonC[Numero].Nome, model.PokemonC[Numero].Lvl,model.PokemonC[Numero].Exp , Type  )
    }//Informacao necessaria para a pokedex
    func GetHistorico(Number: Int) -> (String,String,Color) {
        var Cor:Color = .black
        if model.Historico[Number].Estado == "Win" {
            Cor = (.init(red: 0, green: 1, blue: 0, opacity: 0.5))
        }else if model.Historico[Number].Estado == "Lose"{
            Cor = (.init(red: 1, green: 0, blue: 0, opacity: 0.5))
        }else if model.Historico[Number].Estado == "Catch"{
            Cor = (.init(red: 1, green: 0.8, blue: 0, opacity: 0.5))
        }else{
            Cor = (.init(red: 1, green: 0, blue: 0, opacity: 0.5))
        }
        return(model.Historico[Number].PokemonEmUso, model.Historico[Number].PokemonInimigo,Cor)
    }//Informacao necessaria para o Historico
//-------------------- Set Info -------------------------
    func UpdatePokedex(Number: Int){
        model.PokemonEmUso = Number
        round+=1
    }//Pokemon escolhido
    func UpdateEnemy(Number:Int){
        model.PokemonInimigo=model.PokemonC[Number].PodexNumber
    }//Inimigo escolhido
    func PokemonEliminado(Number:Int){
        model.EliminarPokemon(numero: Number)
        NumberOfPokemon()
    }
    
//MARK: - Batalhas
    
//-------------------- Inicition ------------------------
    func Pokedex() {
        model.BatalhaComecou()
        model.GerarInimigo()
        round=0
        
    }
    func InicioBatalha() {
        model.BatalhaComecou()
        model.GerarInimigo()
        BattleText = " "
        round=0
    }
    func InicioBatalha2P() {
        model.BatalhaComecou()
        Player1=true
        UpdatePokedex(Number: 0)
    }
    func InicioP2(){
        P2Pokemon = 0
        P1Pokemon = 0
        UpdatePokedex(Number: 0)
        Player1Escolhido = false
    }
//-------------------- Get Info --------------------------
    func GetInimigo() -> (String, Int) {
        var NomePokemon:String
        if(model.LvlInimigo >= 5){
            NomePokemon = model.Pokedex[model.PokemonInimigo].Env1
        }else if (model.LvlInimigo >= 3 ){
            NomePokemon = model.Pokedex[model.PokemonInimigo].Env
        }else{
            NomePokemon = model.Pokedex[model.PokemonInimigo].Nome
        }
        return (NomePokemon , model.VidaInimigo)
    }//Informacao do pokemon inimigo
    func GetPokemonForBattle() -> (String, Int, String, String, String, String){
        return (model.PokemonC[model.PokemonEmUso].Nome,
                model.VidaPokemon,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack1].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack2].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack3].Name)
    }//Informacao do pokemon em uso
    func GetInfo2P(Attack:Bool) -> (String, Int, String, String, String, String){
        var Vida:Int
        var Number:Int
        if Attack {
            if Player1{
                Vida = model.VidaPokemon
                Number = P1Pokemon
            }else{
                Vida = model.VidaInimigo
                Number = P2Pokemon
            }
        }else{
            if Player1 == false{
                Vida = model.VidaPokemon
                Number = P1Pokemon
            }else{
                Vida = model.VidaInimigo
                Number = P2Pokemon
            }
        }
        
        
        return (model.PokemonC[Number].Nome,
                Vida,
                model.AttackList[model.PokemonC[Number].Attack].Name,
                model.AttackList[model.PokemonC[Number].Attack1].Name,
                model.AttackList[model.PokemonC[Number].Attack2].Name,
                model.AttackList[model.PokemonC[Number].Attack3].Name)
    }//Informacao do pokemon em uso
//-------------------- Acabou batalha ----------------
    func EndBattle(Number:Int) {
        switch Number {
        case 1:
          BattleText = "Morreste"
            model.Historico.append((PokemonEmUso:model.PokemonC[model.PokemonEmUso].Nome, PokemonInimigo:GetInimigo().0, Estado:"Lose"))
        case 2:
           BattleText = "Ganhaste"
            model.Historico.append((PokemonEmUso:model.PokemonC[model.PokemonEmUso].Nome, PokemonInimigo:GetInimigo().0, Estado:"Win"))
        case 3:
           BattleText = "Pokemon Capturado"
            model.Historico.append((PokemonEmUso:model.PokemonC[model.PokemonEmUso].Nome, PokemonInimigo:GetInimigo().0, Estado:"Catch"))
        case 4:
            BattleText = "Escapaste"
              model.Historico.append((PokemonEmUso:model.PokemonC[model.PokemonEmUso].Nome, PokemonInimigo:GetInimigo().0, Estado:"Run"))
        default:
            print("ERRO na escrita de texto do final da batalha")
        }
    
    }
    func FinishP2()->(Bool,Bool) {

        var Player1Win = false
        var Player2Win = false

        if model.VidaPokemon <= 0{
            Player1Win = true
        }else if model.VidaInimigo <= 0 {
            Player2Win = true
        }
        model.PokemonInimigo=0

        return (Player1Win,Player2Win)
    }
//-------------------- Attack -----------------------------
    func AttackButton(ButtonNumber:Int){
        model.Attack(Number: ButtonNumber)
        if model.EndBatlle != 0 {
        EndBattle(Number: model.EndBatlle)
        }
    }
    func AttackP2(NumeroAttack:Int){
        var NumberPokemon:Int

        if Player1{
            NumberPokemon = P1Pokemon
        }else{
            NumberPokemon = P2Pokemon
        }
        model.Attack2P(Number: NumeroAttack, Pokemon: NumberPokemon, Jogador1: Player1)
        if !FinishP2().0 && !FinishP2().1{
            Player1.toggle()
        }
    }

}





