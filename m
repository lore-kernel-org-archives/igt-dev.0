Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA4E6E2CF
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 13:36:59 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Feb 2019 15:36:52 +0200
Message-Id: <20190207133652.5346-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Fix comparison of unsigned
 integers
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RGlmZmVyZW5jZSBvZiB1bnNpZ25lZCBpbnRzIGlzIHVuc2lnbmVkIGludCwgYW5kIHRoZXJlZm9y
ZSBhbHdheXMKbGFyZ2VyIHRoYW4gemVyby4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KLS0tCiB0ZXN0cy9rbXNfZmxpcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zs
aXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMKaW5kZXggNzk4ZmM0ZTguLjk2ZjRhMmY3IDEwMDc1NQot
LS0gYS90ZXN0cy9rbXNfZmxpcC5jCisrKyBiL3Rlc3RzL2ttc19mbGlwLmMKQEAgLTUwMiw3ICs1
MDIsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19zdGF0ZShjb25zdCBzdHJ1Y3QgdGVzdF9vdXRwdXQg
Km8sIGNvbnN0IHN0cnVjdCBldmVudF9zdGF0ZSAqZQogCWlmIChvLT5mbGFncyAmIFRFU1RfVFNf
Q09OVCkgewogCQkvKiBJZ25vcmUgc2VxX3N0ZXAgaGVyZSBzaW5jZSB2Ymxhbmsgd2FpdHMgdGlt
ZSBvdXQgaW1tZWRpYXRlbHkKIAkJICogd2hlbiB3ZSBraWxsIHRoZSBjcnRjLiAqLwotCQlpZ3Rf
YXNzZXJ0X2YoZXMtPmN1cnJlbnRfc2VxIC0gZXMtPmxhc3Rfc2VxID49IDAsCisJCWlndF9hc3Nl
cnRfZihlcy0+Y3VycmVudF9zZXEgPj0gZXMtPmxhc3Rfc2VxLAogCQkJICAgICAidW5leHBlY3Rl
ZCAlcyBzZXEgJXUsIHNob3VsZCBiZSA+PSAldVxuIiwKIAkJCSAgICAgZXMtPm5hbWUsIGVzLT5j
dXJyZW50X3NlcSwgZXMtPmxhc3Rfc2VxKTsKIAkJaWd0X2Fzc2VydF9mKGVzLT5jdXJyZW50X3Nl
cSAtIGVzLT5sYXN0X3NlcSA8PSAxNTAsCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
