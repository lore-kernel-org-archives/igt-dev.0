Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 189416ECE6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 14:28:51 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 22 Jan 2019 15:28:39 +0100
Message-Id: <20190122142844.20899-10-maxime.ripard@bootlin.com>
In-Reply-To: <20190122142844.20899-1-maxime.ripard@bootlin.com>
References: <20190122142844.20899-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 09/14] igt: fb: Clear YUV dumb buffers
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

WVVWIGR1bWIgYnVmZmVycywganVzdCBsaWtlIGk5MTUgR0VNIGJ1ZmZlcnMgYWxzbyBuZWVkIHRv
IGJlIGNsZWFyZWQgb25jZQphbGxvY2F0ZWQuIE1ha2Ugc3VyZSBpdCBoYXBwZW5zLgoKU2lnbmVk
LW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBs
aWIvaWd0X2ZiLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA0OTA1NjNjMGVhNGIu
LjRiZWNiYjRkYmMwOCAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIu
YwpAQCAtNTgyLDYgKzU4Miw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3Qg
aWd0X2ZiICpmYikKIAlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZi
LT53aWR0aCwgZmItPmhlaWdodCwKIAkJCQkJICAgICBicHAsIHN0cmlkZXMsICZmYi0+c2l6ZSk7
CiAKKwlpZiAoaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3JtYXQpKQorCQljbGVhcl95dXZf
YnVmZmVyKGZiKTsKKwogCXJldHVybiBmYi0+Z2VtX2hhbmRsZTsKIH0KIAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
