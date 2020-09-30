Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364FD6E5B4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 09:23:09 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Wed, 30 Sep 2020 11:21:53 +0200
Message-Id: <20200930092155.26661-17-dominik.grzegorzek@intel.com>
In-Reply-To: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
References: <20200930092155.26661-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 16/18] tests/kms_psr2_su.c: Get rid of
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
PgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClJldmlld2VkLWJ5
OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfcHNyMl9zdS5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyMl9zdS5jIGIvdGVzdHMva21z
X3BzcjJfc3UuYwppbmRleCBkNTQ5ZDlhMy4uOTIxNWM1OWQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2tt
c19wc3IyX3N1LmMKKysrIGIvdGVzdHMva21zX3BzcjJfc3UuYwpAQCAtMzAsNyArMzAsNiBAQAog
I2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8c3RyaW5nLmg+CiAjaW5jbHVkZSA8c3lzL3Rp
bWVyZmQuaD4KLSNpbmNsdWRlICJpbnRlbF9idWZtZ3IuaCIKIAogSUdUX1RFU1RfREVTQ1JJUFRJ
T04oIlRlc3QgUFNSMiBzZWxlY3RpdmUgdXBkYXRlIik7CiAKQEAgLTY1LDcgKzY0LDYgQEAgdHlw
ZWRlZiBzdHJ1Y3QgewogCWludCBkcm1fZmQ7CiAJaW50IGRlYnVnZnNfZmQ7CiAJaWd0X2Rpc3Bs
YXlfdCBkaXNwbGF5OwotCWRybV9pbnRlbF9idWZtZ3IgKmJ1Zm1ncjsKIAlkcm1Nb2RlTW9kZUlu
Zm8gKm1vZGU7CiAJaWd0X291dHB1dF90ICpvdXRwdXQ7CiAJc3RydWN0IGlndF9mYiBmYlsyXTsK
QEAgLTI0NywxMCArMjQ1LDYgQEAgaWd0X21haW4KIAkJCQkJICAgICAgIGRhdGEuZGVidWdmc19m
ZCwgUFNSX01PREVfMiksCiAJCQkgICAgICAiU2luayBkb2VzIG5vdCBzdXBwb3J0IFBTUjJcbiIp
OwogCi0JCWRhdGEuYnVmbWdyID0gZHJtX2ludGVsX2J1Zm1ncl9nZW1faW5pdChkYXRhLmRybV9m
ZCwgNDA5Nik7Ci0JCWlndF9hc3NlcnQoZGF0YS5idWZtZ3IpOwotCQlkcm1faW50ZWxfYnVmbWdy
X2dlbV9lbmFibGVfcmV1c2UoZGF0YS5idWZtZ3IpOwotCiAJCWRpc3BsYXlfaW5pdCgmZGF0YSk7
CiAKIAkJLyogVGVzdCBpZiBQU1IyIGNhbiBiZSBlbmFibGVkICovCkBAIC0yODcsNyArMjgxLDYg
QEAgaWd0X21haW4KIAogCWlndF9maXh0dXJlIHsKIAkJY2xvc2UoZGF0YS5kZWJ1Z2ZzX2ZkKTsK
LQkJZHJtX2ludGVsX2J1Zm1ncl9kZXN0cm95KGRhdGEuYnVmbWdyKTsKIAkJZGlzcGxheV9maW5p
KCZkYXRhKTsKIAl9CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
