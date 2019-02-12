Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053A86E6BA
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Feb 2019 23:54:55 +0000 (UTC)
Date: Wed, 13 Feb 2019 01:54:36 +0200
Message-Id: <20190212235437.1218-6-andi.shyti@intel.com>
In-Reply-To: <20190212235437.1218-1-andi.shyti@intel.com>
References: <20190212235437.1218-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH v8 5/5] tests: gem_exec_basic: add "exec-ctx"
 buffer execution demo test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Andi Shyti via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Andi Shyti <andi.shyti@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlICJleGVjLWN0eCIgaXMgYSBkZW1vIHN1YnRlc3QgaW5zZXJ0ZWQgaW4gdGhlIGdlbV9leGVj
X2Jhc2ljCnRlc3QuIFRoZSBtYWluIGdvYWwgb2YgdGhlIHRlc3QgaXMgdG8gZ2V0IHRvIHRoZSBl
bmdpbmVzIGJ5IHVzaW5nCnRoZSBuZXcgQVBJIGFzIGltcGxlbWVudGVkIGluIGluIGNvbW1pdCA4
NzA3OWUwNCAoImxpYjogaW1wbGVtZW50Cm5ldyBlbmdpbmUgZGlzY292ZXJ5IGludGVyZmFjZSIp
LgoKVGhlICJleGVjLWN0eCIgc3VidGVzdCBzaW1wbHkgZ2V0cyB0aGUgbGlzdCBvZiBlbmdpbmVz
LCBiaW5kcwp0aGVtIHRvIGEgY29udGV4dCBhbmQgZXhlY3V0ZXMgYSBidWZmZXIuIFRoaXMgaXMg
ZG9uZSB0aHJvdWdoIGEKbmV3ICJmb3JfZWFjaF9lbmdpbmVfY3R4IiBsb29wIHdoaWNoIGl0ZXJh
dGVzIHRocm91Z2ggdGhlCmVuZ2luZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRp
LnNoeXRpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgfCAxNSAr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19i
YXNpYy5jCmluZGV4IGRjYjgzODY0YjFjMS4uZGMyZDc5YTBjNzNiIDEwMDY0NAotLS0gYS90ZXN0
cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5j
CkBAIC0xMzUsNiArMTM1LDIxIEBAIGlndF9tYWluCiAJCQlndHQoZmQsIGUtPmV4ZWNfaWQgfCBl
LT5mbGFncyk7CiAJfQogCisJaWd0X3N1YnRlc3QoImV4ZWMtY3R4IikgeworCQl1aW50MzJfdCBj
dHhfaWQ7CisJCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTI7CisJCWludCBpbmRl
eF9tYXAgPSAwOworCisJCWlndF9yZXF1aXJlX2dlbV9lbmdpbmVfbGlzdChmZCk7CisJCWN0eF9p
ZCA9IGdlbV9jb250ZXh0X2NyZWF0ZShmZCk7CisKKwkJZm9yX2VhY2hfZW5naW5lMihmZCwgY3R4
X2lkLCBlMikKKwkJCWlndF9hc3NlcnQoZ2VtX2hhc19yaW5nX2J5X2lkeChmZCwgKytpbmRleF9t
YXAsCisJCQkJCQkgICAgICAgY3R4X2lkKSk7CisKKwkJZ2VtX2NvbnRleHRfZGVzdHJveShmZCwg
Y3R4X2lkKTsKKwl9CisKIAlpZ3RfZml4dHVyZSB7CiAJCWlndF9zdG9wX2hhbmdfZGV0ZWN0b3Io
KTsKIAkJY2xvc2UoZmQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
