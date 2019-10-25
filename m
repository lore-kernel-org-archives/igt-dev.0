Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7696EA66
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2019 14:31:02 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 25 Oct 2019 17:30:50 +0300
Message-Id: <20191025143050.18205-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20191025143050.18205-1-ville.syrjala@linux.intel.com>
References: <20191025143050.18205-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Pimp "no conversion
 specified" assert
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRl
Y29kZSB0aGUgZm91cmNjcyB0byBtYWtlIHRoaW5ncyBhIGJpdCBtb3JlIGh1bWFuIHJlYWRhYmxl
CmlmIHRoZSBhc3NlcnRpb24gdHJpcHMuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDYgKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCBhYWVjYTc5NTU0MTgu
LjRhZGNhOTY3MmYzMyAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIu
YwpAQCAtMzA5Niw4ICszMDk2LDEwIEBAIHN0YXRpYyB2b2lkIGZiX2NvbnZlcnQoc3RydWN0IGZi
X2NvbnZlcnQgKmN2dCkKIAl9CiAKIAlpZ3RfYXNzZXJ0X2YoZmFsc2UsCi0JCSAgICAgIkNvbnZl
cnNpb24gbm90IGltcGxlbWVudGVkIChmcm9tIGZvcm1hdCAweCV4IHRvIDB4JXgpXG4iLAotCQkg
ICAgIGN2dC0+c3JjLmZiLT5kcm1fZm9ybWF0LCBjdnQtPmRzdC5mYi0+ZHJtX2Zvcm1hdCk7CisJ
CSAgICAgIkNvbnZlcnNpb24gbm90IGltcGxlbWVudGVkIChmcm9tIGZvcm1hdCAiCisJCSAgICAg
SUdUX0ZPUk1BVF9GTVQgIiB0byAiIElHVF9GT1JNQVRfRk1UICIpXG4iLAorCQkgICAgIElHVF9G
T1JNQVRfQVJHUyhjdnQtPnNyYy5mYi0+ZHJtX2Zvcm1hdCksCisJCSAgICAgSUdUX0ZPUk1BVF9B
UkdTKGN2dC0+ZHN0LmZiLT5kcm1fZm9ybWF0KSk7CiB9CiAKIHN0YXRpYyB2b2lkIGRlc3Ryb3lf
Y2Fpcm9fc3VyZmFjZV9fY29udmVydCh2b2lkICphcmcpCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
