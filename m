Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 7.mo173.mail-out.ovh.net (7.mo173.mail-out.ovh.net
 [46.105.44.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538216E5CB
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 01:47:45 +0000 (UTC)
Received: from player763.ha.ovh.net (unknown [10.109.146.1])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 01D22F9B60
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 03:07:55 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Fri,  5 Apr 2019 04:07:31 +0300
Message-Id: <20190405010737.19111-2-andi@etezian.org>
In-Reply-To: <20190405010737.19111-1-andi@etezian.org>
References: <20190405010737.19111-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v17 1/7] lib/igt_gt: remove unnecessary argument
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

RnJvbTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+CgpfX2Zvcl9lYWNoX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZShmZCwgZSkgZG9lc24ndCBuZWVkIGFuZCBkb2Vzbid0CnVzZSB0aGUg
ZmQgYXJndW1lbnQuIFJlbW92ZSBpdC4KClNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGku
c2h5dGlAaW50ZWwuY29tPgpDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4
LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+Ci0tLQogbGliL2lndF9ndC5oICAgICB8IDIgKy0KIHRlc3RzL3BlcmZfcG11LmMg
fCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZ3QuaCBiL2xpYi9pZ3RfZ3QuaAppbmRleCA1NGU5NWRh
OTgwODQuLjQ3NWMwYjNjM2NjNiAxMDA2NDQKLS0tIGEvbGliL2lndF9ndC5oCisrKyBiL2xpYi9p
Z3RfZ3QuaApAQCAtMTE0LDcgKzExNCw3IEBAIHZvaWQgZ2VtX3JlcXVpcmVfZW5naW5lKGludCBn
ZW1fZmQsCiAJaWd0X3JlcXVpcmUoZ2VtX2hhc19lbmdpbmUoZ2VtX2ZkLCBjbGFzcywgaW5zdGFu
Y2UpKTsKIH0KIAotI2RlZmluZSBfX2Zvcl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZShmZF9f
LCBlX18pIFwKKyNkZWZpbmUgX19mb3JfZWFjaF9lbmdpbmVfY2xhc3NfaW5zdGFuY2UoZV9fKSBc
CiAJZm9yICgoZV9fKSA9IGludGVsX2V4ZWN1dGlvbl9lbmdpbmVzMjsgKGVfXyktPm5hbWU7IChl
X18pKyspCiAKICNkZWZpbmUgZm9yX2VhY2hfZW5naW5lX2NsYXNzX2luc3RhbmNlKGZkX18sIGVf
XykgXApkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rlc3RzL3BlcmZfcG11LmMKaW5k
ZXggMWEwOGY1NjRiMDY2Li40ZjU1MmJjMmFlMjggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BlcmZfcG11
LmMKKysrIGIvdGVzdHMvcGVyZl9wbXUuYwpAQCAtMTY5Myw3ICsxNjkzLDcgQEAgaWd0X21haW4K
IAlpZ3Rfc3VidGVzdCgiaW52YWxpZC1pbml0IikKIAkJaW52YWxpZF9pbml0KCk7CiAKLQlfX2Zv
cl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZShmZCwgZSkgeworCV9fZm9yX2VhY2hfZW5naW5l
X2NsYXNzX2luc3RhbmNlKGUpIHsKIAkJY29uc3QgdW5zaWduZWQgaW50IHBjdFtdID0geyAyLCA1
MCwgOTggfTsKIAogCQkvKioKQEAgLTE4OTcsNyArMTg5Nyw3IEBAIGlndF9tYWluCiAJCQlnZW1f
cXVpZXNjZW50X2dwdShmZCk7CiAJCX0KIAotCQlfX2Zvcl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0
YW5jZShyZW5kZXJfZmQsIGUpIHsKKwkJX19mb3JfZWFjaF9lbmdpbmVfY2xhc3NfaW5zdGFuY2Uo
ZSkgewogCQkJaWd0X3N1YnRlc3RfZ3JvdXAgewogCQkJCWlndF9maXh0dXJlIHsKIAkJCQkJZ2Vt
X3JlcXVpcmVfZW5naW5lKHJlbmRlcl9mZCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
