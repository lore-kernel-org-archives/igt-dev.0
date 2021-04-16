Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF246ECA5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:53:28 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:53:10 +0300
Message-Id: <20210416175312.25190-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
References: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] tests/kms_flip_scaled_crc: Clean up
 pipe crc before subtest
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCklm
IHRoZSBwcmV2aW91cyBzdWJ0ZXN0IGZhaWxzL3NraXBzIHdlIGxlYXZlIHRoZSBwaXBlIGNyYwpy
dW5uaW5nLCB3aGljaCB0aGVuIGNhdXNlcyB0aGUgbmV4dCBzdWJ0ZXN0IHRvIGZhaWwgd2hlbgpp
dCB0cmllcyB0byBlbmFibGUgdGhlIGFscmVhZHkgZW5hYmxlZCBjcmMuIEF2b2lkIHRoaXMgYnkK
Y2xlYW5pbmcgdXAgdGhlIG9sZCBjcmMgbGVmdG92ZXJzIGZpcnN0LgoKU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0
cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMgYi90ZXN0
cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMKaW5kZXggYjcwYmU2ZjAzYmNlLi5lOTRmMDgzYzViOWQg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mbGlwX3NjYWxlZF9jcmMuYworKysgYi90ZXN0cy9rbXNf
ZmxpcF9zY2FsZWRfY3JjLmMKQEAgLTE0NSw2ICsxNDUsMTAgQEAgc3RhdGljIHZvaWQgdGVzdF9m
bGlwX3RvX3NjYWxlZChkYXRhX3QgKmRhdGEsIHVpbnQzMl90IGluZGV4LCBlbnVtIHBpcGUgcGlw
ZSwKIAlwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsIERSTV9QTEFO
RV9UWVBFX1BSSU1BUlkpOwogCWlndF9kaXNwbGF5X2NvbW1pdF9hdG9taWMoJmRhdGEtPmRpc3Bs
YXksIERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULAogCQkJCSAgTlVMTCk7CisJaWYgKGRh
dGEtPnBpcGVfY3JjKSB7CisJCWlndF9waXBlX2NyY19zdG9wKGRhdGEtPnBpcGVfY3JjKTsKKwkJ
aWd0X3BpcGVfY3JjX2ZyZWUoZGF0YS0+cGlwZV9jcmMpOworCX0KIAlkYXRhLT5waXBlX2NyYyA9
IGlndF9waXBlX2NyY19uZXcoZGF0YS0+ZHJtX2ZkLCBwaXBlLAogCQkJCQkgIElOVEVMX1BJUEVf
Q1JDX1NPVVJDRV9BVVRPKTsKIAotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
