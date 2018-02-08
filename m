Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A2F6E13E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2018 08:01:42 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id 143so7674034wma.5
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Feb 2018 00:01:42 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu,  8 Feb 2018 08:01:30 +0000
Message-Id: <20180208080131.3004-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
References: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/perf_pmu: Handle thermally
 throttled devices
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNvbWUgc3lz
dGVtcyBjYW5ub3QgcmVhY2ggdGhlIGFkdmVydGlzZWQgbWF4aW11bSBmcmVxdWVuY3kgZHVlIHRo
cm90dGxpbmcuCkhhbmRsZSB0aGVtIGJ5IGNvbnNpZGVyaW5nIGEgMTAwTUh6IGxvd2VyIGxpbWl0
LgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KLS0tCiB0ZXN0cy9wZXJmX3BtdS5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUu
YyBiL3Rlc3RzL3BlcmZfcG11LmMKaW5kZXggNzBmYjZiZDU1ZTUzLi4wN2IyNTc2NWYxZjYgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL3BlcmZfcG11LmMKKysrIGIvdGVzdHMvcGVyZl9wbXUuYwpAQCAtMTIy
Miw4ICsxMjIyLDEzIEBAIHRlc3RfZnJlcXVlbmN5KGludCBnZW1fZmQpCiAJCSBtaW5bMF0sIG1p
blsxXSk7CiAJaWd0X2luZm8oIk1heCBmcmVxdWVuY3k6IHJlcXVlc3RlZCAlLjFmLCBhY3R1YWwg
JS4xZlxuIiwKIAkJIG1heFswXSwgbWF4WzFdKTsKKwogCWFzc2VydF93aXRoaW5fZXBzaWxvbiht
aW5bMF0sIG1pbl9mcmVxLCB0b2xlcmFuY2UpOwotCWFzc2VydF93aXRoaW5fZXBzaWxvbihtYXhb
MF0sIG1heF9mcmVxLCB0b2xlcmFuY2UpOworCS8qCisJICogT24gdGhlcm1hbGx5IHRocm90dGxl
ZCBkZXZpY2VzIHdlIGNhbm5vdCBiZSBzdXJlIG1heGltdW0gZnJlcXVlbmN5CisJICogY2FuIGJl
IHJlYWNoZWQgc28gdXNlIGEgbG93ZXIgbGltaXQuCisJICovCisJaWd0X2Fzc2VydChtYXhbMF0g
Pj0gKChkb3VibGUpbWF4X2ZyZXEgLSAxMDAuMCkpOwogfQogCiBzdGF0aWMgYm9vbCB3YWl0X2Zv
cl9yYzYoaW50IGZkKQotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
