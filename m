Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639389B20
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 14:12:13 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  5 Jul 2021 16:11:33 +0200
Message-Id: <20210705141133.10329-6-andrzej.turko@linux.intel.com>
In-Reply-To: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
References: <20210705141133.10329-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/i915/gem_exec_big: Require
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyB0ZXN0IG9ubHkgdmVyaWZpZXMgdGhlIGNvcnJlY3RuZXNzIG9mIHJlbG9jYXRpb25zCnNv
IGl0IHNob3VsZCBiZSBza2lwcGVkIGlmIHJ1bm5pbmcgb24gYSBwbGFmb3JtIHdoaWNoCmRvZXMg
bm90IHN1cHBvcnQgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogVHVya28gPGFuZHJ6ZWou
dHVya29AbGludXguaW50ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19iaWcuYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
aTkxNS9nZW1fZXhlY19iaWcuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmlnLmMKaW5kZXggMWY4
YzcyMGI2Li45ZWE0OWVlYzEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmlnLmMK
KysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iaWcuYwpAQCAtMzAzLDYgKzMwMyw3IEBAIGlndF9t
YWluCiAJaWd0X2ZpeHR1cmUgewogCQlpOTE1ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRF
TCk7CiAJCWlndF9yZXF1aXJlX2dlbShpOTE1KTsKKwkJaWd0X3JlcXVpcmUoZ2VtX2hhc19yZWxv
Y2F0aW9ucyhpOTE1KSk7CiAKIAkJdXNlXzY0Yml0X3JlbG9jcyA9IGludGVsX2dlbihpbnRlbF9n
ZXRfZHJtX2RldmlkKGk5MTUpKSA+PSA4OwogCX0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
