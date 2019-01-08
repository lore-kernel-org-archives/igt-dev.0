Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6529F6EF8A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:20:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  8 Jan 2019 16:19:51 +0100
Message-Id: <20190108152001.5367-5-maxime.ripard@bootlin.com>
In-Reply-To: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 05/13] igt: fb: Move size computation to
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
OGQuLjMxZTQ0ZDYxODhkOSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3Rf
ZmIuYwpAQCAtNTI4LDE2ICs1MjgsMTQgQEAgc3RhdGljIHZvaWQgY2xlYXJfeXV2X2J1ZmZlcihz
dHJ1Y3QgaWd0X2ZiICpmYikKIC8qIGhlbHBlcnMgdG8gY3JlYXRlIG5pY2UtbG9va2luZyBmcmFt
ZWJ1ZmZlcnMgKi8KIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpm
YikKIHsKKwl1aW50NjRfdCBzaXplID0gY2FsY19mYl9zaXplKGZiKTsKIAlpbnQgZmQgPSBmYi0+
ZmQ7CiAKKwkvKiByZXNwZWN0IHRoZSBzaXplIHJlcXVlc3RlZCBieSB0aGUgY2FsbGVyICovCisJ
aWYgKGZiLT5zaXplID09IDApCisJCWZiLT5zaXplID0gc2l6ZTsKKwogCWlmIChmYi0+dGlsaW5n
IHx8IGZiLT5zaXplIHx8IGZiLT5zdHJpZGVzWzBdIHx8IGlndF9mb3JtYXRfaXNfeXV2KGZiLT5k
cm1fZm9ybWF0KSkgewotCQl1aW50NjRfdCBzaXplOwotCi0JCXNpemUgPSBjYWxjX2ZiX3NpemUo
ZmIpOwotCi0JCS8qIHJlc3BlY3QgdGhlIHNpemUgcmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIgKi8K
LQkJaWYgKGZiLT5zaXplID09IDApCi0JCQlmYi0+c2l6ZSA9IHNpemU7CiAKIAkJZmItPmlzX2R1
bWIgPSBmYWxzZTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
