Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE488991A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2019 10:52:53 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 13 Jun 2019 16:17:45 +0530
Message-Id: <20190613104746.15756-6-anshuman.gupta@intel.com>
In-Reply-To: <20190613104746.15756-1-anshuman.gupta@intel.com>
References: <20190613104746.15756-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/i915/i915_pm_dc: Added test for
 DC6 during DPMS
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
Cc: jyoti.r.yadav@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgoKQWRkZWQgbmV3IHN1
YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUuCkR1cmluZyBEUE1T
IG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KCnYyOiBSZW5hbWVkIHRo
ZSBzdWJ0ZXN0IG5hbWUuCnYzOiBSZWJhc2VkLgp2NDogQWRkcmVzc2VkIHJldmlldyBjb21tZW50
IGJ5IHJlcGxhY2luZyBpZ3RfZGlzcGxheV9pbml0KCkgdG8KICAgIGlndF9kaXNwbGF5X3JlcXVp
cmUoKSwgY2hhbmdlcyBnb3QgZG9uZSBpbiBwYXRjaCBzZXQgMi4KdjU6IEFkZHJlc3NlZCB0aGUg
cmV2aWV3IGNvbW1lbnQgYnkgcmVtb3ZpbmcgcmVkdW5kYW50IHJlYWRfZGNfY291bnRlcigpCiAg
ICBzdWdnZXN0ZWQgYnkgSW1yZS4KICAgIExpc3RpbmcgYWN0dWFsIGNoYW5nZSBpbiBwYXRjaCBz
ZXQgY2hhbmdlbG9nIHRvIG1ha2UgcmV2aWV3IGVhc2llci4KdjY6IFJlYmFzZWQgZHVlIHRvIHRl
c3QgbmFtZSBwbV9kYyBjaGFuZ2VkIHRvIGk5MTVfcG1fZGMsIGFsaWduaW5nIHRvCiAgICBvdGhl
ciBQTSB0ZXN0cy4Kdjc6IEludHJvZHVjZWQgc2V0dXBfZGNfZHBtcygpIGlub3JkZXIgdG8gZGlz
YWJsZSBpOTE1IHJ1bnRpbWUgUE0gZm9yCiAgICB0aGUgcGxhdGZvcm0gc3VwcG9ydHMgREM5LgoK
U2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPgotLS0K
IHRlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9kYy5jIGIvdGVzdHMv
aTkxNS9pOTE1X3BtX2RjLmMKaW5kZXggMGY3OGI2YjQuLmJhODkxZDg1IDEwMDY0NAotLS0gYS90
ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYworKysgYi90ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYwpAQCAt
MjcyLDYgKzI3MiwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQl0ZXN0
X2RjX3N0YXRlX2RwbXMoJmRhdGEsIENIRUNLX0RDNSk7CiAJfQogCisJaWd0X3N1YnRlc3QoImRj
Ni1kcG1zIikgeworCQlzZXR1cF9kY19kcG1zKCZkYXRhKTsKKwkJdGVzdF9kY19zdGF0ZV9kcG1z
KCZkYXRhLCBDSEVDS19EQzYpOworCX0KKwogCWlndF9maXh0dXJlIHsKIAkJY2xvc2UoZGF0YS5k
ZWJ1Z2ZzX2ZkKTsKIAkJZGlzcGxheV9maW5pKCZkYXRhKTsKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
