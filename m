Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id BDA9E6ECE6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 14:28:49 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 22 Jan 2019 15:28:37 +0100
Message-Id: <20190122142844.20899-8-maxime.ripard@bootlin.com>
In-Reply-To: <20190122142844.20899-1-maxime.ripard@bootlin.com>
References: <20190122142844.20899-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 07/14] igt: fb: Account for all planes bpp
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
YW5kIHVzZSB0aGUgcmVzdWx0IHRvIGFsbG9jYXRlIG91ciBidWZmZXIuCgpTaWduZWQtb2ZmLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgotLS0KIGxpYi9pZ3Rf
ZmIuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRl
eCAwZjQwMjFiNzdlNWYuLjBmMDQzYWNjZTI5ZCAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisr
KyBiL2xpYi9pZ3RfZmIuYwpAQCAtNTI4LDcgKzUyOCw5IEBAIHN0YXRpYyB2b2lkIGNsZWFyX3l1
dl9idWZmZXIoc3RydWN0IGlndF9mYiAqZmIpCiAvKiBoZWxwZXJzIHRvIGNyZWF0ZSBuaWNlLWxv
b2tpbmcgZnJhbWVidWZmZXJzICovCiBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIoc3RydWN0
IGlndF9mYiAqZmIpCiB7CisJY29uc3Qgc3RydWN0IGZvcm1hdF9kZXNjX3N0cnVjdCAqZm10ID0g
bG9va3VwX2RybV9mb3JtYXQoZmItPmRybV9mb3JtYXQpOwogCXVpbnQ2NF90IHNpemUgPSBjYWxj
X2ZiX3NpemUoZmIpOworCXVuc2lnbmVkIGludCBwbGFuZSwgYnBwOwogCWludCBmZCA9IGZiLT5m
ZDsKIAogCS8qIHJlc3BlY3QgdGhlIHNpemUgcmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIgKi8KQEAg
LTU1NywxMCArNTU5LDEzIEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0
X2ZiICpmYikKIAkJfQogCX0KIAorCWZvciAocGxhbmUgPSAwOyBwbGFuZSA8IGZiLT5udW1fcGxh
bmVzOyBwbGFuZSsrKQorCQlicHAgKz0gRElWX1JPVU5EX1VQKGZiLT5wbGFuZV9icHBbcGxhbmVd
LAorCQkJCSAgICBwbGFuZSA/IGZtdC0+aHN1YiAqIGZtdC0+dnN1YiA6IDEpOworCiAJZmItPmlz
X2R1bWIgPSB0cnVlOwogCWZiLT5nZW1faGFuZGxlID0ga21zdGVzdF9kdW1iX2NyZWF0ZShmZCwg
ZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkgICAgIGZiLT5wbGFuZV9icHBbMF0sCi0JCQkJ
CSAgICAgJmZiLT5zdHJpZGVzWzBdLCAmZmItPnNpemUpOworCQkJCQkgICAgIGJwcCwgJmZiLT5z
dHJpZGVzWzBdLCAmZmItPnNpemUpOwogCiAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwogfQotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
