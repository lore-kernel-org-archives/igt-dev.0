Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59A6E25B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 23:09:50 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue,  4 Dec 2018 15:09:37 -0800
Message-Id: <20181204230944.7753-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/8] lib/psr: Increase the buffer lenght
 that stores the output of i915_edp_psr_status
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

U29tZXRpbWVzIDUxMiBieXRlcyBpcyBub3QgZW5vZ2h0IHRvIHN0b3JlIHRoZSB3aG9sZQppOTE1
X2VkcF9wc3Jfc3RhdHVzIHBvdGVudGlhbGx5IGNhdXNpbmcgZmFpbCBpbiB0ZXN0cyB0aGF0IGRl
cGVuZHMKaW4gdGhlIGNvbnRlbnQgdGhhdCBpcyBvdXQgb2YgdGhpcyA1MTIgYnl0ZXMuCgpDYzog
RGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgot
LS0KIGxpYi9pZ3RfcHNyLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9w
c3IuYwppbmRleCAwZGRmYjY0Zi4uYzdiYzUyM2MgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcHNyLmMK
KysrIGIvbGliL2lndF9wc3IuYwpAQCAtMjUsMTAgKzI1LDEyIEBACiAjaW5jbHVkZSAiaWd0X3N5
c2ZzLmgiCiAjaW5jbHVkZSA8ZXJybm8uaD4KIAorI2RlZmluZSBQU1JfU1RBVFVTX01BWF9MRU4g
MTAyNAorCiBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1Z2ZzX2ZkLCBib29sIGNoZWNr
X2FjdGl2ZSkKIHsKIAlib29sIGFjdGl2ZTsKLQljaGFyIGJ1Zls1MTJdOworCWNoYXIgYnVmW1BT
Ul9TVEFUVVNfTUFYX0xFTl07CiAKIAlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2Zk
LCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsIGJ1ZiwKIAkJCQlzaXplb2YoYnVmKSk7Ci0tIAoyLjE5
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
