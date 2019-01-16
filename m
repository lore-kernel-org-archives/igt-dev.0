Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5E76EFD6
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:47 +0200
Message-Id: <20190116112050.27647-19-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 18/21] lib/igt_core: Initialize fds in
 igt_system_quiet
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

VGhpcyBhdm9pZHMgY2FsbGluZyBjbG9zZSgpIHdpdGggdW5pbml0aWFsaXplZCBpbnRzIGlmIHNv
bWUgZHVwKCkKY2FsbHMgc3VjY2VlZCBhbmQgb3RoZXJzIGRvbid0LgoKU2lnbmVkLW9mZi1ieTog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBBYmRpZWwgSmFudWxn
dWUgPGFiZGllbC5qYW51bGd1ZUBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9jb3JlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29yZS5jCmluZGV4IDBjYWU5YjZh
Li40OWZiZjcwZCAxMDA2NDQKLS0tIGEvbGliL2lndF9jb3JlLmMKKysrIGIvbGliL2lndF9jb3Jl
LmMKQEAgLTIzOTEsNyArMjM5MSw3IEBAIGVycjoKICAqLwogaW50IGlndF9zeXN0ZW1fcXVpZXQo
Y29uc3QgY2hhciAqY29tbWFuZCkKIHsKLQlpbnQgc3RkZXJyX2ZkX2NvcHksIHN0ZG91dF9mZF9j
b3B5LCBzdGF0dXMsIG51bGxmZDsKKwlpbnQgc3RkZXJyX2ZkX2NvcHkgPSAtMSwgc3Rkb3V0X2Zk
X2NvcHkgPSAtMSwgc3RhdHVzLCBudWxsZmQgPSAtMTsKIAogCS8qIHJlZGlyZWN0ICovCiAJaWYg
KChudWxsZmQgPSBvcGVuKCIvZGV2L251bGwiLCBPX1dST05MWSkpID09IC0xKQotLSAKMi4xOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
