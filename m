Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9015E6EC1A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:42:15 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 09:43:41 +0200
Message-Id: <20180222074343.25292-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/3] igt/kms_fbcon_fbt: Handle ENODEV when
 checking i915_edp_psr_status for chipset support
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

SWYgdGhlIG1hY2hpbmUgZG9lc24ndCBzdXBwb3J0IFBTUiwgaXQgd2lsbCByZXR1cm4gLUVOT0RF
ViBmcm9tCmk5MTVfZWRwX3Bzcl9zdGF0dXMsIHdoaWNoIHdlIHdhbnQgdG8gaW50ZXJwcmV0IGFz
IHVuc3VwcG9ydGVkLgpUaGlzIGlzIGluIGxpbmUgd2l0aCB3aGF0IENocmlzIGp1c3QgZml4ZWQg
Zm9yIEZCQy4KClNpZ25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBp
bnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZiY29uX2ZidC5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBi
L3Rlc3RzL2ttc19mYmNvbl9mYnQuYwppbmRleCAxYjIzNmY4Yi4uNmFhMTcxZTYgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYworKysgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKQEAg
LTE2NCw2ICsxNjQsOCBAQCBzdGF0aWMgYm9vbCBwc3Jfc3VwcG9ydGVkX29uX2NoaXBzZXQoaW50
IGZkKQogewogCWNoYXIgYnVmWzI1Nl07CiAKKwlpZiAoKmJ1ZiA9PSAnXDAnKSAvKiAhSEFTX1BT
UiAtPiAtRU5PREVWKi8KKwkJcmV0dXJuIGZhbHNlOwogCWlndF9kZWJ1Z2ZzX3JlYWQoZmQsICJp
OTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmKTsKIAlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3Vw
cG9ydDogeWVzXG4iKTsKIH0KLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
