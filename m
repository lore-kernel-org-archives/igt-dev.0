Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE94896BF
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 23:28:20 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Tue, 19 Mar 2019 01:28:06 +0200
Message-Id: <20190318232812.1307-2-andi.shyti@intel.com>
In-Reply-To: <20190318232812.1307-1-andi.shyti@intel.com>
References: <20190318232812.1307-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v12 1/7] lib/igt_gt: remove unnecessary argument
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

X19mb3JfZWFjaF9lbmdpbmVfY2xhc3NfaW5zdGFuY2UoZmQsIGUpIGRvZXNuJ3QgbmVlZCBhbmQg
ZG9lc24ndAp1c2UgdGhlIGZkIGFyZ3VtZW50LiBSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2d0LmggICAgIHwg
MiArLQogdGVzdHMvcGVyZl9wbXUuYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9ndC5oIGIvbGli
L2lndF9ndC5oCmluZGV4IDU0ZTk1ZGE5ODA4NC4uNDc1YzBiM2MzY2M2IDEwMDY0NAotLS0gYS9s
aWIvaWd0X2d0LmgKKysrIGIvbGliL2lndF9ndC5oCkBAIC0xMTQsNyArMTE0LDcgQEAgdm9pZCBn
ZW1fcmVxdWlyZV9lbmdpbmUoaW50IGdlbV9mZCwKIAlpZ3RfcmVxdWlyZShnZW1faGFzX2VuZ2lu
ZShnZW1fZmQsIGNsYXNzLCBpbnN0YW5jZSkpOwogfQogCi0jZGVmaW5lIF9fZm9yX2VhY2hfZW5n
aW5lX2NsYXNzX2luc3RhbmNlKGZkX18sIGVfXykgXAorI2RlZmluZSBfX2Zvcl9lYWNoX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZShlX18pIFwKIAlmb3IgKChlX18pID0gaW50ZWxfZXhlY3V0aW9uX2Vu
Z2luZXMyOyAoZV9fKS0+bmFtZTsgKGVfXykrKykKIAogI2RlZmluZSBmb3JfZWFjaF9lbmdpbmVf
Y2xhc3NfaW5zdGFuY2UoZmRfXywgZV9fKSBcCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5j
IGIvdGVzdHMvcGVyZl9wbXUuYwppbmRleCBhYTViOTkyMTJhYzUuLjQ1MjkxMjk4YzAyMSAxMDA2
NDQKLS0tIGEvdGVzdHMvcGVyZl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC0xNjkz
LDcgKzE2OTMsNyBAQCBpZ3RfbWFpbgogCWlndF9zdWJ0ZXN0KCJpbnZhbGlkLWluaXQiKQogCQlp
bnZhbGlkX2luaXQoKTsKIAotCV9fZm9yX2VhY2hfZW5naW5lX2NsYXNzX2luc3RhbmNlKGZkLCBl
KSB7CisJX19mb3JfZWFjaF9lbmdpbmVfY2xhc3NfaW5zdGFuY2UoZSkgewogCQljb25zdCB1bnNp
Z25lZCBpbnQgcGN0W10gPSB7IDIsIDUwLCA5OCB9OwogCiAJCS8qKgpAQCAtMTg5Nyw3ICsxODk3
LDcgQEAgaWd0X21haW4KIAkJCWdlbV9xdWllc2NlbnRfZ3B1KGZkKTsKIAkJfQogCi0JCV9fZm9y
X2VhY2hfZW5naW5lX2NsYXNzX2luc3RhbmNlKHJlbmRlcl9mZCwgZSkgeworCQlfX2Zvcl9lYWNo
X2VuZ2luZV9jbGFzc19pbnN0YW5jZShlKSB7CiAJCQlpZ3Rfc3VidGVzdF9ncm91cCB7CiAJCQkJ
aWd0X2ZpeHR1cmUgewogCQkJCQlnZW1fcmVxdWlyZV9lbmdpbmUocmVuZGVyX2ZkLAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
