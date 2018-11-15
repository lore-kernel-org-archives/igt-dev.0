Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id EFF9C6E10D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Nov 2018 16:52:33 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 15 Nov 2018 17:51:39 +0100
Message-Id: <20181115165140.21947-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] chamelium: Fix inverted xr24 pattern
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHhyMjQgcGF0dGVybiBmb3IgY2hhbWVsaXVtIHRlc3RpbmcgYXBwZWFycyBtYW5nbGVkIHdo
ZW4gY2hlY2tpbmcgaXQKb24gYW4gYWN0dWFsIGRpc3BsYXkuIFRoaXMgaXMgYmVjYXVzZSB0aGUg
aG9yaXpvbnRhbCBhbmQgdmVydGljYWwKZGlzcGxheSBzaXplcyBhcmUgaW52ZXJ0ZWQgd2hlbiB1
c2VkIGFzIHdpZHRoIGFuZCBoZWlnaHQuCgpQdXQgdGhlbSBiYWNrIGluIG9yZGVyLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
PgotLS0KIHRlc3RzL2ttc19jaGFtZWxpdW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jaGFtZWxp
dW0uYyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwppbmRleCBlMGUzZTNmMS4uNGYxOTc3YzMgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMKQEAgLTUxNiw3ICs1MTYsNyBAQCBzdGF0aWMgaW50IGNoYW1lbGl1bV9nZXRfcGF0dGVybl9m
YihkYXRhX3QgKmRhdGEsIGRybU1vZGVNb2RlSW5mbyAqbW9kZSwKIAlwdHIgPSBpZ3RfZmJfbWFw
X2J1ZmZlcihmYi0+ZmQsIGZiKTsKIAlpZ3RfYXNzZXJ0KHB0cik7CiAKLQljaGFtZWxpdW1fcGFp
bnRfeHIyNF9wYXR0ZXJuKHB0ciwgbW9kZS0+dmRpc3BsYXksIG1vZGUtPmhkaXNwbGF5KTsKKwlj
aGFtZWxpdW1fcGFpbnRfeHIyNF9wYXR0ZXJuKHB0ciwgbW9kZS0+aGRpc3BsYXksIG1vZGUtPnZk
aXNwbGF5KTsKIAlpZ3RfZmJfdW5tYXBfYnVmZmVyKGZiLCBwdHIpOwogCiAJcmV0dXJuIGZiX2lk
OwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
