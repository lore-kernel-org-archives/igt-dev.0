Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F234A6E5D2
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 10:30:07 +0000 (UTC)
Received: by mail-wr0-x242.google.com with SMTP id p104so2948639wrc.12
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 02:30:07 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 21 Feb 2018 10:29:57 +0000
Message-Id: <20180221102957.6334-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_perf: Find active perf CPU
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkluc3RlYWQg
b2YgYXNzdW1pbmcgUE1VIHJ1bnMgb24gQ1BVMCwgdHJ5IGFsbCBwb3NzaWJsZSBDUFVzIGlmIHRo
YXQgaXMgbm90CnRoZSBjYXNlLiBUaGlzIG1ha2VzIHRoZSBjYWxsZXJzIGhhbmRsZSBmYWxsb3V0
IGZyb20gYnJva2VuIHRlc3RzIGJldHRlciwKYXMgd2VsbCBhcyBzeXNhZG1pbiBpbnRlcnZlbnRp
b25zIHdoZXJlIGNhbGxlcnMgYXJlIG5vdCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IFR2cnRrbyBV
cnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBsaWIvaWd0X3BlcmYuYyB8IDkgKysrKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL2lndF9wZXJmLmMgYi9saWIvaWd0X3BlcmYuYwppbmRleCAwMjIxNDYxZTkxOGYuLjk5
ZDgyZWE1MWM5YiAxMDA2NDQKLS0tIGEvbGliL2lndF9wZXJmLmMKKysrIGIvbGliL2lndF9wZXJm
LmMKQEAgLTQsNiArNCw3IEBACiAjaW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8c3RyaW5n
Lmg+CiAjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlIDxzeXMvc3lzaW5mby5oPgogCiAjaW5j
bHVkZSAiaWd0X3BlcmYuaCIKIApAQCAtMzEsNiArMzIsOCBAQCBzdGF0aWMgaW50CiBfcGVyZl9v
cGVuKHVpbnQ2NF90IHR5cGUsIHVpbnQ2NF90IGNvbmZpZywgaW50IGdyb3VwLCB1aW50NjRfdCBm
b3JtYXQpCiB7CiAJc3RydWN0IHBlcmZfZXZlbnRfYXR0ciBhdHRyID0geyB9OworCWludCBucl9j
cHVzID0gZ2V0X25wcm9jc19jb25mKCk7CisJaW50IGNwdSA9IDAsIHJldDsKIAogCWF0dHIudHlw
ZSA9IHR5cGU7CiAJaWYgKGF0dHIudHlwZSA9PSAwKQpAQCAtNDIsNyArNDUsMTEgQEAgX3BlcmZf
b3Blbih1aW50NjRfdCB0eXBlLCB1aW50NjRfdCBjb25maWcsIGludCBncm91cCwgdWludDY0X3Qg
Zm9ybWF0KQogCWF0dHIucmVhZF9mb3JtYXQgPSBmb3JtYXQ7CiAJYXR0ci5jb25maWcgPSBjb25m
aWc7CiAKLQlyZXR1cm4gcGVyZl9ldmVudF9vcGVuKCZhdHRyLCAtMSwgMCwgZ3JvdXAsIDApOwor
CWRvIHsKKwkJcmV0ID0gcGVyZl9ldmVudF9vcGVuKCZhdHRyLCAtMSwgY3B1KyssIGdyb3VwLCAw
KTsKKwl9IHdoaWxlICgocmV0IDwgMCAmJiBlcnJubyA9PSBFSU5WQUwpICYmIChjcHUgPCBucl9j
cHVzKSk7CisKKwlyZXR1cm4gcmV0OwogfQogCiBpbnQgcGVyZl9pOTE1X29wZW4odWludDY0X3Qg
Y29uZmlnKQotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
