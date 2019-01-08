Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA02A6EF8D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:20:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  8 Jan 2019 16:19:52 +0100
Message-Id: <20190108152001.5367-6-maxime.ripard@bootlin.com>
In-Reply-To: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 06/13] igt: fb: Refactor dumb buffer
 allocation path
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGVsc2UgY29uZGl0aW9uIGlzIG5vdCBuZWVkZWQsIHNpbmNlIGFsbCB0aGUgb3RoZXIgY29u
ZGl0aW9ucyByZXR1cm4Kd2hlbiB0aGV5IGFyZSBkb25lLgoKTW92ZSB0aGUgS01TIGR1bWIgYnVm
ZmVyIGFsbG9jYXRpb24gb3V0c2lkZSBvZiB0aGUgb3V0ZXIgZWxzZSBjb25kaXRpb24sCnRoaXMg
d2lsbCBhbHNvIGFsbG93IHRvIGVhc2UgbGF0ZXIgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2lndF9mYi5j
IHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwpp
bmRleCAzMWU0NGQ2MTg4ZDkuLjJjMzNhODk5YmMwNCAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5j
CisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtNTU1LDE1ICs1NTUsMTQgQEAgc3RhdGljIGludCBjcmVh
dGVfYm9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQogCQkJaWd0X3JlcXVpcmUoZHJpdmVyX2hh
c19nZW1fYXBpKTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9Ci0JfSBlbHNlIHsKLQkJZmItPmlz
X2R1bWIgPSB0cnVlOwotCi0JCWZiLT5nZW1faGFuZGxlID0ga21zdGVzdF9kdW1iX2NyZWF0ZShm
ZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLAot
CQkJCQkJICAgICAmZmItPnN0cmlkZXNbMF0sICZmYi0+c2l6ZSk7Ci0KLQkJcmV0dXJuIGZiLT5n
ZW1faGFuZGxlOwogCX0KKworCWZiLT5pc19kdW1iID0gdHJ1ZTsKKwlmYi0+Z2VtX2hhbmRsZSA9
IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKKwkJCQkJICAg
ICBmYi0+cGxhbmVfYnBwWzBdLAorCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZiLT5zaXpl
KTsKKworCXJldHVybiBmYi0+Z2VtX2hhbmRsZTsKIH0KIAogLyoqCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
