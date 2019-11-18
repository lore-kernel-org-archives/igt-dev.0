Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49A389700
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2019 10:17:34 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.91)
 (envelope-from <petri.latvala@intel.com>) id 1iWe67-0005vz-KC
 for igt-dev@lists.freedesktop.org; Mon, 18 Nov 2019 12:17:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 18 Nov 2019 12:17:31 +0200
Message-Id: <20191118101731.22772-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI PATCH i-g-t 1/1] i915/gem_exec_basic: Use dynamic
 subtests
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

SW5zdGVhZCBvZiBnZW5lcmF0aW5nIGEgc3VidGVzdCBmb3IgZWFjaCBlbmdpbmUgaW4gYSBzdGF0
aWMgbGlzdCwKY29udmVydCB0byBkeW5hbWljIHN1YnRlc3RzLCB3aXRoIG9uZSBkeW5hbWljIHN1
YnRlc3QgcGVyIGFjdHVhbGx5CnByZXNlbnQgcGh5c2ljYWwgZW5naW5lLgoKU2lnbmVkLW9mZi1i
eTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBL
YXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dl
bV9leGVjX2Jhc2ljLmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNpYy5jCmlu
ZGV4IDEyODc4NjBiLi5iMmQ2ZGRjMiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhlY19i
YXNpYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwpAQCAtMTU5LDEzICsxNTks
MjUgQEAgaWd0X21haW4KIAlpZ3Rfc3VidGVzdCgiZ3R0LWFsbCIpCiAJCWd0dF9hbGwoZmQpOwog
Ci0JX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGUpIHsKLQkJaWd0X3N1YnRlc3RfZigi
YmFzaWMtJXMiLCBlLT5uYW1lKQotCQkJbm9vcChmZCwgZS0+ZmxhZ3MpOwotCQlpZ3Rfc3VidGVz
dF9mKCJyZWFkb25seS0lcyIsIGUtPm5hbWUpCi0JCQlyZWFkb25seShmZCwgZS0+ZmxhZ3MpOwot
CQlpZ3Rfc3VidGVzdF9mKCJndHQtJXMiLCBlLT5uYW1lKQotCQkJZ3R0KGZkLCBlLT5mbGFncyk7
CisJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJiYXNpYyIpIHsKKwkJX19m
b3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGUpIHsKKwkJCWlndF9keW5hbWljX3N1YnN1YnRl
c3RfZigiJXMiLCBlLT5uYW1lKQorCQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKKwkJfQorCX0KKwor
CWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygicmVhZG9ubHkiKSB7CisJCV9f
Zm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7CisJCQlpZ3RfZHluYW1pY19zdWJzdWJ0
ZXN0X2YoIiVzIiwgZS0+bmFtZSkKKwkJCQlyZWFkb25seShmZCwgZS0+ZmxhZ3MpOworCQl9CisJ
fQorCisJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX3N1YnN1YnRlc3RzKCJndHQiKSB7CisJCV9f
Zm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7CisJCQlpZ3RfZHluYW1pY19zdWJzdWJ0
ZXN0X2YoIiVzIiwgZS0+bmFtZSkKKwkJCQlndHQoZmQsIGUtPmZsYWdzKTsKKwkJfQogCX0KIAog
CWlndF9maXh0dXJlIHsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
