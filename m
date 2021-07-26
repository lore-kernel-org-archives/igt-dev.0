Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9DF6E95C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 13:47:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 15:45:43 +0200
Message-Id: <20210726134616.49873-20-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 19/52] tests/gem_exec_big: Require
 relocation support
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQW5kcnplaiBUdXJrbyA8YW5kcnplai50dXJrb0BsaW51eC5pbnRlbC5jb20+CgpUaGlz
IHRlc3Qgb25seSB2ZXJpZmllcyB0aGUgY29ycmVjdG5lc3Mgb2YgcmVsb2NhdGlvbnMgc28gaXQg
c2hvdWxkIGJlCnNraXBwZWQgaWYgcnVubmluZyBvbiBhIHBsYXRmb3JtIHdoaWNoIGRvZXMgbm90
IHN1cHBvcnQgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogVHVya28gPGFuZHJ6ZWoudHVy
a29AbGludXguaW50ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5r
ZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4KQ2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0t
LQogdGVzdHMvaTkxNS9nZW1fZXhlY19iaWcuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iaWcuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmlnLmMKaW5kZXggMWY4YzcyMGI2Li45ZWE0OWVlYzEgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmlnLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19i
aWcuYwpAQCAtMzAzLDYgKzMwMyw3IEBAIGlndF9tYWluCiAJaWd0X2ZpeHR1cmUgewogCQlpOTE1
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CiAJCWlndF9yZXF1aXJlX2dlbShpOTE1
KTsKKwkJaWd0X3JlcXVpcmUoZ2VtX2hhc19yZWxvY2F0aW9ucyhpOTE1KSk7CiAKIAkJdXNlXzY0
Yml0X3JlbG9jcyA9IGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGk5MTUpKSA+PSA4Owog
CX0KLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
