Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B95893CB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2019 06:36:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  8 May 2019 12:01:53 +0530
Message-Id: <1557297113-15249-6-git-send-email-anshuman.gupta@intel.com>
In-Reply-To: <1557297113-15249-1-git-send-email-anshuman.gupta@intel.com>
References: <1557297113-15249-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t v12 5/5] tests/i915/i915_pm_dc: Added test
 for DC6 during DPMS
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
aTkxNS9pOTE1X3BtX2RjLmMKaW5kZXggMGY3OGI2Yi4uYmE4OTFkOCAxMDA2NDQKLS0tIGEvdGVz
dHMvaTkxNS9pOTE1X3BtX2RjLmMKKysrIGIvdGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMKQEAgLTI3
Miw2ICsyNzIsMTEgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAkJdGVzdF9k
Y19zdGF0ZV9kcG1zKCZkYXRhLCBDSEVDS19EQzUpOwogCX0KIAorCWlndF9zdWJ0ZXN0KCJkYzYt
ZHBtcyIpIHsKKwkJc2V0dXBfZGNfZHBtcygmZGF0YSk7CisJCXRlc3RfZGNfc3RhdGVfZHBtcygm
ZGF0YSwgQ0hFQ0tfREM2KTsKKwl9CisKIAlpZ3RfZml4dHVyZSB7CiAJCWNsb3NlKGRhdGEuZGVi
dWdmc19mZCk7CiAJCWRpc3BsYXlfZmluaSgmZGF0YSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
