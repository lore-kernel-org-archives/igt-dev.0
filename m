Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70366E09E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2019 10:36:46 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Thu, 29 Aug 2019 13:37:45 +0300
Message-Id: <20190829103745.28877-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_3d: fix uninitialized value
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
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIGRldmljZSBkb2Vzbid0IGhhdmUgYW55IEhETUkgY29ubmVjdG9ycywgZ2FyYmFnZSBp
cyByZWFkIGZyb20gdGhlIHN0YWNrLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5z
ZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc18zZC5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfM2QuYyBiL3Rlc3RzL2ttc18zZC5jCmluZGV4IGI5NzBiM2I1NTIxYy4uMjYyMmIyZDBhNmYz
IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfM2QuYworKysgYi90ZXN0cy9rbXNfM2QuYwpAQCAtMzAs
NyArMzAsNyBAQCBpZ3Rfc2ltcGxlX21haW4KIHsKIAlpbnQgZHJtX2ZkOwogCWRybU1vZGVSZXMg
KnJlczsKLQlkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3I7CisJZHJtTW9kZUNvbm5lY3RvciAq
Y29ubmVjdG9yID0gTlVMTDsKIAljb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgbW9kZV9j
b3VudCwgY29ubmVjdG9yX2lkOwoKQEAgLTQzLDE0ICs0MywxMCBAQCBpZ3Rfc2ltcGxlX21haW4K
CiAJLyogZmluZCBhbiBoZG1pIGNvbm5lY3RvciAqLwogCWZvciAoaW50IGkgPSAwOyBpIDwgcmVz
LT5jb3VudF9jb25uZWN0b3JzOyBpKyspIHsKLQogCQljb25uZWN0b3IgPSBkcm1Nb2RlR2V0Q29u
bmVjdG9yQ3VycmVudChkcm1fZmQsIHJlcy0+Y29ubmVjdG9yc1tpXSk7Ci0KIAkJaWYgKGNvbm5l
Y3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKQogCQkJYnJl
YWs7Ci0KIAkJZHJtTW9kZUZyZWVDb25uZWN0b3IoY29ubmVjdG9yKTsKLQogCQljb25uZWN0b3Ig
PSBOVUxMOwogCX0KIAlpZ3RfcmVxdWlyZShjb25uZWN0b3IpOwotLQoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
