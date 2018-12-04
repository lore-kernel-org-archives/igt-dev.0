Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1EDBF89AEB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 10:08:43 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  4 Dec 2018 11:08:14 +0100
Message-Id: <20181204100826.15522-1-maxime.ripard@bootlin.com>
In-Reply-To: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
References: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/8] chamelium: Fix inverted xr24 pattern
 paint dimensions
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

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
VGhlIHhyMjQgcGF0dGVybiBmb3IgY2hhbWVsaXVtIHRlc3RpbmcgYXBwZWFycyBtYW5nbGVkIHdo
ZW4gY2hlY2tpbmcgaXQKb24gYW4gYWN0dWFsIGRpc3BsYXkuIFRoaXMgaXMgYmVjYXVzZSB0aGUg
aG9yaXpvbnRhbCBhbmQgdmVydGljYWwKZGlzcGxheSBzaXplcyBhcmUgaW52ZXJ0ZWQgd2hlbiB1
c2VkIGFzIHdpZHRoIGFuZCBoZWlnaHQuCgpQdXQgdGhlbSBiYWNrIGluIG9yZGVyLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
PgpSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4K
LS0tCiB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggNTViMzQ2YTllMWM0Li5lZTc1ODBiNTRl
NjkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hh
bWVsaXVtLmMKQEAgLTUxOCw3ICs1MTgsNyBAQCBzdGF0aWMgaW50IGNoYW1lbGl1bV9nZXRfcGF0
dGVybl9mYihkYXRhX3QgKmRhdGEsIGRybU1vZGVNb2RlSW5mbyAqbW9kZSwKIAlwdHIgPSBpZ3Rf
ZmJfbWFwX2J1ZmZlcihmYi0+ZmQsIGZiKTsKIAlpZ3RfYXNzZXJ0KHB0cik7CiAKLQljaGFtZWxp
dW1fcGFpbnRfeHIyNF9wYXR0ZXJuKHB0ciwgbW9kZS0+dmRpc3BsYXksIG1vZGUtPmhkaXNwbGF5
KTsKKwljaGFtZWxpdW1fcGFpbnRfeHIyNF9wYXR0ZXJuKHB0ciwgbW9kZS0+aGRpc3BsYXksIG1v
ZGUtPnZkaXNwbGF5KTsKIAlpZ3RfZmJfdW5tYXBfYnVmZmVyKGZiLCBwdHIpOwogCiAJcmV0dXJu
IGZiX2lkOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
