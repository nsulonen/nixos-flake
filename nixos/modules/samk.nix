{ ... }:

{
  networking.networkmanager.ensureProfiles = {
    "SAMK-STUDENT" = {
      type = "wifi";
      interface-name = "wlp4s0";
      autoconnect = true;
      ssid = "SAMK-STUDENT";
      wifi-sec.key-mgmt = "wpa-eap";
      "802-1x".eap = "peap";
      "801-1x".identity = "sa32999";
      "802-1x".phase2-auth = "mschapv2";
      "802-1x".domain = "samk.fi";
      "802-1x".altsubject-matches = "radius-student.samk.fi";
      "802-1x".system-ca-certs = true;
      "802-1x".password-flags = 1;
    };
  };
}
