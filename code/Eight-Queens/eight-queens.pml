// eight queens promela sur google
// Algorithme de Robert W. Floyd

byte result[8] = 0;

bool a[8]  = false;
bool b[15] = false;
bool c[15] = false;

byte row = 0;

proctype ChooseRow()
{
  if
  :: true -> row = 1;
  :: true -> row = 2;
  :: true -> row = 3;
  :: true -> row = 4;
  :: true -> row = 5;
  :: true -> row = 6;
  :: true -> row = 7;
  :: true -> row = 8;
  fi;
}

proctype WriteResult()
{
  assert (false);
}

active proctype EightQueens()
{
  byte col = 1;
  //byte row;

  do
  ::
    run ChooseRow();

    !a[row-1];
    !b[row+col-2];
    !c[row-col+7];
    a[row-1] = true;
    b[row+col-2] = true;
    c[row-col+7] = true;

    result[col-1] = row;
    if
    :: col == 8 -> break;
    :: else -> col++;
    fi;
  od;

  run WriteResult();
}
