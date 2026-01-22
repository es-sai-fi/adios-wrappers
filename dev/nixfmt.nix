{ nixfmt, fetchFromGitHub }:

nixfmt.overrideAttrs {
  src = fetchFromGitHub {
    owner = "llakala";
    repo = "nixfmt";
    rev = "45e43e0804c81ca7eef84d823d9eb1a43a96bf0a";
    hash = "sha256-4+V35M39Pc4tiEkWn7n/sK2FQ9bB94baSJ857xhGEyw=";
  };
}
