Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC196F9D4
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 15:18:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 30 Jan 2020 16:17:57 +0100
Message-Id: <20200130151757.14104-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_tiled_.*blits: skip the
 tests on newer gens
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcCB0aGUgdGVzdHMgb24gbmV3ZXIgZ2VucyB3aGVuIG5vIGZlbmNlcyBhcmUgYXZhaWxhYmxl
CmFuZCBnZW1fc2V0X3RpbGluZygpIGNhbm5vdCBzdWNjZWVkLgoKU2lnbmVkLW9mZi1ieTogWmJp
Z25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dl
bV90aWxlZF9ibGl0cy5jICAgICAgIHwgMSArCiB0ZXN0cy9pOTE1L2dlbV90aWxlZF9mZW5jZV9i
bGl0cy5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX3RpbGVkX2JsaXRzLmMgYi90ZXN0cy9pOTE1L2dlbV90aWxlZF9i
bGl0cy5jCmluZGV4IGRmMDY5OWYzLi5iYTA5MjBkYSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9n
ZW1fdGlsZWRfYmxpdHMuYworKysgYi90ZXN0cy9pOTE1L2dlbV90aWxlZF9ibGl0cy5jCkBAIC0y
MDQsNiArMjA0LDcgQEAgaWd0X21haW4KIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lO
VEVMKTsKIAkJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKIAkJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7
CisJCWdlbV9yZXF1aXJlX21hcHBhYmxlX2dndHQoZmQpOwogCiAJCWJ1Zm1nciA9IGRybV9pbnRl
bF9idWZtZ3JfZ2VtX2luaXQoZmQsIDQwOTYpOwogCQlkcm1faW50ZWxfYnVmbWdyX2dlbV9lbmFi
bGVfcmV1c2UoYnVmbWdyKTsKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3RpbGVkX2ZlbmNl
X2JsaXRzLmMgYi90ZXN0cy9pOTE1L2dlbV90aWxlZF9mZW5jZV9ibGl0cy5jCmluZGV4IDkzYzc5
ZGMyLi42MmZkMTMyOCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fdGlsZWRfZmVuY2VfYmxp
dHMuYworKysgYi90ZXN0cy9pOTE1L2dlbV90aWxlZF9mZW5jZV9ibGl0cy5jCkBAIC0yMTQsNiAr
MjE0LDcgQEAgaWd0X21haW4KIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsK
IAkJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKIAkJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7CisJCWdl
bV9yZXF1aXJlX21hcHBhYmxlX2dndHQoZmQpOwogCX0KIAogCWlndF9zdWJ0ZXN0KCJiYXNpYyIp
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
