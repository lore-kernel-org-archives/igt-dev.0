Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96786EBF8
 for <igt-dev@lists.freedesktop.org>; Sat,  3 Nov 2018 11:36:28 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Sat,  3 Nov 2018 07:36:06 -0400
Message-Id: <1541244966-27134-6-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1541244966-27134-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1541244966-27134-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 5/5] [intel-gfx] tests/pm_dc: Added test
 for DC6 during DPMS
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWRkZWQgbmV3IHN1YnRlc3QgZm9yIERDNiBlbnRyeSBkdXJpbmcgRFBNUyBvbi9vZmYgY3ljbGUu
CkR1cmluZyBEUE1TIG9uL29mZiBjeWNsZSBEQzYgY291bnRlciBpcyBpbmNyZW1lbnRlZC4KCnYy
OiBSZW5hbWVkIHRoZSBzdWJ0ZXN0IG5hbWUuCnYzOiBSZWJhc2VkLgoKU2lnbmVkLW9mZi1ieTog
SnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgotLS0KIHRlc3RzL3BtX2RjLmMg
fCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9wbV9kYy5jIGIvdGVzdHMvcG1fZGMuYwppbmRl
eCBkNDdiODM3Li42ZDcxZTM0IDEwMDY0NAotLS0gYS90ZXN0cy9wbV9kYy5jCisrKyBiL3Rlc3Rz
L3BtX2RjLmMKQEAgLTIxMSw3ICsyMTEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJn
dltdKQogCQlpZ3RfaW5mbygiUnVudGltZSBQTSBzdXBwb3J0OiAlZFxuIiwgaGFzX3J1bnRpbWVf
cG0pOwogCQlpZ3RfcmVxdWlyZShoYXNfcnVudGltZV9wbSk7CiAJCWlndF9yZXF1aXJlKGlndF9w
bV9kbWNfbG9hZGVkKGRhdGEuZGVidWdmc19mZCkpOwotCQlpZ3RfZGlzcGxheV9pbml0KCZkYXRh
LT5kaXNwbGF5LCBkYXRhLT5kcm1fZmQpOworCQlpZ3RfZGlzcGxheV9pbml0KCZkYXRhLmRpc3Bs
YXksIGRhdGEuZHJtX2ZkKTsKIAkJLy9kaXNwbGF5X2luaXQoJmRhdGEpOwogCX0KIApAQCAtMjQ4
LDYgKzI0OCwxNSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCS8vCWNsZWFu
dXAoJmRhdGEpOwogCX0KIAorCWlndF9zdWJ0ZXN0KCJkYzYtZHBtcyIpIHsKKwkJLyogQ2hlY2sg
REM2IGNvdW50ZXIgaXMgYXZhaWxhYmxlIGZvciB0aGUgcGxhdGZvcm0uCisJCSAqIFNraXAgdGhl
IHRlc3QgaWYgY291bnRlciBpcyBub3QgYXZhaWxhYmxlLgorCQkgKi8KKwkJcmVhZF9kY19jb3Vu
dGVyKGRhdGEuZHJtX2ZkLCBDSEVDS19EQzYpOworCQl0ZXN0X2RjX3N0YXRlX2RwbXMoJmRhdGEs
IENIRUNLX0RDNik7CisJCS8vY2xlYW51cCgmZGF0YSk7CisJfQorCiAJaWd0X2ZpeHR1cmUgewog
CQljbG9zZShkYXRhLmRlYnVnZnNfZmQpOwogCQlkaXNwbGF5X2ZpbmkoJmRhdGEpOwotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
