// Algorithme de génération d'une grille complète de Sudoku
// Inspiré de l'algorithme des 8 reines de Robert W. Floyd
// Version extra' de 16x16
// Coypright David Fischer 2011

byte result[256] = 0;
byte number = 1;

// Processus de génération d'une grille complète de sudoku !
// > Sous la forme d'un appel récursif pour chacun des nombres
// > Sous la forme d'une boucle interne, pour chacune des colonnes
proctype sudoku()
{
  bool row [16] = false; // Présence du même nombre sur la ligne courante ?
  bool bloc[16] = false; // Présence du même nombre dans le bloc courant ?

  byte colNb = 0; // Position (axe colonnes) où placer le nombre
  byte rowNb = 0; // Position probable (axe lignes) où placer le nombre

  // Trouve une solution de placement pour le nombre actuel, colonne par colonne
  do
  ::
    // Choisit une position (axe lignes) de manière non déterministe
    if
    :: true -> rowNb =  0;
    :: true -> rowNb =  1;
    :: true -> rowNb =  2;
    :: true -> rowNb =  3;
    :: true -> rowNb =  4;
    :: true -> rowNb =  5;
    :: true -> rowNb =  6;
    :: true -> rowNb =  7;
    :: true -> rowNb =  8;
    :: true -> rowNb =  9;
    :: true -> rowNb = 10;
    :: true -> rowNb = 11;
    :: true -> rowNb = 12;
    :: true -> rowNb = 13;
    :: true -> rowNb = 14;
    :: true -> rowNb = 15;
    fi;

    // Tente de placer le nombre courant dans une case, ceci en respectant les
    // règles de placement du Sudoku. Un nombre de doit se répéter qu'une seule
    // fois par ligne, colonne et bloc de 4x4.

    result[colNb*16 + rowNb] == 0; // Doit être une case "libre"
    !row[rowNb];                   // Doit être une ligne "libre"
    !bloc[(colNb/4)*4 + rowNb/4];  // Doit être un bloc "libre"

    row[rowNb] = true;
    bloc[(colNb/4)*4 + rowNb/4] = true;

    result[colNb*16 + rowNb] = number;

    if
    :: colNb == 16-1 -> break;
    :: else -> colNb++; // Passe à la prochaine colonne (0..15)
    fi;
  od;

  number++; // Passe au prochain nombre (1..16)

  if
  :: number == 17 -> assert (false); // Avec le sourire !
  :: else -> run sudoku();
  fi;
}

init
{
  run sudoku();
}
