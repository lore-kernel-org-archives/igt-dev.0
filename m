Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2DAE6E027
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:59:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 25 Jan 2019 15:58:37 +0100
Message-Id: <20190125145842.15738-9-maxime.ripard@bootlin.com>
In-Reply-To: <20190125145842.15738-1-maxime.ripard@bootlin.com>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 08/13] igt: fb: Clear YUV dumb buffers
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
IGJlIGNsZWFyZWQgb25jZQphbGxvY2F0ZWQuIE1ha2Ugc3VyZSBpdCBoYXBwZW5zLgoKUmV2aWV3
ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4K
U2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
LS0tCiBsaWIvaWd0X2ZiLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCAwNDhkMjc0
ZTVkMzYuLjY1YWE5OWVjZjdhZSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9p
Z3RfZmIuYwpAQCAtNTkzLDYgKzU5Myw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihz
dHJ1Y3QgaWd0X2ZiICpmYikKIAlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUo
ZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKIAkJCQkJICAgICBicHAsIHN0cmlkZXMsICZmYi0+
c2l6ZSk7CiAKKwlpZiAoaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3JtYXQpKQorCQljbGVh
cl95dXZfYnVmZmVyKGZiKTsKKwogCXJldHVybiBmYi0+Z2VtX2hhbmRsZTsKIH0KIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
