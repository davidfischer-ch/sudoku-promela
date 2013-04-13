// Algorithme de génération d'une grille complète de Sudoku
// Inspiré de l'algorithme des 8 reines de Robert W. Floyd
// Version générique pour des grilles de NxN cases !
// Coypright David Fischer 2011

#define TYPE    byte
#define SQRT_N  4
#define N       16
#define N_N     256

TYPE result[N_N] = 0;
TYPE number = 1;

// Processus de génération d'une grille complète de sudoku !
// > Sous la forme d'un appel récursif pour chacun des nombres
// > Sous la forme d'une boucle interne, pour chacune des colonnes
proctype sudoku()
{
  bool row [N] = false; // Présence du même nombre sur la ligne courante ?
  bool bloc[N] = false; // Présence du même nombre dans le bloc courant ?
  TYPE colNb   = 0; // Position (axe colonnes) où placer le nombre
  TYPE rowNb   = 0; // Position probable (axe lignes) où placer le nombre
  TYPE randomCpt;   // Compteur utilisé lors de la génération de rowNb

  // Trouve une solution de placement pour le nombre actuel, colonne par colonne
  do
  ::
    // Choisit une position (axe lignes) de manière non déterministe
    rowNb     = 0;
    randomCpt = 0;
    do
    :: randomCpt < N-1 -> randomCpt++; rowNb = rowNb+1;
    :: randomCpt < N-1 -> randomCpt++;
    :: else -> break;
    od;
    assert (rowNb >= 0 && rowNb < N);

    // Tente de placer le nombre courant dans la grille[colNb][rowNb], ceci en
    // respectant les règles de placement du Sudoku. Un nombre de doit être
    // présent qu'une seule fois par ligne, colonne et bloc carré de N éléments.

    result[colNb*N + rowNb] == 0; // Doit être une case "libre"
    !row[rowNb];                  // Doit être une ligne "libre"
    !bloc[(colNb/SQRT_N)*SQRT_N + rowNb/SQRT_N]; // Doit être un bloc "libre"

    row[rowNb] = true;
    bloc[(colNb/SQRT_N)*SQRT_N + rowNb/SQRT_N] = true;

    result[colNb*N + rowNb] = number;

    if
    :: colNb == N-1 -> break;
    :: else -> colNb++; // Passe à la prochaine colonne (0..N-1)
    fi;
  od;

  number++; // Passe au prochain nombre (1..N)

  assert (number <= N); // Avec le sourire !

  run sudoku();
}

init
{
  run sudoku();
}
