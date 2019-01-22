Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8404289C82
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 13:43:11 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 22 Jan 2019 14:42:49 +0100
Message-Id: <20190122134257.14038-7-maxime.ripard@bootlin.com>
In-Reply-To: <20190122134257.14038-1-maxime.ripard@bootlin.com>
References: <20190122134257.14038-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 06/14] igt: fb: Refactor dumb buffer
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
d2lsbCBhbHNvIGFsbG93IHRvIGVhc2UgbGF0ZXIgY2hhbmdlcy4KClJldmlld2VkLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2ln
dF9mYi5jIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3Rf
ZmIuYwppbmRleCBhMTM2OGVjNDcwM2EuLjBmNDAyMWI3N2U1ZiAxMDA2NDQKLS0tIGEvbGliL2ln
dF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtNTU1LDE1ICs1NTUsMTQgQEAgc3RhdGljIGlu
dCBjcmVhdGVfYm9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQogCQkJaWd0X3JlcXVpcmUoZHJp
dmVyX2hhc19nZW1fYXBpKTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9Ci0JfSBlbHNlIHsKLQkJ
ZmItPmlzX2R1bWIgPSB0cnVlOwotCi0JCWZiLT5nZW1faGFuZGxlID0ga21zdGVzdF9kdW1iX2Ny
ZWF0ZShmZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkJICAgICBmYi0+cGxhbmVfYnBw
WzBdLAotCQkJCQkJICAgICAmZmItPnN0cmlkZXNbMF0sICZmYi0+c2l6ZSk7Ci0KLQkJcmV0dXJu
IGZiLT5nZW1faGFuZGxlOwogCX0KKworCWZiLT5pc19kdW1iID0gdHJ1ZTsKKwlmYi0+Z2VtX2hh
bmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKKwkJ
CQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLAorCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZi
LT5zaXplKTsKKworCXJldHVybiBmYi0+Z2VtX2hhbmRsZTsKIH0KIAogLyoqCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
