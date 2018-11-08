Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9E6E5F7
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Nov 2018 11:20:25 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Thu,  8 Nov 2018 06:20:18 -0500
Message-Id: <1541676018-6502-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/pm_backlight.c: Fix brightness
 failure with system suspend
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCB0cmllcyB0byBmaXggdGhlIGZhbGl1cmUgb2NjdXJpbmcgZHVyaW5nIHN1YnRl
c3QKImZhZGVfd2l0aF9zdXNwZW5kIi4gRmFpbHVyZSBpcyBvY2N1cmluZyBiZWNhdXNlLCBicmln
aHRuZXNzCnZhbHVlIGlzIGJlaW5nIGNoZWNrZWQgYmVmb3JlIGRyaXZlciBpbml0aWFsaXplcyBm
dWxseSBhZnRlciByZXN1bWUuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODQ3ClNpZ25lZC1vZmYtYnk6IEp5b3RpIFlhZGF2IDxqeW90
aS5yLnlhZGF2QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9iYWNrbGlnaHQuYyB8IDYgKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvcG1fYmFja2xpZ2h0LmMgYi90ZXN0cy9wbV9iYWNrbGlnaHQuYwppbmRleCAzMjgwOGNk
Li4xNTkzNjZjIDEwMDY0NAotLS0gYS90ZXN0cy9wbV9iYWNrbGlnaHQuYworKysgYi90ZXN0cy9w
bV9iYWNrbGlnaHQuYwpAQCAtMTc3LDEyICsxNzcsOCBAQCB0ZXN0X2ZhZGVfd2l0aF9zdXNwZW5k
KHN0cnVjdCBjb250ZXh0ICpjb250ZXh0LCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkKIHsKIAlpZ3Rf
cmVxdWlyZShpZ3Rfc2V0dXBfcnVudGltZV9wbSgpKTsKIAotCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rv
cl9kcG1zKG91dHB1dC0+ZGlzcGxheS0+ZHJtX2ZkLAotCQkJCSAgIG91dHB1dC0+Y29uZmlnLmNv
bm5lY3RvciwKLQkJCQkgICBEUk1fTU9ERV9EUE1TX09GRik7Ci0JaWd0X3JlcXVpcmUoaWd0X3dh
aXRfZm9yX3BtX3N0YXR1cyhJR1RfUlVOVElNRV9QTV9TVEFUVVNfU1VTUEVOREVEKSk7Ci0KIAlp
Z3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3VtZShTVVNQRU5EX1NUQVRFX01FTSwgU1VTUEVORF9U
RVNUX05PTkUpOworCWlndF9yZXF1aXJlKGlndF93YWl0X2Zvcl9wbV9zdGF0dXMoSUdUX1JVTlRJ
TUVfUE1fU1RBVFVTX0FDVElWRSkpOwogCiAJdGVzdF9mYWRlKGNvbnRleHQpOwogfQotLSAKMS45
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
