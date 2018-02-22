Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBB56EC1B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:42:17 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 09:43:42 +0200
Message-Id: <20180222074343.25292-2-marta.lofstedt@intel.com>
In-Reply-To: <20180222074343.25292-1-marta.lofstedt@intel.com>
References: <20180222074343.25292-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] igt/kms_fronbuffer_tracking: Handle
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
Zm9yIEZCQy4KClNpZ25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBp
bnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zy
b250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpp
bmRleCA1N2FlMDQ3Yi4uMGE3MGU1ZTMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZl
cl90cmFja2luZy5jCisrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0x
NjM3LDYgKzE2MzcsOCBAQCBzdGF0aWMgYm9vbCBwc3Jfc2lua19oYXNfc3VwcG9ydCh2b2lkKQog
ewogCWNoYXIgYnVmWzI1Nl07CiAKKwlpZiAoKmJ1ZiA9PSAnXDAnKSAvKiAhSEFTX1BTUiAtPiAt
RU5PREVWKi8KKwkJcmV0dXJuIGZhbHNlOwogCWRlYnVnZnNfcmVhZCgiaTkxNV9lZHBfcHNyX3N0
YXR1cyIsIGJ1Zik7CiAJcmV0dXJuIHN0cnN0cihidWYsICJTaW5rX1N1cHBvcnQ6IHllc1xuIik7
CiB9Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
