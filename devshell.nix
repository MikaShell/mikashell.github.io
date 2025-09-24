{
  mkShell,
  go,
  hugo,
  git,
  bun,
  ...
}: let
in
  mkShell {
    buildInputs = [
      go
      hugo
      git
      bun
    ];
  }
