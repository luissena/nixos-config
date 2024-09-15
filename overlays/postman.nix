final: prev: {
  postman = prev.postman.overrideAttrs (old: {
    src = final.fetchurl {
      url = "https://dl.pstmn.io/download/latest/linux_64";
      sha256 = "sha256-SwDRI5bRn5OKRjUHDeUW7PHxqglwWvIOndhvtYf4kss=";

      name = "${old.pname}-latest.tar.gz";
    };
  });
}
