Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 470FF6E027
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:59:05 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 25 Jan 2019 15:58:35 +0100
Message-Id: <20190125145842.15738-7-maxime.ripard@bootlin.com>
In-Reply-To: <20190125145842.15738-1-maxime.ripard@bootlin.com>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 06/13] igt: fb: Account for all planes bpp
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

V2hlbiBhbGxvY2F0aW5nIGEgZHVtYiBidWZmZXIgZm9yIGEgZm9ybWF0IHdpdGggbXVsdGlwbGUg
cGxhbmUsIHdlIG5lZWQgdG8KYWNjb3VudCBmb3IgYWxsIHBsYW5lJ3MgYnBwIGluIG9yZGVyIHRv
IGFsbG9jYXRlIHRoZSBwcm9wZXIgc2l6ZS4KCkxldCdzIGFkZCBhbGwgdGhlIHBsYW5lcyBicHAg
YW5kIHVzZSB0aGUgcmVzdWx0IHRvIGFsbG9jYXRlIG91ciBidWZmZXIuCgpSZXZpZXdlZC1ieTog
UGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgpTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgotLS0KIGxp
Yi9pZ3RfZmIuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5j
CmluZGV4IDI3MGRiOGQ2ZGM5MC4uMWM1MmFlYmI2NzRlIDEwMDY0NAotLS0gYS9saWIvaWd0X2Zi
LmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC01MjgsNiArNTI4LDggQEAgc3RhdGljIHZvaWQgY2xl
YXJfeXV2X2J1ZmZlcihzdHJ1Y3QgaWd0X2ZiICpmYikKIC8qIGhlbHBlcnMgdG8gY3JlYXRlIG5p
Y2UtbG9va2luZyBmcmFtZWJ1ZmZlcnMgKi8KIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihz
dHJ1Y3QgaWd0X2ZiICpmYikKIHsKKwljb25zdCBzdHJ1Y3QgZm9ybWF0X2Rlc2Nfc3RydWN0ICpm
bXQgPSBsb29rdXBfZHJtX2Zvcm1hdChmYi0+ZHJtX2Zvcm1hdCk7CisJdW5zaWduZWQgaW50IHBs
YW5lLCBicHA7CiAJaW50IGZkID0gZmItPmZkOwogCiAJaWYgKGZiLT50aWxpbmcgfHwgZmItPnNp
emUgfHwgZmItPnN0cmlkZXNbMF0gfHwgaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3JtYXQp
KSB7CkBAIC01NjgsMTEgKzU3MCwxMyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3Ry
dWN0IGlndF9mYiAqZmIpCiAJaWd0X2Fzc2VydChmYi0+c3RyaWRlc1swXSA9PSAwKTsKIAogCWZi
LT5zaXplID0gY2FsY19mYl9zaXplKGZiKTsKKwlmb3IgKHBsYW5lID0gMDsgcGxhbmUgPCBmYi0+
bnVtX3BsYW5lczsgcGxhbmUrKykKKwkJYnBwICs9IERJVl9ST1VORF9VUChmYi0+cGxhbmVfYnBw
W3BsYW5lXSwKKwkJCQkgICAgcGxhbmUgPyBmbXQtPmhzdWIgKiBmbXQtPnZzdWIgOiAxKTsKIAog
CWZiLT5pc19kdW1iID0gdHJ1ZTsKIAlmYi0+Z2VtX2hhbmRsZSA9IGttc3Rlc3RfZHVtYl9jcmVh
dGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKLQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBd
LAotCQkJCQkgICAgICZmYi0+c3RyaWRlc1swXSwgJmZiLT5zaXplKTsKKwkJCQkJICAgICBicHAs
ICZmYi0+c3RyaWRlc1swXSwgJmZiLT5zaXplKTsKIAogCXJldHVybiBmYi0+Z2VtX2hhbmRsZTsK
IH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
