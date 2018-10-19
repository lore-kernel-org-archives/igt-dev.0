Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38126E0CB
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Oct 2018 12:50:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Fri, 19 Oct 2018 14:50:01 +0200
Message-Id: <20181019125001.27789-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Really do
 not skip on 4k displays.
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

VGhlIHByZXZpb3VzIGZpeGVzIHRvIGttc19mcm9udGJ1ZmZlcl90cmFja2luZyBmaXhlZCB0aGUg
c2hhcmVkZmIgdGVzdHMsCmJ1dCB0aGUgc3RyaWRlY2hhbmdlIHRlc3Qgc3RpbGwgY3JlYXRlcyBp
dHMgb3duIGZiLiBVc2UgYSBzbWFsbGVyIGZiIGluCm9yZGVyIHRvIHRlc3QgYSBzdHJpZGUgY2hh
bmdlLCB3aXRob3V0IGVuZGluZyB1cCB3aXRoIGFuIGV4Y2Vzc2l2ZSBzdHJpZGUuCgpTaWduZWQt
b2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgotLS0KIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJh
Y2tpbmcuYwppbmRleCBiZjRhNjhmZjJiZGUuLmE0ZjBkOWY3MmFhYiAxMDA2NDQKLS0tIGEvdGVz
dHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVzdHMva21zX2Zyb250YnVmZmVy
X3RyYWNraW5nLmMKQEAgLTI5MjMsNyArMjkyMyw3IEBAIHN0YXRpYyB2b2lkIHN0cmlkZWNoYW5n
ZV9zdWJ0ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQpCiAKIAlvbGRfZmIgPSBwYXJhbXMt
PnByaW1hcnkuZmI7CiAKLQljcmVhdGVfZmIodC0+Zm9ybWF0LCBwYXJhbXMtPnByaW1hcnkuZmIt
PndpZHRoICsgNTEyLCBwYXJhbXMtPnByaW1hcnkuZmItPmhlaWdodCwKKwljcmVhdGVfZmIodC0+
Zm9ybWF0LCBwYXJhbXMtPnByaW1hcnkuZmItPndpZHRoICsgNjQsIHBhcmFtcy0+cHJpbWFyeS5m
Yi0+aGVpZ2h0LAogCQkgIG9wdC50aWxpbmcsIHQtPnBsYW5lLCAmbmV3X2ZiKTsKIAlmaWxsX2Zi
KCZuZXdfZmIsIENPTE9SX1BSSU1fQkcpOwogCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
