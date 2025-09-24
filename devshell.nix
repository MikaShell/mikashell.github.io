{
  mkShell,
  go,
  hugo,
  git,
  nodejs_24,
  ...
}: let
in
  mkShell {
    buildInputs = [
      go
      hugo
      git
      nodejs_24
    ];
  }
