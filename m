Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560FE89C86
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:55:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 15:54:36 +0200
Message-Id: <20210413135441.121421-34-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 33/38] tests/gem_ppgtt: Adopt test to
 use intel_bb with allocator
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

SW5pdGlhbGl6ZSBhbGxvY2F0b3Igd2l0aGluIGNoaWxkIHByb2Nlc3NlcyB0byBhdm9pZCBjcmVh
dGlvbiBhbGxvY2F0b3IKdGhyZWFkIGFuZCB1bm5lY2Vzc2FyeSBjb21tdW5pY2F0aW9uIHRvIGl0
LgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5
bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpl
a0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkFja2VkLWJ5
OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1
L2dlbV9wcGd0dC5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYyBiL3Rl
c3RzL2k5MTUvZ2VtX3BwZ3R0LmMKaW5kZXggNWY4YjM0MjI0Li5kYTgzNDg0YTYgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwpA
QCAtMTA0LDEyICsxMDQsMTQgQEAgc3RhdGljIHZvaWQgZm9ya19yY3NfY29weShpbnQgdGltZW91
dCwgdWludDMyX3QgZmluYWwsCiAJCXN0cnVjdCBpbnRlbF9idWYgKnNyYzsKIAkJdW5zaWduZWQg
bG9uZyBpOwogCisJCS8qIFN0YW5kYWxvbmUgYWxsb2NhdG9yICovCisJCWludGVsX2FsbG9jYXRv
cl9pbml0KCk7CisKIAkJaWYgKGZsYWdzICYgQ1JFQVRFX0NPTlRFWFQpCiAJCQljdHggPSBnZW1f
Y29udGV4dF9jcmVhdGUoYnVmX29wc19nZXRfZmQoZHN0W2NoaWxkXS0+Ym9wcykpOwogCiAJCWli
YiA9IGludGVsX2JiX2NyZWF0ZV93aXRoX2NvbnRleHQoYnVmX29wc19nZXRfZmQoZHN0W2NoaWxk
XS0+Ym9wcyksCiAJCQkJCQkgICBjdHgsIDQwOTYpOwotCiAJCWkgPSAwOwogCQlpZ3RfdW50aWxf
dGltZW91dCh0aW1lb3V0KSB7CiAJCQlzcmMgPSBjcmVhdGVfYm8oZHN0W2NoaWxkXS0+Ym9wcywK
QEAgLTE1MSw2ICsxNTMsOSBAQCBzdGF0aWMgdm9pZCBmb3JrX2Jjc19jb3B5KGludCB0aW1lb3V0
LCB1aW50MzJfdCBmaW5hbCwKIAkJc3RydWN0IGludGVsX2JiICppYmI7CiAJCXVuc2lnbmVkIGxv
bmcgaTsKIAorCQkvKiBTdGFuZGFsb25lIGFsbG9jYXRvciAqLworCQlpbnRlbF9hbGxvY2F0b3Jf
aW5pdCgpOworCiAJCWliYiA9IGludGVsX2JiX2NyZWF0ZShidWZfb3BzX2dldF9mZChkc3RbY2hp
bGRdLT5ib3BzKSwgNDA5Nik7CiAKIAkJaSA9IDA7Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
