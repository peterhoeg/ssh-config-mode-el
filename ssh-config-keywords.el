;;; ssh-config-keywords.el --- Keywords found in ~/.ssh/config
;;
;; ssh-config-mode-el/ssh-config-keywords.el ---
;;

;; Author:    Harley Gorrell <harley@panix.com>
;; URL:       https://github.com/jhgorrell/ssh-config-mode-el
;; Github:    https://raw.github.com/jhgorrell/ssh-config-mode-el/master/ssh-config-keywords.el
;; License:   GPL v3+ (https://www.gnu.org/licenses/gpl-3.0.txt)
;; Keywords:  ssh, config, emacs
;; Version:   $Revision: 1.14 $

;;; Commentary:
;; * Lists the ssh config keywords.

;;; History:
;; * This keeps checkdoc happy.

;;; License
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(eval-and-compile
  (defvar ssh-config-keywords
    '("AddKeysToAgent"
      "AddressFamily"
      "BadOption"
      "BatchMode"
      "BindAddress"
      "BindInterface"
      "CASignatureAlgorithms"
      "CanonicalDomains"
      "CanonicalizeFallbackLocal"
      "CanonicalizeHostname"
      "CanonicalizeMaxDots"
      "CanonicalizePermittedCNAMEs"
      "CertificateFile"
      "ChallengeResponseAuthentication"
      "CheckHostIP"
      "Ciphers"
      "ClearAllForwardings"
      "Compression"
      "ConnectTimeout"
      "ConnectionAttempts"
      "ControlMaster"
      "ControlPath"
      "ControlPersist"
      "Deprecated"
      "DynamicForward"
      "EnableSSHKeysign"
      "EscapeChar"
      "ExitOnForwardFailure"
      "FingerprintHash"
      "ForwardAgent"
      "ForwardX11"
      "ForwardX11Timeout"
      "ForwardX11Trusted"
      "GatewayPorts"
      "GlobalKnownHostsFile"
      "GssAuthentication"
      "GssDelegateCreds"
      "HashKnownHosts"
      "Host"
      "HostKeyAlgorithms"
      "HostKeyAlias"
      "HostbasedAuthentication"
      "HostbasedKeyTypes"
      "Hostname"
      "IPQoS"
      "IdentitiesOnly"
      "IdentityAgent"
      "IdentityFile"
      "Ignore"
      "IgnoreUnknown"
      "IgnoredUnknownOption"
      "Include"
      "KbdInteractiveAuthentication"
      "KbdInteractiveDevices"
      "KexAlgorithms"
      "LocalCommand"
      "LocalForward"
      "LogFacility"
      "LogLevel"
      "Macs"
      "Match"
      "NoHostAuthenticationForLocalhost"
      "NumberOfPasswordPrompts"
      "PKCS11Provider"
      "PasswordAuthentication"
      "PermitLocalCommand"
      "Port"
      "PreferredAuthentications"
      "ProxyCommand"
      "ProxyJump"
      "ProxyUseFdpass"
      "PubkeyAcceptedKeyTypes"
      "PubkeyAuthentication"
      "RekeyLimit"
      "RemoteCommand"
      "RemoteForward"
      "RequestTTY"
      "RevokedHostKeys"
      "SecurityKeyProvider"
      "SendEnv"
      "ServerAliveCountMax"
      "ServerAliveInterval"
      "SetEnv"
      "StreamLocalBindMask"
      "StreamLocalBindUnlink"
      "StrictHostKeyChecking"
      "TCPKeepAlive"
      "Tunnel"
      "TunnelDevice"
      "Unsupported"
      "UpdateHostkeys"
      "User"
      "UserKnownHostsFile"
      "VerifyHostKeyDNS"
      "VisualHostKey"
      "XAuthLocation")
    "A list of keywords allowed in a user ssh config file."))

(provide 'ssh-config-keywords)

;;; ssh-config-keywords.el ends here
