Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912336E410
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jul 2018 13:39:54 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 27 Jul 2018 16:39:48 +0300
Message-Id: <20180727133948.24653-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] meson: Fixup gem_mocs_settings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXJlaydzIHJwYXRoIGZpeGVzIGNvaW5jaWRlZCB3aXRoIGNvbW1pdCBmZjkxZGJjODdlZWMKKCJp
Z3QvZ2VtX21vY3Nfc2V0dGluZ3M6IFVzZSBpOTE1X3BtdSB0byBtZWFzdXJlIHJjNgpyZXNpZGVu
Y3kiKS4gSW5jbHVkZSB0aGUgcmVsZXZhbnQgY2hhbmdlIHRoZXJlIHRvby4KCkZpeGVzOiBmZjkx
ZGJjODdlZWMgKCJpZ3QvZ2VtX21vY3Nfc2V0dGluZ3M6IFVzZSBpOTE1X3BtdSB0byBtZWFzdXJl
CnJjNiByZXNpZGVuY3kiKQpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50
ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25l
ZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRl
c3RzL21lc29uLmJ1aWxkIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9tZXNv
bi5idWlsZAppbmRleCA4M2IyNzMyZi4uYmI2Yzc2MjcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21lc29u
LmJ1aWxkCisrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCkBAIC0yODEsNyArMjgxLDcgQEAgdGVzdF9w
cm9ncyArPSAnZ2VtX2VpbycKIHRlc3RfZXhlY3V0YWJsZXMgKz0gZXhlY3V0YWJsZSgnZ2VtX21v
Y3Nfc2V0dGluZ3MnLCAnZ2VtX21vY3Nfc2V0dGluZ3MuYycsCiAJICAgZGVwZW5kZW5jaWVzIDog
dGVzdF9kZXBzICsgWyBsaWJfaWd0X3BlcmYgXSwKIAkgICBpbnN0YWxsX2RpciA6IGxpYmV4ZWNk
aXIsCi0JICAgaW5zdGFsbF9ycGF0aCA6IHJwYXRoZGlyLAorCSAgIGluc3RhbGxfcnBhdGggOiBs
aWJleGVjZGlyX3JwYXRoZGlyLAogCSAgIGluc3RhbGwgOiB0cnVlKQogdGVzdF9wcm9ncyArPSAn
Z2VtX21vY3Nfc2V0dGluZ3MnCiAKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
