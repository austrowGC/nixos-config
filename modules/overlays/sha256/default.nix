let
  inherit nixpkgs lib lists foldr replicate;
  add = a: b: a+b;
  concat = foldr add "";
  zeros = n: replicate n "0";
  blank = concat zeros 52;
in
sha256: if "" == sha256
  then blank
  else sha256
