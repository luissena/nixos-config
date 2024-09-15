final: prev: {
  postman = prev.postman.overrideAttrs (old: {
    src = final.fetchurl {
      url = "https://dl.pstmn.io/download/latest/linux_64";
      sha256 = "sha256-2p6/VxUeb9TcYBOhRoyZpWBOwNnE/d17rtBMFL6VSN0=";

      name = "${old.pname}-latest.tar.gz";
    };
  });
}
