Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBC66EB3B
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jan 2019 14:37:00 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu,  3 Jan 2019 06:36:36 -0800
Message-Id: <20190103143641.20200-4-jose.souza@intel.com>
In-Reply-To: <20190103143641.20200-1-jose.souza@intel.com>
References: <20190103143641.20200-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/9] lib/psr: Add support to new modified
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
aGUgb2xkIG9uZSBmb3IgYSB3aGlsZS4KCkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+CkNjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGlu
dGVsLmNvbT4KUmV2aWV3ZWQtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFu
ZGl5YW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X3Bzci5jIHwgOSArKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggODIwMTJlNmQuLjhlZmM5MjE2
IDEwMDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xpYi9pZ3RfcHNyLmMKQEAgLTMyLDgg
KzMyLDEwIEBAIHN0YXRpYyBib29sIHBzcl9hY3RpdmUoaW50IGRlYnVnZnNfZmQsIGJvb2wgY2hl
Y2tfYWN0aXZlKQogCiAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVf
ZWRwX3Bzcl9zdGF0dXMiLCBidWYsCiAJCQkJc2l6ZW9mKGJ1ZikpOwotCWFjdGl2ZSA9IHN0cnN0
cihidWYsICJIVyBFbmFibGVkICYgQWN0aXZlIGJpdDogeWVzXG4iKSAmJgotCQkoc3Ryc3RyKGJ1
ZiwgIlNSREVOVCIpIHx8IHN0cnN0cihidWYsICJTTEVFUCIpKTsKKworCWFjdGl2ZSA9IHN0cnN0
cihidWYsICJIVyBFbmFibGVkICYgQWN0aXZlIGJpdDogeWVzXG4iKSB8fAorCQkgc3Ryc3RyKGJ1
ZiwgIlNvdXJjZSBQU1IgY3RsOiBlbmFibGVkIik7CisJYWN0aXZlID0gYWN0aXZlICYmIChzdHJz
dHIoYnVmLCAiU1JERU5UIikgfHwgc3Ryc3RyKGJ1ZiwgIlNMRUVQIikpOwogCXJldHVybiBjaGVj
a19hY3RpdmUgPyBhY3RpdmUgOiAhYWN0aXZlOwogfQogCkBAIC0xMzcsNSArMTM5LDYgQEAgYm9v
bCBwc3Jfc2lua19zdXBwb3J0KGludCBkZWJ1Z2ZzX2ZkKQogCiAJcmV0ID0gaWd0X2RlYnVnZnNf
c2ltcGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsCiAJCQkJ
ICAgICAgc2l6ZW9mKGJ1ZikpOwotCXJldHVybiByZXQgPiAwICYmIHN0cnN0cihidWYsICJTaW5r
X1N1cHBvcnQ6IHllc1xuIik7CisJcmV0dXJuIHJldCA+IDAgJiYgKHN0cnN0cihidWYsICJTaW5r
X1N1cHBvcnQ6IHllc1xuIikgfHwKKwkJCSAgIHN0cnN0cihidWYsICJTaW5rIHN1cHBvcnQ6IHll
cyIpKTsKIH0KLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
