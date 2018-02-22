Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CD36EC21
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:58:44 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 10:00:10 +0200
Message-Id: <20180222080012.25885-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 1/3] igt/kms_fbcon_fbt: Handle ENODEV
 when checking i915_edp_psr_status for chipset support
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
Zm9yIEZCQy4KClYyOiBDb3B5LXBhc3RlZCB0byB0aGUgY29ycmVjdCBwb3NpdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+Ci0tLQog
dGVzdHMva21zX2ZiY29uX2ZidC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmJjb25fZmJ0LmMgYi90ZXN0cy9rbXNfZmJj
b25fZmJ0LmMKaW5kZXggMWIyMzZmOGIuLmIwMWM3NjljIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
ZmJjb25fZmJ0LmMKKysrIGIvdGVzdHMva21zX2ZiY29uX2ZidC5jCkBAIC0xNjUsNiArMTY1LDkg
QEAgc3RhdGljIGJvb2wgcHNyX3N1cHBvcnRlZF9vbl9jaGlwc2V0KGludCBmZCkKIAljaGFyIGJ1
ZlsyNTZdOwogCiAJaWd0X2RlYnVnZnNfcmVhZChmZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBi
dWYpOworCWlmICgqYnVmID09ICdcMCcpIC8qICFIQVNfUFNSIC0+IC1FTk9ERVYqLworCQlyZXR1
cm4gZmFsc2U7CisKIAlyZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKTsK
IH0KIAotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
