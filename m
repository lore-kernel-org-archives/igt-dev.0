Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AB86E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 13:03:38 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 26 Mar 2019 18:29:24 +0530
Message-Id: <1553605164-11071-3-git-send-email-anshuman.gupta@intel.com>
In-Reply-To: <1553605164-11071-1-git-send-email-anshuman.gupta@intel.com>
References: <1553605164-11071-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/i915_pm_rpm:
 modeset-pc8-residency-stress
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

SW50cm9kdWNlZCBwYzhfbmVlZHNfc2NyZWVuX29mZiBmbGFnIGluIG9yZGVyIHRvIGRpZmZlcmVu
dGlhdGUKYmV0d2VlbiBIQVNXRUxML0JST0FEV0VMTCBhbmQgQVRfTEVBU1RfR0VOOS4gR0VOOSBv
bndhcmRzClBDOCsgcmVzaWRlbmN5IGRvZXMndCByZXF1aXJlIGRpc3BsYXkgdG8gYmUgdHVybmVk
IG9uLgoKU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVs
LmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1
L2k5MTVfcG1fcnBtLmMgYi90ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMKaW5kZXggNjZkMmE0ZS4u
OTVhNWM0MSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jCisrKyBiL3Rlc3Rz
L2k5MTUvaTkxNV9wbV9ycG0uYwpAQCAtOTAyLDcgKzkwMiw3IEBAIHN0YXRpYyB2b2lkIG1vZGVz
ZXRfc3VidGVzdChlbnVtIHNjcmVlbl90eXBlIHR5cGUsIGludCByb3VuZHMsIGludCB3YWl0X2Zs
YWdzKQogCQlpZ3RfcmVxdWlyZShlbmFibGVfb25lX3NjcmVlbl93aXRoX3R5cGUoJm1zX2RhdGEs
IHR5cGUpKTsKIAkJaWYgKHdhaXRfZmxhZ3MgJiBXQUlUX1NUQVRVUykKIAkJCWlndF9hc3NlcnQo
d2FpdF9mb3JfYWN0aXZlKCkpOwotCQlpZiAod2FpdF9mbGFncyAmIFdBSVRfUEM4X1JFUykKKwkJ
aWYgKHdhaXRfZmxhZ3MgJiBXQUlUX1BDOF9SRVMgJiYgbXNfZGF0YS5wYzhfbmVlZHNfc2NyZWVu
X29mZikKIAkJCWlndF9hc3NlcnQoIXBjOF9wbHVzX3Jlc2lkZW5jeV9jaGFuZ2VkKDUpKTsKIAkJ
aWYgKHdhaXRfZmxhZ3MgJiBXQUlUX0VYVFJBKQogCQkJc2xlZXAoNSk7Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
