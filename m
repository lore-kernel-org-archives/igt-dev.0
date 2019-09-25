Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DA889815
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2019 13:09:42 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 25 Sep 2019 16:09:26 +0300
Message-Id: <20190925130931.29107-6-mika.kahola@intel.com>
In-Reply-To: <20190925130931.29107-1-mika.kahola@intel.com>
References: <20190925130931.29107-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH RFC i-g-t 05/10] lib/igt_fb.c: Update tile sizes
 for GEN12 MCS
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

VXBkYXRlIHRpbGUgc2l6ZXMgZm9yIEdFTjEyIE1DUy4KClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fo
b2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgMyArKysKIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMg
Yi9saWIvaWd0X2ZiLmMKaW5kZXggODI2ZDlmNzAuLjYxOGU3YTYzIDEwMDY0NAotLS0gYS9saWIv
aWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0zODIsNiArMzgyLDcgQEAgdm9pZCBpZ3Rf
Z2V0X2ZiX3RpbGVfc2l6ZShpbnQgZmQsIHVpbnQ2NF90IG1vZGlmaWVyLCBpbnQgZmJfYnBwLAog
CQl9CiAJCWJyZWFrOwogCWNhc2UgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfR0VOMTJf
UkNfQ0NTOgorCWNhc2UgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfR0VOMTJfTUNfQ0NT
OgogCQlpZ3RfcmVxdWlyZV9pbnRlbChmZCk7CiAJCXN3aXRjaCAoZmJfYnBwKSB7CiAJCWNhc2Ug
ODoKQEAgLTQ2NCw2ICs0NjUsNyBAQCBzdGF0aWMgYm9vbCBpc19jY3NfbW9kaWZpZXIodWludDY0
X3QgbW9kaWZpZXIpCiB7CiAKIAlyZXR1cm4gbW9kaWZpZXIgPT0gSTkxNV9GT1JNQVRfTU9EX1lf
VElMRURfR0VOMTJfUkNfQ0NTIHx8CisJCW1vZGlmaWVyID09IEk5MTVfRk9STUFUX01PRF9ZX1RJ
TEVEX0dFTjEyX01DX0NDUyB8fAogCQltb2RpZmllciA9PSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxF
RF9DQ1MgfHwKIAkJbW9kaWZpZXIgPT0gSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVEX0NDUzsKIH0K
QEAgLTY4NSw2ICs2ODcsNyBAQCB1aW50NjRfdCBpZ3RfZmJfbW9kX3RvX3RpbGluZyh1aW50NjRf
dCBtb2RpZmllcikKIAljYXNlIExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZX1RJTEVEOgogCWNhc2Ug
TE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfQ0NTOgogCWNhc2UgTE9DQUxfSTkxNV9GT1JN
QVRfTU9EX1lfVElMRURfR0VOMTJfUkNfQ0NTOgorCWNhc2UgTE9DQUxfSTkxNV9GT1JNQVRfTU9E
X1lfVElMRURfR0VOMTJfTUNfQ0NTOgogCQlyZXR1cm4gSTkxNV9USUxJTkdfWTsKIAljYXNlIExP
Q0FMX0k5MTVfRk9STUFUX01PRF9ZZl9USUxFRDoKIAljYXNlIExPQ0FMX0k5MTVfRk9STUFUX01P
RF9ZZl9USUxFRF9DQ1M6Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
