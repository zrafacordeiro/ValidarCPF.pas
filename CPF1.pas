# ValidarCPF.pas
Programa de validação de CPF em Pascal com uso de funções.

program cpf;

var
cont, res, ires, n1, n2, repetidos: integer;
A: array [1..11] of integer;
status : boolean;
r: boolean;

procedure entrada;
begin
  writeln('Digite o CPF do aluno');
  for cont := 1 to 11 do
  begin
    read(A[cont]);
  end;
  n1 := A[10];
  n2 := A[11];
end;

procedure ii;
begin
  for cont := 1 to 9 do
  begin
    res := (A[cont] * (11 - cont)) + res;
  end;
  for cont := 1 to 10 do
  begin
    ires := (A[cont] * (12 - cont)) + ires;
  end;
end;


function validar(res,ires : integer): boolean;
begin
  //1° parte do cáculo p/ validação
  res := (res*10);
  if res mod 11 = 10 then
  begin
    res := 0;
  end
  else
  begin
    res :=res mod 11;
  end;
  if (res = n1) then
  begin
    validar := true;
  end;
  
  //2° parte do cálculo para validação
  ires := (ires*10);
  if ires mod 11 =10 then
  begin
    ires := 0;
  end
  else
  begin
    ires :=ires mod 11;
  end;
  if (ires = n2) then
  begin
    validar := true;
  end
  else
  begin
    validar := false;
  end;
end;

Begin
  entrada;
  ii;
  r := validar(res,ires);
  if validar(res, ires) = true then
  begin
    for cont := 2 to 10 do
    begin
      if (A[cont] = A[(cont+1)]) or (A[cont] = A[(cont-1)]) then
      begin
        repetidos := repetidos + 1;
      end;
    end;
    if repetidos >= 9 then
    begin
      writeln('O CPF não é válido.');
    end
    else
    begin
      writeln('O CPF é válido.');
    end;  
  end
  else
  begin
    writeln('O CPF não é válido.');
  end;
End.
