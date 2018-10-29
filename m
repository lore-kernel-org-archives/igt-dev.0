Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F202B89BFB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 08:52:11 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e2-v6so6547622edn.2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 01:52:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 29 Oct 2018 09:52:04 +0100
Message-Id: <20181029085204.14547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: restore for
 real before failing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90aGluZyBoYXBwZW5zIGlmIHlvdSBkb24ndCBjb21taXQgLi4uCgp2MjogcmViYXNlZCE/CgpC
dWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4
NTUwCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMDg1NDkKQ2M6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KUmV2aWV3
ZWQtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29udGVudF9w
cm90ZWN0aW9uLmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKaW5kZXggMWU3ZDJi
OWU0ZTY5Li44MDFlZmY2NmMyNzIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3Rl
Y3Rpb24uYworKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKQEAgLTE3NSwxMiAr
MTc1LDExIEBAIHRlc3RfY3BfZW5hYmxlX2Rpc2FibGUoY29uc3QgZW51bSBwaXBlIHBpcGUsIGln
dF9vdXRwdXRfdCAqb3V0cHV0LAogCSAqICJjb250ZW50IHByb3RlY3Rpb24iIGF0ICJVTkRFU0lS
RUQiLgogCSAqLwogCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUob3V0cHV0LCBJR1RfQ09OTkVD
VE9SX0NPTlRFTlRfUFJPVEVDVElPTiwgMCk7Ci0KLQlpZ3RfYXNzZXJ0X2YocmV0LCAiQ29udGVu
dCBQcm90ZWN0aW9uIG5vdCBlbmFibGVkXG4iKTsKLQogCWlndF9wbGFuZV9zZXRfZmIocHJpbWFy
eSwgJnJlZCk7CiAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBzKTsKIAorCWlndF9hc3Nl
cnRfZihyZXQsICJDb250ZW50IFByb3RlY3Rpb24gbm90IGVuYWJsZWRcbiIpOworCiAJLyogV2Fp
dCBmb3IgSERDUCB0byBiZSBkaXNhYmxlZCwgYmVmb3JlIGNydGMgb2ZmICovCiAJd2FpdF9mb3Jf
cHJvcF92YWx1ZShvdXRwdXQsIDAsIDEwMDApOwogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
