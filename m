Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21EB96EF90
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:20:05 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  8 Jan 2019 16:19:54 +0100
Message-Id: <20190108152001.5367-8-maxime.ripard@bootlin.com>
In-Reply-To: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 08/13] igt: fb: Clear YUV dumb buffers
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
ZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA5NmQ1NmQwZTYzYmUu
LjI2M2E4ODlkYmFhMyAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIu
YwpAQCAtNTY1LDYgKzU2NSw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3Qg
aWd0X2ZiICpmYikKIAlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZi
LT53aWR0aCwgZmItPmhlaWdodCwKIAkJCQkJICAgICBicHAsICZmYi0+c3RyaWRlc1swXSwgJmZi
LT5zaXplKTsKIAorCWlmIChpZ3RfZm9ybWF0X2lzX3l1dihmYi0+ZHJtX2Zvcm1hdCkpCisJCWNs
ZWFyX3l1dl9idWZmZXIoZmIpOworCiAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwogfQogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
