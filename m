Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3C56E432
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Mar 2021 18:01:56 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 16 Mar 2021 19:00:48 +0100
Message-Id: <20210316180051.59599-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210316180051.59599-1-zbigniew.kempczynski@intel.com>
References: <20210316180051.59599-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v25 32/35] tests/gem_ppgtt: Adopt test to
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
LS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9n
ZW1fcHBndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKaW5kZXggNWY4YjM0MjI0Li5kYTgz
NDg0YTYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKKysrIGIvdGVzdHMvaTkx
NS9nZW1fcHBndHQuYwpAQCAtMTA0LDEyICsxMDQsMTQgQEAgc3RhdGljIHZvaWQgZm9ya19yY3Nf
Y29weShpbnQgdGltZW91dCwgdWludDMyX3QgZmluYWwsCiAJCXN0cnVjdCBpbnRlbF9idWYgKnNy
YzsKIAkJdW5zaWduZWQgbG9uZyBpOwogCisJCS8qIFN0YW5kYWxvbmUgYWxsb2NhdG9yICovCisJ
CWludGVsX2FsbG9jYXRvcl9pbml0KCk7CisKIAkJaWYgKGZsYWdzICYgQ1JFQVRFX0NPTlRFWFQp
CiAJCQljdHggPSBnZW1fY29udGV4dF9jcmVhdGUoYnVmX29wc19nZXRfZmQoZHN0W2NoaWxkXS0+
Ym9wcykpOwogCiAJCWliYiA9IGludGVsX2JiX2NyZWF0ZV93aXRoX2NvbnRleHQoYnVmX29wc19n
ZXRfZmQoZHN0W2NoaWxkXS0+Ym9wcyksCiAJCQkJCQkgICBjdHgsIDQwOTYpOwotCiAJCWkgPSAw
OwogCQlpZ3RfdW50aWxfdGltZW91dCh0aW1lb3V0KSB7CiAJCQlzcmMgPSBjcmVhdGVfYm8oZHN0
W2NoaWxkXS0+Ym9wcywKQEAgLTE1MSw2ICsxNTMsOSBAQCBzdGF0aWMgdm9pZCBmb3JrX2Jjc19j
b3B5KGludCB0aW1lb3V0LCB1aW50MzJfdCBmaW5hbCwKIAkJc3RydWN0IGludGVsX2JiICppYmI7
CiAJCXVuc2lnbmVkIGxvbmcgaTsKIAorCQkvKiBTdGFuZGFsb25lIGFsbG9jYXRvciAqLworCQlp
bnRlbF9hbGxvY2F0b3JfaW5pdCgpOworCiAJCWliYiA9IGludGVsX2JiX2NyZWF0ZShidWZfb3Bz
X2dldF9mZChkc3RbY2hpbGRdLT5ib3BzKSwgNDA5Nik7CiAKIAkJaSA9IDA7Ci0tIAoyLjI2LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
