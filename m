Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484CD6E0C5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 20:59:48 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu,  4 Oct 2018 13:59:29 -0700
Message-Id: <20181004205929.3891-2-jose.souza@intel.com>
In-Reply-To: <20181004205929.3891-1-jose.souza@intel.com>
References: <20181004205929.3891-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/psr: Add support to new modified
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGtlcm5lbCBwYXRjaCAnZHJtL2k5MTU6IFJlZmFjdG9yIFBTUiBzdGF0dXMgZGVidWdmcycg
Y2hhbmdlZCB0aGUKb3V0cHV0IG9mIGk5MTVfZWRwX3Bzcl9zdGF0dXMsIHNvIGFkZGluZyBzdXBw
b3J0IHRvIHRoZSBuZXcgb3V0cHV0CmhlcmUgd2hpbGUga2VlcGluZyB0aGUgc3VwcG9ydCB0byB0
aGUgb2xkIG9uZSBmb3IgYSB3aGlsZS4KCkNjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWth
cmFuLnBhbmRpeWFuQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9wc3IuYyB8IDkgKysrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCmluZGV4IGYzNjQ5NmZkLi5h
NDhjOTIzMiAxMDA2NDQKLS0tIGEvbGliL2lndF9wc3IuYworKysgYi9saWIvaWd0X3Bzci5jCkBA
IC0zMiw4ICszMiwxMCBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1Z2ZzX2ZkLCBi
b29sIGNoZWNrX2FjdGl2ZSkKIAogCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQs
ICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmLAogCQkJCXNpemVvZihidWYpKTsKLQlhY3RpdmUg
PSBzdHJzdHIoYnVmLCAiSFcgRW5hYmxlZCAmIEFjdGl2ZSBiaXQ6IHllc1xuIikgJiYKLQkJKHN0
cnN0cihidWYsICJTUkRFTlQiKSB8fCBzdHJzdHIoYnVmLCAiU0xFRVAiKSk7CisKKwlhY3RpdmUg
PSAoc3Ryc3RyKGJ1ZiwgIkhXIEVuYWJsZWQgJiBBY3RpdmUgYml0OiB5ZXNcbiIpIHx8CisJCSAg
c3Ryc3RyKGJ1ZiwgIlNvdXJjZSBQU1IgY3RsOiBlbmFibGVkIikpICYmCisJCSAoc3Ryc3RyKGJ1
ZiwgIlNSREVOVCIpIHx8IHN0cnN0cihidWYsICJTTEVFUCIpKTsKIAlyZXR1cm4gY2hlY2tfYWN0
aXZlID8gYWN0aXZlIDogIWFjdGl2ZTsKIH0KIApAQCAtMTM2LDUgKzEzOCw2IEBAIGJvb2wgcHNy
X3N1cHBvcnRlZChpbnQgZGVidWdmc19mZCkKIAogCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRl
YnVnZnNfZmQsICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmLAogCQkJCXNpemVvZihidWYpKTsK
LQlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKTsKKwlyZXR1cm4gc3Ry
c3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKSB8fAorCSAgICAgICBzdHJzdHIoYnVmLCAi
U2luayBzdXBwb3J0OiB5ZXMiKTsKIH0KLS0gCjIuMTkuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
