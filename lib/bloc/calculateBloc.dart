
import 'package:flutter/cupertino.dart';

class CalculateBloc{
  var idadeInformada = new TextEditingController();
  var doencaCronica = false;
  var result = "Preencha os dados para saber se você está no grupo de risco.";

  calculate(){
    int idade = int.parse(idadeInformada.value.text);

    if(!doencaCronica){
      if(idade >= 50){
        result = "Atenção, você esta no grupo de risco.\n É preciso ficar em isolamento social.";
      }else{
        result = "Atenção, você não esta no grupo de risco.";
      }
    }else{
      result = "Atenção, você esta no grupo de risco.\n É preciso ficar em isolamento social.";
    }


  }
  clearControls(){
    idadeInformada.clear();
  }
}