Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF94189C37
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 17:14:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue,  4 Feb 2020 18:14:28 +0100
Message-Id: <20200204171428.16466-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_set_tiling_vs_pwrite:
 disable test on gens without fences
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

QWRkIGZlbmNlcyBjaGVjayByZXF1aXJlZCB0byBwcm9wZXJseSBkbyBzZXQtdGlsaW5nIG9uIGJv
LiBXZSBhbHNvCmRvbid0IHJlcXVpcmUgZ2d0dCBtYXBwaW5nIGJlY2F1c2UgY29oZXJlbnQgbWFw
cGluZyBpcyBlbm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpi
aWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRl
LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX3B3cml0ZS5jIGIv
dGVzdHMvaTkxNS9nZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYwppbmRleCAyNWEyODE5MS4uMDlk
YTNhZDYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRlLmMK
KysrIGIvdGVzdHMvaTkxNS9nZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYwpAQCAtNTUsMTIgKzU1
LDE0IEBAIGlndF9zaW1wbGVfbWFpbgogCXVpbnQzMl90IGhhbmRsZTsKIAogCWZkID0gZHJtX29w
ZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CisJaWd0X3JlcXVpcmUoZ2VtX2F2YWlsYWJsZV9mZW5j
ZXMoZmQpID4gMCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgT0JKRUNUX1NJWkUvNDsgaSsrKQogCQlk
YXRhW2ldID0gaTsKIAogCWhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIE9CSkVDVF9TSVpFKTsKLQlw
dHIgPSBnZW1fbW1hcF9fZ3R0KGZkLCBoYW5kbGUsIE9CSkVDVF9TSVpFLCBQUk9UX1JFQUQgfCBQ
Uk9UX1dSSVRFKTsKKwlwdHIgPSBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50KGZkLCBoYW5kbGUs
IDAsIE9CSkVDVF9TSVpFLAorCQkJCQlQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKIAogCWdlbV9z
ZXRfdGlsaW5nKGZkLCBoYW5kbGUsIEk5MTVfVElMSU5HX1gsIFRFU1RfU1RSSURFKTsKIAotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
