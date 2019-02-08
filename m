Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DBD6EDD9
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:19:18 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri,  8 Feb 2019 14:18:54 +0100
Message-Id: <20190208131901.1400-4-maxime.ripard@bootlin.com>
In-Reply-To: <20190208131901.1400-1-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 03/10] igt: fb: Account for all planes bpp
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
Yi9pZ3RfZmIuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIu
YwppbmRleCBjYTQ4NjU1MTljMTMuLmNhMTljMDM0ZjRhMyAxMDA2NDQKLS0tIGEvbGliL2lndF9m
Yi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtNTI4LDYgKzUyOCw5IEBAIHN0YXRpYyB2b2lkIGNs
ZWFyX3l1dl9idWZmZXIoc3RydWN0IGlndF9mYiAqZmIpCiAvKiBoZWxwZXJzIHRvIGNyZWF0ZSBu
aWNlLWxvb2tpbmcgZnJhbWVidWZmZXJzICovCiBzdGF0aWMgaW50IGNyZWF0ZV9ib19mb3JfZmIo
c3RydWN0IGlndF9mYiAqZmIpCiB7CisJY29uc3Qgc3RydWN0IGZvcm1hdF9kZXNjX3N0cnVjdCAq
Zm10ID0gbG9va3VwX2RybV9mb3JtYXQoZmItPmRybV9mb3JtYXQpOworCXVuc2lnbmVkIGludCBi
cHAgPSAwOworCXVuc2lnbmVkIGludCBwbGFuZTsKIAlpbnQgZmQgPSBmYi0+ZmQ7CiAKIAlpZiAo
ZmItPnRpbGluZyB8fCBmYi0+c2l6ZSB8fCBmYi0+c3RyaWRlc1swXSB8fCBpZ3RfZm9ybWF0X2lz
X3l1dihmYi0+ZHJtX2Zvcm1hdCkpIHsKQEAgLTU3MCwxMSArNTczLDEzIEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpmYikKIAlpZ3RfYXNzZXJ0KGZiLT5zdHJp
ZGVzWzBdID09IDApOwogCiAJZmItPnNpemUgPSBjYWxjX2ZiX3NpemUoZmIpOworCWZvciAocGxh
bmUgPSAwOyBwbGFuZSA8IGZiLT5udW1fcGxhbmVzOyBwbGFuZSsrKQorCQlicHAgKz0gRElWX1JP
VU5EX1VQKGZiLT5wbGFuZV9icHBbcGxhbmVdLAorCQkJCSAgICBwbGFuZSA/IGZtdC0+aHN1YiAq
IGZtdC0+dnN1YiA6IDEpOwogCiAJZmItPmlzX2R1bWIgPSB0cnVlOwogCWZiLT5nZW1faGFuZGxl
ID0ga21zdGVzdF9kdW1iX2NyZWF0ZShmZCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkg
ICAgIGZiLT5wbGFuZV9icHBbMF0sCi0JCQkJCSAgICAgJmZiLT5zdHJpZGVzWzBdLCAmZmItPnNp
emUpOworCQkJCQkgICAgIGJwcCwgJmZiLT5zdHJpZGVzWzBdLCAmZmItPnNpemUpOwogCiAJcmV0
dXJuIGZiLT5nZW1faGFuZGxlOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
