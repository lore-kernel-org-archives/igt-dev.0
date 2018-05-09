Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6C6E0C0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 21:18:53 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed,  9 May 2018 14:18:51 -0700
Message-Id: <20180509211851.2094-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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

TWFrZSBzdXJlIHRoYXQgYXQgbGVhc3Qgb25lIG9mIHRoZSAnbW1hcCcgZnVuY3Rpb25zIHJldHVy
bnMgYSB2YWxpZCBwb2ludGVyIHRvCmF2b2lkIGRlcmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIg
bGF0ZXIgb24uIChJc3N1ZSBmb3VuZCB2aWEgY292ZXJpdHkpCgp2MjoKCS0gVXNlIHRoZSB2ZXJz
aW9uIG9mIHRoZSBtYXBwaW5nIGZ1bmN0aW9uIHRoYXQgd2lsbCBhc3NlcnQgb24gZmFpbAoJICAo
Q2hyaXMpLgoKU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vu
emlhbm9AaW50ZWwuY29tPgoKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgotLS0KIGxpYi9pZ3RfZHVtbXlsb2FkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2R1bW15bG9h
ZC5jIGIvbGliL2lndF9kdW1teWxvYWQuYwppbmRleCBiYTkxN2JhNS4uMzgwOWI0ZTYgMTAwNjQ0
Ci0tLSBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMKKysrIGIvbGliL2lndF9kdW1teWxvYWQuYwpAQCAt
MTIzLDcgKzEyMyw3IEBAIGVtaXRfcmVjdXJzaXZlX2JhdGNoKGlndF9zcGluX3QgKnNwaW4sIGlu
dCBmZCwgdWludDMyX3QgY3R4LCB1bnNpZ25lZCBlbmdpbmUsCiAJYmF0Y2ggPSBfX2dlbV9tbWFw
X193YyhmZCwgb2JqW0JBVENIXS5oYW5kbGUsCiAJCQkgICAgICAgMCwgQkFUQ0hfU0laRSwgUFJP
VF9XUklURSk7CiAJaWYgKCFiYXRjaCkKLQkJYmF0Y2ggPSBfX2dlbV9tbWFwX19ndHQoZmQsIG9i
altCQVRDSF0uaGFuZGxlLAorCQliYXRjaCA9IGdlbV9tbWFwX19ndHQoZmQsIG9ialtCQVRDSF0u
aGFuZGxlLAogCQkJCSAgICAgICAJQkFUQ0hfU0laRSwgUFJPVF9XUklURSk7CiAJZ2VtX3NldF9k
b21haW4oZmQsIG9ialtCQVRDSF0uaGFuZGxlLAogCQkJSTkxNV9HRU1fRE9NQUlOX0dUVCwgSTkx
NV9HRU1fRE9NQUlOX0dUVCk7Ci0tIAoyLjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
