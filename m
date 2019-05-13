Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EE96E7D2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 17:56:33 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Mon, 13 May 2019 20:56:07 +0300
Message-Id: <20190513175613.2507-9-andi.shyti@intel.com>
In-Reply-To: <20190513175613.2507-1-andi.shyti@intel.com>
References: <20190513175613.2507-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v24 08/14] test/i915: gem_cs_tlb: use the
 gem_engine_topology library
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVz
CmltcGxlbWVudGVkIGluIHRoZSBnZW1fZW5naW5lX3RvcG9sb2d5IGxpYnJhcnkuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fY3NfdGxiLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jIGIvdGVzdHMvaTkxNS9nZW1fY3NfdGxiLmMKaW5k
ZXggNTFlMWM0ZTE5OTMwLi4xM2RlNTQ5OWYxYzcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2Vt
X2NzX3RsYi5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2NzX3RsYi5jCkBAIC0xNDAsNyArMTQwLDcg
QEAgc3RhdGljIHZvaWQgcnVuX29uX3JpbmcoaW50IGZkLCB1bnNpZ25lZCByaW5nX2lkLCBjb25z
dCBjaGFyICpyaW5nX25hbWUpCiAKIGlndF9tYWluCiB7Ci0JY29uc3Qgc3RydWN0IGludGVsX2V4
ZWN1dGlvbl9lbmdpbmUgKmU7CisJY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUy
ICplOwogCWludCBmZCA9IC0xOwogCiAJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwpAQCAtMTUw
LDkgKzE1MCw5IEBAIGlndF9tYWluCiAJCWlndF9yZXF1aXJlX2dlbShmZCk7CiAJfQogCi0JZm9y
IChlID0gaW50ZWxfZXhlY3V0aW9uX2VuZ2luZXM7IGUtPm5hbWU7IGUrKykKLQkJaWd0X3N1YnRl
c3RfZigiJXMlcyIsIGUtPmV4ZWNfaWQgPyAiIiA6ICJiYXNpYy0iLCBlLT5uYW1lKQotCQkJcnVu
X29uX3JpbmcoZmQsIGUtPmV4ZWNfaWQgfCBlLT5mbGFncywgZS0+bmFtZSk7CisJX19mb3JfZWFj
aF9waHlzaWNhbF9lbmdpbmUoZmQsIGUpCisJCWlndF9zdWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkK
KwkJCXJ1bl9vbl9yaW5nKGZkLCBlLT5mbGFncywgZS0+bmFtZSk7CiAKIAlpZ3RfZml4dHVyZQog
CQljbG9zZShmZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
