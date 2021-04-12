Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1E66E530
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 11:18:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 12 Apr 2021 13:18:02 +0200
Message-Id: <20210412111808.137038-34-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
References: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v32 33/39] tests/gem_ppgtt: Adopt test to
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
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogdGVz
dHMvaTkxNS9nZW1fcHBndHQuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0
LmMgYi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCmluZGV4IDVmOGIzNDIyNC4uZGE4MzQ4NGE2IDEw
MDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3Bw
Z3R0LmMKQEAgLTEwNCwxMiArMTA0LDE0IEBAIHN0YXRpYyB2b2lkIGZvcmtfcmNzX2NvcHkoaW50
IHRpbWVvdXQsIHVpbnQzMl90IGZpbmFsLAogCQlzdHJ1Y3QgaW50ZWxfYnVmICpzcmM7CiAJCXVu
c2lnbmVkIGxvbmcgaTsKIAorCQkvKiBTdGFuZGFsb25lIGFsbG9jYXRvciAqLworCQlpbnRlbF9h
bGxvY2F0b3JfaW5pdCgpOworCiAJCWlmIChmbGFncyAmIENSRUFURV9DT05URVhUKQogCQkJY3R4
ID0gZ2VtX2NvbnRleHRfY3JlYXRlKGJ1Zl9vcHNfZ2V0X2ZkKGRzdFtjaGlsZF0tPmJvcHMpKTsK
IAogCQlpYmIgPSBpbnRlbF9iYl9jcmVhdGVfd2l0aF9jb250ZXh0KGJ1Zl9vcHNfZ2V0X2ZkKGRz
dFtjaGlsZF0tPmJvcHMpLAogCQkJCQkJICAgY3R4LCA0MDk2KTsKLQogCQlpID0gMDsKIAkJaWd0
X3VudGlsX3RpbWVvdXQodGltZW91dCkgewogCQkJc3JjID0gY3JlYXRlX2JvKGRzdFtjaGlsZF0t
PmJvcHMsCkBAIC0xNTEsNiArMTUzLDkgQEAgc3RhdGljIHZvaWQgZm9ya19iY3NfY29weShpbnQg
dGltZW91dCwgdWludDMyX3QgZmluYWwsCiAJCXN0cnVjdCBpbnRlbF9iYiAqaWJiOwogCQl1bnNp
Z25lZCBsb25nIGk7CiAKKwkJLyogU3RhbmRhbG9uZSBhbGxvY2F0b3IgKi8KKwkJaW50ZWxfYWxs
b2NhdG9yX2luaXQoKTsKKwogCQlpYmIgPSBpbnRlbF9iYl9jcmVhdGUoYnVmX29wc19nZXRfZmQo
ZHN0W2NoaWxkXS0+Ym9wcyksIDQwOTYpOwogCiAJCWkgPSAwOwotLSAKMi4yNi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
