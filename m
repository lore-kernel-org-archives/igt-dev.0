Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7416EC21
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:58:45 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 10:00:11 +0200
Message-Id: <20180222080012.25885-2-marta.lofstedt@intel.com>
In-Reply-To: <20180222080012.25885-1-marta.lofstedt@intel.com>
References: <20180222080012.25885-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 2/3] igt/kms_fronbuffer_tracking: Handle
 ENODEV when checking i915_edp_psr_status for chipset support
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
Zm9yIEZCQy4KClYyOiBDb3B5LXBhc3RlZCB0byB0aGUgY29ycmVjdCBwbGFjZQoKU2lnbmVkLW9m
Zi1ieTogTWFydGEgTG9mc3RlZHQgPG1hcnRhLmxvZnN0ZWR0QGludGVsLmNvbT4KLS0tCiB0ZXN0
cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5n
LmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwppbmRleCA1N2FlMDQ3Yi4uMTQ4
M2MyMjggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCisrKyBi
L3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0xNjM4LDYgKzE2MzgsOSBAQCBz
dGF0aWMgYm9vbCBwc3Jfc2lua19oYXNfc3VwcG9ydCh2b2lkKQogCWNoYXIgYnVmWzI1Nl07CiAK
IAlkZWJ1Z2ZzX3JlYWQoImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYpOworCWlmICgqYnVmID09
ICdcMCcpIC8qICFIQVNfUFNSIC0+IC1FTk9ERVYqLworCQlyZXR1cm4gZmFsc2U7CisKIAlyZXR1
cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKTsKIH0KIAotLSAKMi4xMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
