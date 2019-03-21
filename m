Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610C989E69
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 16:05:41 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Thu, 21 Mar 2019 18:05:28 +0200
Message-Id: <20190321160528.4131-6-andi.shyti@intel.com>
In-Reply-To: <20190321160528.4131-1-andi.shyti@intel.com>
References: <20190321160528.4131-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v15 5/5] tests: gem_exec_basic: add "exec-ctx"
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
aWMuYwppbmRleCBkY2I4Mzg2NGIxYzEuLjcxNDk0NTJhNzJmMCAxMDA2NDQKLS0tIGEvdGVzdHMv
aTkxNS9nZW1fZXhlY19iYXNpYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwpA
QCAtMTM1LDYgKzEzNSwxOSBAQCBpZ3RfbWFpbgogCQkJZ3R0KGZkLCBlLT5leGVjX2lkIHwgZS0+
ZmxhZ3MpOwogCX0KIAorCWlndF9zdWJ0ZXN0KCJleGVjLWN0eCIpIHsKKwkJdWludDMyX3QgY3R4
X2lkOworCQlzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUyOworCisJCWN0eF9pZCA9
IGdlbV9jb250ZXh0X2NyZWF0ZShmZCk7CisKKwkJZm9yX2VhY2hfY29udGV4dF9lbmdpbmUoZmQs
IGN0eF9pZCwgZTIpCisJCQlpZ3RfYXNzZXJ0KGdlbV9jb250ZXh0X2hhc19lbmdpbmUoZmQsIGUy
LT5mbGFncywKKwkJCQkJCQkgIGN0eF9pZCkpOworCisJCWdlbV9jb250ZXh0X2Rlc3Ryb3koZmQs
IGN0eF9pZCk7CisJfQorCiAJaWd0X2ZpeHR1cmUgewogCQlpZ3Rfc3RvcF9oYW5nX2RldGVjdG9y
KCk7CiAJCWNsb3NlKGZkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
