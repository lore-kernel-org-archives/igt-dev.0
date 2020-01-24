Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0996FF22
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 07:12:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 24 Jan 2020 08:12:46 +0100
Message-Id: <20200124071246.18147-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_collection: documentation fix
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

Rml4aW5nIGl0ZXJhdG9yIGRvY3VtZW50YXRpb24gd2hpY2ggd2Fzbid0IHByb3Blcmx5IHVwZGF0
ZWQgZHVyaW5nCndvcmtpbmcgb24gYSBwYXRjaC4KClJlcG9ydGVkLWJ5OiBBc2h1dG9zaCBEaXhp
dCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IFBldHJpIExhdHZh
bGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfY29sbGVjdGlvbi5jIHwg
OCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2NvbGxlY3Rpb24uYyBiL2xpYi9pZ3RfY29sbGVjdGlv
bi5jCmluZGV4IDM1ZTA5Yzg5Li42OWQ5Zjg2ZiAxMDA2NDQKLS0tIGEvbGliL2lndF9jb2xsZWN0
aW9uLmMKKysrIGIvbGliL2lndF9jb2xsZWN0aW9uLmMKQEAgLTEwMSwxMCArMTAxLDEwIEBACiAg
KgogICogaW50IGk7CiAgKiBzZXQgPSBpZ3RfY29sbGVjdGlvbl9jcmVhdGUoNCk7Ci0gKiBpdGVy
ID0gaWd0X2NvbGxlY3Rpb25faXRlcl9pbml0KHNldCwgMiwgU1VCU0VUKTsKLSAqIC8vaXRlciA9
IGlndF9jb2xsZWN0aW9uX2l0ZXJfaW5pdChzZXQsIDIsIENPTUJJTkFUSU9OKTsKLSAqIC8vaXRl
ciA9IGlndF9jb2xsZWN0aW9uX2l0ZXJfaW5pdChzZXQsIDIsIFZBUklBVElPTl9SKTsKLSAqIC8v
aXRlciA9IGlndF9jb2xsZWN0aW9uX2l0ZXJfaW5pdChzZXQsIDIsIFZBUklBVElPTl9OUik7Cisg
KiBpdGVyID0gaWd0X2NvbGxlY3Rpb25faXRlcl9jcmVhdGUoc2V0LCAyLCBTVUJTRVQpOworICog
Ly9pdGVyID0gaWd0X2NvbGxlY3Rpb25faXRlcl9jcmVhdGUoc2V0LCAyLCBDT01CSU5BVElPTik7
CisgKiAvL2l0ZXIgPSBpZ3RfY29sbGVjdGlvbl9pdGVyX2NyZWF0ZShzZXQsIDIsIFZBUklBVElP
Tl9SKTsKKyAqIC8vaXRlciA9IGlndF9jb2xsZWN0aW9uX2l0ZXJfY3JlYXRlKHNldCwgMiwgVkFS
SUFUSU9OX05SKTsKICAqCiAgKiBmb3IgKGkgPSAwOyBpIDwgc2V0LT5zaXplOyBpKyspIHsKICAq
ICAgICAgaWd0X2NvbGxlY3Rpb25fc2V0X3ZhbHVlKHNldCwgaSwgaSArIDEpOwotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
