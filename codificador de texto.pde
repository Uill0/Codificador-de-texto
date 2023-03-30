import java.awt.datatransfer.*;
import java.awt.Toolkit;

String textoOriginal = "";
String textoCodificado = "";
PFont fonteElfica;

void setup() {
  fonteElfica = createFont("Junicode.ttf", 24); 
  textFont(fonteElfica);
  size(500, 250);
  background(0);
  fill(255);
  textSize(14);
  textAlign(LEFT, TOP);
  text("Digite o texto a ser codificado (max 100 caracteres):", 20, 20);
  noFill();
  rect(20, 40, 460, 120);
}

void draw() {
  fill(255);
  text(textoOriginal, 30, 50, 440, 110);
  text(textoCodificado, 30, 180, 440, 110);
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (textoOriginal.length() > 0) {
      textoOriginal = textoOriginal.substring(0, textoOriginal.length() - 1);
      textoCodificado = "";
    }
  } else if (keyCode == ENTER || keyCode == RETURN) {
    if (textoOriginal.length() > 0) {
      if (textoOriginal.length() > 100) {
        textoCodificado = "O texto não pode ter mais de 100 caracteres.";
      } else {
        textoCodificado = codificarTexto(textoOriginal);
      }
    }
  } else if (key == '1' || key == '1') {
    if (textoCodificado.length() > 0) {
      Toolkit toolkit = Toolkit.getDefaultToolkit();
      Clipboard clipboard = toolkit.getSystemClipboard();
      StringSelection selection = new StringSelection(textoCodificado);
      clipboard.setContents(selection, null);
    }
  } else {
    if (textoOriginal.length() < 100 && key >= ' ') {
      textoOriginal += key;
      textoCodificado = "";
    }
  }

  background(0);
  fill(255);
  textSize(14);
  textAlign(LEFT, TOP);
  text("Digite o texto a ser codificado (max 100 caracteres):", 20, 20);
  noFill();
  rect(20, 40, 460, 120);
}

String codificarTexto(String texto) {
  String resultado = "";
  String alfabetoNormal = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String alfabetoElfico = "ᚠᚢᚦᚨᚱᚳᚷᚹᚻᚾᛁᛄᛇᛈᛉᛊᛏᛒᛖᛗᛚᛜᛟᛞᛝᛡᛣᛤᛥᛦᛨᛪ᛫᛬᛭0";

  for (int i = 0; i < texto.length(); i++) {
    char letra = texto.charAt(i);
    int posicao = alfabetoNormal.indexOf(letra);
    if (posicao >= 0) {
      resultado += alfabetoElfico.charAt(posicao);
    } else {
      resultado += letra;
    }
  }
  
for (int i = 0; i < texto.length(); i++) {
    char letra = texto.charAt(i);
    int posicao = alfabetoNormal.indexOf(letra);
    if (posicao >= 0) {
      if (posicao < alfabetoElfico.length()) {  // adiciona verificação
        resultado += alfabetoElfico.charAt(posicao);
      }
    } else {
      resultado += letra;
    }
  }
  return resultado;
}
