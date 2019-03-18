Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122F289715
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 23:28:31 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Tue, 19 Mar 2019 01:28:12 +0200
Message-Id: <20190318232812.1307-8-andi.shyti@intel.com>
In-Reply-To: <20190318232812.1307-1-andi.shyti@intel.com>
References: <20190318232812.1307-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v12 7/7] tests: gem_exec_basic: add "exec-ctx"
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
LnNoeXRpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgfCAxNSAr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19i
YXNpYy5jCmluZGV4IGRjYjgzODY0YjFjMS4uMGY0MzdhMWFlZjcyIDEwMDY0NAotLS0gYS90ZXN0
cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5j
CkBAIC0xMzUsNiArMTM1LDIxIEBAIGlndF9tYWluCiAJCQlndHQoZmQsIGUtPmV4ZWNfaWQgfCBl
LT5mbGFncyk7CiAJfQogCisJaWd0X3N1YnRlc3QoImV4ZWMtY3R4IikgeworCQl1aW50MzJfdCBj
dHhfaWQ7CisJCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTI7CisJCXVpbnQ4X3Qg
aW5kZXhfbWFwID0gMDsKKworCQljdHhfaWQgPSBnZW1fY29udGV4dF9jcmVhdGUoZmQpOworCisJ
CWZvcl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZShmZCwgY3R4X2lkLCBlMikKKwkJCWlndF9h
c3NlcnQoZ2VtX3RvcG9sb2d5X2hhc19lbmdpbmUoZmQsIGUyLAorCQkJCQkJCSAgICsraW5kZXhf
bWFwLAorCQkJCQkJCSAgIGN0eF9pZCkpOworCisJCWdlbV9jb250ZXh0X2Rlc3Ryb3koZmQsIGN0
eF9pZCk7CisJfQorCiAJaWd0X2ZpeHR1cmUgewogCQlpZ3Rfc3RvcF9oYW5nX2RldGVjdG9yKCk7
CiAJCWNsb3NlKGZkKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
