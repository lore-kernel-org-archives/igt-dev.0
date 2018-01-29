Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3636E445
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2018 12:13:24 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 29 Jan 2018 12:03:47 +0000
Message-Id: <20180129120347.29287-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/perf: fix report validity check on
 gen10+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50
ZWwuY29tPgpUZXN0Y2FzZTogaWd0L3BlcmYvYnVmZmVyLWZpbGwgJiBpZ3QvcGVyZi9lbmFibGUt
ZGlzYWJsZSAmIGlndC9wZXJmL2dlbjgtdW5wcml2aWxlZ2VkLXNpbmdsZS1jdHgtY291bnRlcnMK
QnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEw
NDY1OAotLS0KIHRlc3RzL3BlcmYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmYuYyBiL3Rlc3RzL3Bl
cmYuYwppbmRleCBhMTczNjgwYy4uNTVkNmU5ZWEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BlcmYuYwor
KysgYi90ZXN0cy9wZXJmLmMKQEAgLTQ3Myw3ICs0NzMsNyBAQCBvYV9yZXBvcnRfY3R4X2lzX3Zh
bGlkKHVpbnQzMl90ICpyZXBvcnQpCiAJCXJldHVybiBmYWxzZTsgLyogVE9ETyAqLwogCX0gZWxz
ZSBpZiAoSVNfR0VOOChkZXZpZCkpIHsKIAkJcmV0dXJuIHJlcG9ydFswXSAmICgxdWwgPDwgMjUp
OwotCX0gZWxzZSBpZiAoSVNfR0VOOShkZXZpZCkpIHsKKwl9IGVsc2UgaWYgKEFUX0xFQVNUX0dF
TihkZXZpZCwgOSkpIHsKIAkJcmV0dXJuIHJlcG9ydFswXSAmICgxdWwgPDwgMTYpOwogCX0KIAot
LSAKMi4xNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
