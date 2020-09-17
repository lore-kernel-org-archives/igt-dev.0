Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471DA6EB31
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2020 08:24:17 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Thu, 17 Sep 2020 10:22:17 +0200
Message-Id: <20200917082224.7817-14-dominik.grzegorzek@intel.com>
In-Reply-To: <20200917082224.7817-1-dominik.grzegorzek@intel.com>
References: <20200917082224.7817-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/20] tests/kms_psr2_su.c: Get rid of
 unused bufmgr
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

UmVtb3ZhbCBvZiBidWZtZ3IgdGhhdCB3YXMgb25seSBzZXQgYnV0IG5vdCB1c2VkLgoKU2lnbmVk
LW9mZi1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29t
PgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0
cy9rbXNfcHNyMl9zdS5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyMl9zdS5jIGIvdGVzdHMva21zX3BzcjJfc3Uu
YwppbmRleCBkNTQ5ZDlhMy4uOTIxNWM1OWQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wc3IyX3N1
LmMKKysrIGIvdGVzdHMva21zX3BzcjJfc3UuYwpAQCAtMzAsNyArMzAsNiBAQAogI2luY2x1ZGUg
PHN0ZGlvLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3lzL3RpbWVyZmQuaD4K
LSNpbmNsdWRlICJpbnRlbF9idWZtZ3IuaCIKIAogSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3Qg
UFNSMiBzZWxlY3RpdmUgdXBkYXRlIik7CiAKQEAgLTY1LDcgKzY0LDYgQEAgdHlwZWRlZiBzdHJ1
Y3QgewogCWludCBkcm1fZmQ7CiAJaW50IGRlYnVnZnNfZmQ7CiAJaWd0X2Rpc3BsYXlfdCBkaXNw
bGF5OwotCWRybV9pbnRlbF9idWZtZ3IgKmJ1Zm1ncjsKIAlkcm1Nb2RlTW9kZUluZm8gKm1vZGU7
CiAJaWd0X291dHB1dF90ICpvdXRwdXQ7CiAJc3RydWN0IGlndF9mYiBmYlsyXTsKQEAgLTI0Nywx
MCArMjQ1LDYgQEAgaWd0X21haW4KIAkJCQkJICAgICAgIGRhdGEuZGVidWdmc19mZCwgUFNSX01P
REVfMiksCiAJCQkgICAgICAiU2luayBkb2VzIG5vdCBzdXBwb3J0IFBTUjJcbiIpOwogCi0JCWRh
dGEuYnVmbWdyID0gZHJtX2ludGVsX2J1Zm1ncl9nZW1faW5pdChkYXRhLmRybV9mZCwgNDA5Nik7
Ci0JCWlndF9hc3NlcnQoZGF0YS5idWZtZ3IpOwotCQlkcm1faW50ZWxfYnVmbWdyX2dlbV9lbmFi
bGVfcmV1c2UoZGF0YS5idWZtZ3IpOwotCiAJCWRpc3BsYXlfaW5pdCgmZGF0YSk7CiAKIAkJLyog
VGVzdCBpZiBQU1IyIGNhbiBiZSBlbmFibGVkICovCkBAIC0yODcsNyArMjgxLDYgQEAgaWd0X21h
aW4KIAogCWlndF9maXh0dXJlIHsKIAkJY2xvc2UoZGF0YS5kZWJ1Z2ZzX2ZkKTsKLQkJZHJtX2lu
dGVsX2J1Zm1ncl9kZXN0cm95KGRhdGEuYnVmbWdyKTsKIAkJZGlzcGxheV9maW5pKCZkYXRhKTsK
IAl9CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
