Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A036892E0
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 08:46:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue,  4 Jun 2019 11:46:12 +0300
Message-Id: <20190604084612.13950-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf_pmu: Actually require engines again
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gY29tbWl0IDMyZTQyMWY2Zjc0YSAoInRlc3Q6IHBlcmZfcG11OiB1c2UgdGhlIGdlbV9lbmdp
bmVfdG9wb2xvZ3kKbGlicmFyeSIpIHBlcmZfcG11IHdhcyBjb252ZXJ0ZWQgdG8gdXNlIGdlbV9j
b250ZXh0X2hhc19lbmdpbmUoKQppbnN0ZWFkIG9mIGdlbV9yZXF1aXJlX2VuZ2luZSwgYnV0IG1p
c3NpbmcgdGhlIGNydWNpYWwgcGFydCBvZgppZ3RfcmVxdWlyZSgpLgoKU2lnbmVkLW9mZi1ieTog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBp
bnRlbC5jb20+Ci0tLQogdGVzdHMvcGVyZl9wbXUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3Bl
cmZfcG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4IDcyYjkxNjZhLi5mZGFmOTZkYSAxMDA2
NDQKLS0tIGEvdGVzdHMvcGVyZl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC0xNzE0
LDcgKzE3MTQsNyBAQCBpZ3RfbWFpbgogCiAJCWlndF9zdWJ0ZXN0X2dyb3VwIHsKIAkJCWlndF9m
aXh0dXJlIHsKLQkJCQlnZW1fY29udGV4dF9oYXNfZW5naW5lKGZkLCAwLCBlLT5mbGFncyk7CisJ
CQkJaWd0X3JlcXVpcmUoZ2VtX2NvbnRleHRfaGFzX2VuZ2luZShmZCwgMCwgZS0+ZmxhZ3MpKTsK
IAkJCX0KIAogCQkJLyoqCkBAIC0xOTAzLDggKzE5MDMsOCBAQCBpZ3RfbWFpbgogCQlfX2Zvcl9l
YWNoX3BoeXNpY2FsX2VuZ2luZShyZW5kZXJfZmQsIGUpIHsKIAkJCWlndF9zdWJ0ZXN0X2dyb3Vw
IHsKIAkJCQlpZ3RfZml4dHVyZSB7Ci0JCQkJCWdlbV9jb250ZXh0X2hhc19lbmdpbmUocmVuZGVy
X2ZkLAotCQkJCQkJCSAgIDAsIGUtPmZsYWdzKTsKKwkJCQkJaWd0X3JlcXVpcmUoZ2VtX2NvbnRl
eHRfaGFzX2VuZ2luZShyZW5kZXJfZmQsCisJCQkJCQkJCQkgICAwLCBlLT5mbGFncykpOwogCQkJ
CX0KIAogCQkJCWlndF9zdWJ0ZXN0X2YoInJlbmRlci1ub2RlLWJ1c3ktJXMiLCBlLT5uYW1lKQot
LSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
