Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A017C89D7C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 01:00:29 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Thu, 21 Mar 2019 03:00:15 +0200
Message-Id: <20190321010015.1317-6-andi.shyti@intel.com>
In-Reply-To: <20190321010015.1317-1-andi.shyti@intel.com>
References: <20190321010015.1317-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v14 5/5] tests: gem_exec_basic: add "exec-ctx"
 buffer execution demo test
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlICJleGVjLWN0eCIgaXMgYSBkZW1vIHN1YnRlc3QgaW5zZXJ0ZWQgaW4gdGhlIGdlbV9leGVj
X2Jhc2ljCnRlc3QuIFRoZSBtYWluIGdvYWwgaXMgdG8gcmVhY2ggdGhlIGVuZ2luZXMgYnkgdXNp
bmcKdGhlIG5ldyB1YXBpIGludGVyZmFjaW5nIHdpdGggJ2dlbV90b3BvbG9neV9oYXNfZW5naW5l
KCknLgoKVGhlICJleGVjLWN0eCIgc3VidGVzdCBzaW1wbHkgZ2V0cyB0aGUgbGlzdCBvZiBlbmdp
bmVzLCBiaW5kcwp0aGVtIHRvIGEgY29udGV4dCBhbmQgZXhlY3V0ZXMgYSBidWZmZXIuIFRoaXMg
aXMgZG9uZSB0aHJvdWdoIGEKbmV3ICJmb3JfZWFjaF9lbmdpbmUyIiBsb29wIHdoaWNoIGl0ZXJh
dGVzIHRocm91Z2ggdGhlCmVuZ2luZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRp
LnNoeXRpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgfCAxMyAr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFz
aWMuYwppbmRleCBkY2I4Mzg2NGIxYzEuLmM0YTQ4OWJkZDEwMCAxMDA2NDQKLS0tIGEvdGVzdHMv
aTkxNS9nZW1fZXhlY19iYXNpYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwpA
QCAtMTM1LDYgKzEzNSwxOSBAQCBpZ3RfbWFpbgogCQkJZ3R0KGZkLCBlLT5leGVjX2lkIHwgZS0+
ZmxhZ3MpOwogCX0KIAorCWlndF9zdWJ0ZXN0KCJleGVjLWN0eCIpIHsKKwkJdWludDMyX3QgY3R4
X2lkOworCQlzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUyOworCisJCWN0eF9pZCA9
IGdlbV9jb250ZXh0X2NyZWF0ZShmZCk7CisKKwkJZm9yX2VhY2hfZW5naW5lX2NsYXNzX2luc3Rh
bmNlKGZkLCBjdHhfaWQsIGUyKQorCQkJaWd0X2Fzc2VydChnZW1fY29udGV4dF9oYXNfZW5naW5l
KGZkLCBlMi0+ZmxhZ3MsCisJCQkJCQkJICBjdHhfaWQpKTsKKworCQlnZW1fY29udGV4dF9kZXN0
cm95KGZkLCBjdHhfaWQpOworCX0KKwogCWlndF9maXh0dXJlIHsKIAkJaWd0X3N0b3BfaGFuZ19k
ZXRlY3RvcigpOwogCQljbG9zZShmZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
