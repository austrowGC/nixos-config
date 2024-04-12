final: prev: {
  discord = prev.discord.overrideAttrs (
    _: { src = builtins.fetchTarball {
      url = "https://discord.com/api/download?platform=linux&format=tar.gz";
      # change blank sha with actual value
      sha256 = (import ../sha256) "";
    };}
  );
}