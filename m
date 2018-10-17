Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166556E02B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 09:13:28 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 17 Oct 2018 05:13:20 -0400
Message-Id: <1539767601-16519-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] [CI] tests/pm_backlight.c: Fix
 brightness failure with system suspend
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

VGhpcyBwYXRjaCB0cmllcyB0byBmaXggdGhlIGZhbGl1cmUgb2NjdXJpbmcgZHVyaW5nIHN1YnRl
c3QKImZhZGVfd2l0aF9zdXNwZW5kIi4gRmFpbHVyZSBpcyBvY2N1cmluZyBiZWNhdXNlLCBicmln
aHRuZXNzCnZhbHVlIGlzIGJlaW5nIGNoZWNrZWQgYmVmb3JlIGRyaXZlciBpbml0aWFsaXplcyBm
dWxseSBhZnRlciByZXN1bWUuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODQ3ClNpZ25lZC1vZmYtYnk6IEp5b3RpIFlhZGF2IDxqeW90
aS5yLnlhZGF2QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9iYWNrbGlnaHQuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fYmFja2xp
Z2h0LmMgYi90ZXN0cy9wbV9iYWNrbGlnaHQuYwppbmRleCAzMjgwOGNkLi5lYzA0N2IzIDEwMDY0
NAotLS0gYS90ZXN0cy9wbV9iYWNrbGlnaHQuYworKysgYi90ZXN0cy9wbV9iYWNrbGlnaHQuYwpA
QCAtMTgzLDYgKzE4Myw3IEBAIHRlc3RfZmFkZV93aXRoX3N1c3BlbmQoc3RydWN0IGNvbnRleHQg
KmNvbnRleHQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KQogCWlndF9yZXF1aXJlKGlndF93YWl0X2Zv
cl9wbV9zdGF0dXMoSUdUX1JVTlRJTUVfUE1fU1RBVFVTX1NVU1BFTkRFRCkpOwogCiAJaWd0X3N5
c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoU1VTUEVORF9TVEFURV9NRU0sIFNVU1BFTkRfVEVTVF9O
T05FKTsKKwlpZ3RfcmVxdWlyZShpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5USU1FX1BN
X1NUQVRVU19BQ1RJVkUpKTsKIAogCXRlc3RfZmFkZShjb250ZXh0KTsKIH0KLS0gCjEuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
