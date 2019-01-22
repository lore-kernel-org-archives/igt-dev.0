Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F8E489C82
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 13:43:11 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 22 Jan 2019 14:42:48 +0100
Message-Id: <20190122134257.14038-6-maxime.ripard@bootlin.com>
In-Reply-To: <20190122134257.14038-1-maxime.ripard@bootlin.com>
References: <20190122134257.14038-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 05/14] igt: fb: Move size computation to
 the common path
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

SW4gb3JkZXIgdG8gcHJvcGVybHkgc3VwcG9ydCB0aGUgWVVWIGJ1ZmZlciBvbiBub24taTkxNSBw
bGF0Zm9ybXMsIHdlIG5lZWQKdG8gcnVuIGNhbGNfZmJfc2l6ZSBmb3IgdGhlIGR1bWIgYnVmZmVy
cyBhbGxvY2F0aW9uIHBhdGggdG9vLiBNb3ZlIGl0IG91dApvZiB0aGUgc3BlY2lhbCBjYXNlIGFu
ZCBpbiB0aGUgY29tbW9uIGNvZGUgcGF0aC4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgMTIgKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCBkNjljM2ZiMmQz
OGQuLmExMzY4ZWM0NzAzYSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3Rf
ZmIuYwpAQCAtNTI4LDE2ICs1MjgsMTQgQEAgc3RhdGljIHZvaWQgY2xlYXJfeXV2X2J1ZmZlcihz
dHJ1Y3QgaWd0X2ZiICpmYikKIC8qIGhlbHBlcnMgdG8gY3JlYXRlIG5pY2UtbG9va2luZyBmcmFt
ZWJ1ZmZlcnMgKi8KIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpm
YikKIHsKKwl1aW50NjRfdCBzaXplID0gY2FsY19mYl9zaXplKGZiKTsKIAlpbnQgZmQgPSBmYi0+
ZmQ7CiAKLQlpZiAoZmItPnRpbGluZyB8fCBmYi0+c2l6ZSB8fCBmYi0+c3RyaWRlc1swXSB8fCBp
Z3RfZm9ybWF0X2lzX3l1dihmYi0+ZHJtX2Zvcm1hdCkpIHsKLQkJdWludDY0X3Qgc2l6ZTsKKwkv
KiByZXNwZWN0IHRoZSBzaXplIHJlcXVlc3RlZCBieSB0aGUgY2FsbGVyICovCisJaWYgKGZiLT5z
aXplID09IDApCisJCWZiLT5zaXplID0gc2l6ZTsKIAotCQlzaXplID0gY2FsY19mYl9zaXplKGZi
KTsKLQotCQkvKiByZXNwZWN0IHRoZSBzaXplIHJlcXVlc3RlZCBieSB0aGUgY2FsbGVyICovCi0J
CWlmIChmYi0+c2l6ZSA9PSAwKQotCQkJZmItPnNpemUgPSBzaXplOworCWlmIChmYi0+dGlsaW5n
IHx8IGZiLT5zaXplIHx8IGlndF9mb3JtYXRfaXNfeXV2KGZiLT5kcm1fZm9ybWF0KSkgewogCiAJ
CWZiLT5pc19kdW1iID0gZmFsc2U7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
