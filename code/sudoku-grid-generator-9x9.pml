// Algorithme de génération d'une grille complète de Sudoku
// Inspiré de l'algorithme des 8 reines de Robert W. Floyd
// Version la plus populaire du Sudoku, à savoir 9x9
// Coypright David Fischer 2011

byte result[81] = 0;
byte number = 1;

// Processus de génération d'une grille complète de sudoku !
// > Sous la forme d'un appel récursif pour chacun des nombres
// > Sous la forme d'une boucle interne, pour chacune des colonnes
proctype sudoku()
{
  bool row [9] = false; // Présence du même nombre sur la ligne courante ?
  bool bloc[9] = false; // Présence du même nombre dans le bloc courant ?

  byte colNb = 0; // Position (axe colonnes) où placer le nombre
  byte rowNb = 0; // Position probable (axe lignes) où placer le nombre

  // Trouve une solution de placement pour le nombre actuel, colonne par colonne
  do
  ::
    // Choisit une position (axe lignes) de manière non déterministe
    if
    :: true -> rowNb = 0;
    :: true -> rowNb = 1;
    :: true -> rowNb = 2;
    :: true -> rowNb = 3;
    :: true -> rowNb = 4;
    :: true -> rowNb = 5;
    :: true -> rowNb = 6;
    :: true -> rowNb = 7;
    :: true -> rowNb = 8;
    fi;

    // Tente de placer le nombre courant dans une case, ceci en respectant les
    // règles de placement du Sudoku. Un nombre de doit se répéter qu'une seule
    // fois par ligne, colonne et bloc de 3x3.

    result[colNb*9 + rowNb] == 0; // Doit être une case "libre"
    !row[rowNb];                  // Doit être une ligne "libre"
    !bloc[(colNb/3)*3 + rowNb/3]; // Doit être un bloc "libre"

    row[rowNb] = true;
    bloc[(colNb/3)*3 + rowNb/3] = true;

    result[colNb*9 + rowNb] = number;

    if
    :: colNb == 9-1 -> break;
    :: else -> colNb++; // Passe à la prochaine colonne (0..8)
    fi;
  od;

  number++; // Passe au prochain nombre (1..9)

  if
  :: number == 10 -> assert (false); // Avec le sourire !
  :: else -> run sudoku();
  fi;
}

init
{
  run sudoku();
}
