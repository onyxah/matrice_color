// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  // Initialisation des tableaux de couleurs et de positions
  List<String> couleurs = ["Rouge", "Vert", "Bleu", "Jaune", "Orange"];
  List<String> positions = ["ADDP", "EDDP", "SDP", "ADDS", "EDDS", "SDS"];

  // Saisie de l'ordre de la matrice carrée
  print("Saisissez l'ordre de la matrice carrée : ");
  int ordre = int.parse(stdin.readLineSync()!);

  // Initialisation de la matrice avec des valeurs par défaut
  List<List<String>> matrice = List.generate(ordre, (index) => List.filled(ordre, " "));

  // Affichage de la matrice initiale
  afficherMatrice(matrice);

  // Menu de choix pour la position de la couleur
  print("Menu de choix pour la position de la couleur :");
  afficherMenu(positions);
  print("Choisissez une position : ");
  int choixPositionIndex = int.parse(stdin.readLineSync()!);
  String choixPosition = positions[choixPositionIndex];

  // Menu de choix pour la couleur
  print("Menu de choix pour la couleur :");
  afficherMenu(couleurs);
  print("Choisissez une couleur : ");
  int choixCouleurIndex = int.parse(stdin.readLineSync()!);
  String choixCouleur = couleurs[choixCouleurIndex];

  // Application des règles de gestion pour colorier la matrice
  colorierMatrice(matrice, choixPosition, choixCouleur);

  // Affichage de la matrice coloriée
  afficherMatrice(matrice);
}

void afficherMatrice(List<List<String>> matrice) {
  print("Matrice :");
  for (int i = 0; i < matrice.length; i++) {
    for (int j = 0; j < matrice[i].length; j++) {
      stdout.write(matrice[i][j].padLeft(6));
    }
    print("\n${"-" * (matrice.length * 7)}");  // Ligne de séparation
  }
}

void afficherMenu(List<String> options) {
  for (int i = 0; i < options.length; i++) {
    print("$i. ${options[i]}");
  }
}

void colorierMatrice(List<List<String>> matrice, String position, String couleur) {
  for (int i = 0; i < matrice.length; i++) {
    for (int j = 0; j < matrice[i].length; j++) {
      switch (position) {
        case "ADDP":
          if (i < j) matrice[i][j] = couleur;
          break;
        case "EDDP":
          if (i > j) matrice[i][j] = couleur;
          break;
        case "SDP":
          if (i == j) matrice[i][j] = couleur;
          break;
        case "ADDS":
          if (i + j < matrice.length - 1) matrice[i][j] = couleur;
          break;
        case "EDDS":
          if (i + j > matrice.length - 1) matrice[i][j] = couleur;
          break;
        case "SDS":
          if (i == matrice.length - 1 - j) matrice[i][j] = couleur;
          break;
      }
    }
  }
}
