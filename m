Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149EF6E289
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Jan 2019 01:46:37 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 11 Jan 2019 17:46:00 -0800
Message-Id: <20190112014607.13446-3-jose.souza@intel.com>
In-Reply-To: <20190112014607.13446-1-jose.souza@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/10] lib/psr: Add support to new modified
 i915_edp_psr_status output
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGtlcm5lbCBwYXRjaCAnZHJtL2k5MTU6IFJlZmFjdG9yIFBTUiBzdGF0dXMgZGVidWdmcycg
Y2hhbmdlZCB0aGUKb3V0cHV0IG9mIGk5MTVfZWRwX3Bzcl9zdGF0dXMsIHNvIGFkZGluZyBzdXBw
b3J0IHRvIHRoZSBuZXcgb3V0cHV0CmhlcmUgd2hpbGUga2VlcGluZyB0aGUgc3VwcG9ydCB0byB0
aGUgb2xkIG9uZSBmb3IgYSB3aGlsZS4KCkluIHBzcl9hY3RpdmUoKSB3ZSB3ZXJlIG92ZXJkb2lu
Zywgd2UganVzdCBuZWVkIHRvIGNoZWNrIHRoZSBzb3VyY2UKc3RhdGUgdG8ga25vdyBpZiBQU1Ig
aXMgYWN0aXZlIGFuZCBkb2luZyB0aGF0IHdlIGtlZXAgY29tcGFiaWxpdHkgdG8Kb2xkIGFuZCBu
ZXcgaTkxNV9lZHBfcHNyX3N0YXR1cyBvdXRwdXQuCgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdv
LnZpdmlAaW50ZWwuY29tPgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5k
aXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfcHNyLmMgfCA3ICsrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggODIwMTJlNmQuLmE1OWZmOTRlIDEw
MDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xpYi9pZ3RfcHNyLmMKQEAgLTMyLDggKzMy
LDggQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZShpbnQgZGVidWdmc19mZCwgYm9vbCBjaGVja19h
Y3RpdmUpCiAKIAlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBf
cHNyX3N0YXR1cyIsIGJ1ZiwKIAkJCQlzaXplb2YoYnVmKSk7Ci0JYWN0aXZlID0gc3Ryc3RyKGJ1
ZiwgIkhXIEVuYWJsZWQgJiBBY3RpdmUgYml0OiB5ZXNcbiIpICYmCi0JCShzdHJzdHIoYnVmLCAi
U1JERU5UIikgfHwgc3Ryc3RyKGJ1ZiwgIlNMRUVQIikpOworCisJYWN0aXZlID0gc3Ryc3RyKGJ1
ZiwgIlNSREVOVCIpIHx8IHN0cnN0cihidWYsICJTTEVFUCIpOwogCXJldHVybiBjaGVja19hY3Rp
dmUgPyBhY3RpdmUgOiAhYWN0aXZlOwogfQogCkBAIC0xMzcsNSArMTM3LDYgQEAgYm9vbCBwc3Jf
c2lua19zdXBwb3J0KGludCBkZWJ1Z2ZzX2ZkKQogCiAJcmV0ID0gaWd0X2RlYnVnZnNfc2ltcGxl
X3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsCiAJCQkJICAgICAg
c2l6ZW9mKGJ1ZikpOwotCXJldHVybiByZXQgPiAwICYmIHN0cnN0cihidWYsICJTaW5rX1N1cHBv
cnQ6IHllc1xuIik7CisJcmV0dXJuIHJldCA+IDAgJiYgKHN0cnN0cihidWYsICJTaW5rX1N1cHBv
cnQ6IHllc1xuIikgfHwKKwkJCSAgIHN0cnN0cihidWYsICJTaW5rIHN1cHBvcnQ6IHllcyIpKTsK
IH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
