Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFDE6ECDD
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 14:18:55 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 31 Jan 2019 15:18:52 +0100
Message-Id: <20190131141852.14187-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190131141852.14187-1-maarten.lankhorst@linux.intel.com>
References: <20190131141852.14187-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_frontbuffer_tracking: Fix
 skips when PSR is not available.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VXNlIHBzci5jYW5fdGVzdCB0byBkZXRlcm1pbmUgd2UgY2FuIGRpc2FibGUgUFNSLCBhbmQgbm90
IHNraXAgYmVjYXVzZQpQU1IgaXMgdW5hdmFpbGFibGUuCgpDYzogRGhpbmFrYXJhbiBQYW5kaXlh
biA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+CkNjOiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X3Bzci5j
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggNWVi
NmQyYzZhY2U1Li42YWQyYzUyMmY5YTQgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcHNyLmMKKysrIGIv
bGliL2lndF9wc3IuYwpAQCAtMTA2LDcgKzEwNiw3IEBAIHN0YXRpYyBib29sIHBzcl9zZXQoaW50
IGRlYnVnZnNfZmQsIGludCBtb2RlKQogCiAJcmV0ID0gaGFzX3Bzcl9kZWJ1Z2ZzKGRlYnVnZnNf
ZmQpOwogCWlmIChyZXQgPT0gLUVOT0RFVikgewotCQlpZ3Rfc2tpcF9vbl9mKG1vZGUgPj0gUFNS
X01PREVfMSwgIlBTUiBub3QgYXZhaWxhYmxlXG4iKTsKKwkJaWd0X3NraXAoIlBTUiBub3QgYXZh
aWxhYmxlXG4iKTsKIAkJcmV0dXJuIGZhbHNlOwogCX0KIApkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YwppbmRleCA2MDlmN2I0MWE1MjcuLjRkMTVjZTFjZjFkNiAxMDA2NDQKLS0tIGEvdGVzdHMva21z
X2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNr
aW5nLmMKQEAgLTExMzQsNyArMTEzNCw3IEBAIHN0YXRpYyBib29sIGRpc2FibGVfZmVhdHVyZXMo
Y29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkKIAogCWZiY19kaXNhYmxlKCk7CiAJZHJyc19kaXNh
YmxlKCk7Ci0JcmV0dXJuIHBzcl9kaXNhYmxlKGRybS5kZWJ1Z2ZzKTsKKwlyZXR1cm4gcHNyLmNh
bl90ZXN0ID8gcHNyX2Rpc2FibGUoZHJtLmRlYnVnZnMpIDogZmFsc2U7CiB9CiAKIHN0YXRpYyB2
b2lkICpidXN5X3RocmVhZF9mdW5jKHZvaWQgKmRhdGEpCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
