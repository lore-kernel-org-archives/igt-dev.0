Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B36E6EED9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Dec 2018 15:55:54 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 13 Dec 2018 16:55:25 +0100
Message-Id: <20181213155533.18048-5-paul.kocialkowski@bootlin.com>
In-Reply-To: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 04/12] lib: drmtest: Add helpers to check
 and require the VC4 driver
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gb3JkZXIgdG8gYWRkIHN1cHBvcnQgZm9yIGZlYXR1cmVzIHNwZWNpZmljIHRvIHRoZSBWQzQg
ZHJpdmVyLCBhZGQKaGVscGVycyBmb3IgY2hlY2tpbmcgYW5kIHJlcXVpcmluZyB0aGUgZHJpdmVy
IGxpa2UgaXQncyBkb25lIGZvciB0aGUKaTkxNSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClJldmlld2VkLWJ5
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGxpYi9kcm10ZXN0LmMgfCAxMCAr
KysrKysrKysrCiBsaWIvZHJtdGVzdC5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCmlu
ZGV4IGQyYWExYzE5MTU0Zi4uNTNlYTc1OTgwZjJhIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5j
CisrKyBiL2xpYi9kcm10ZXN0LmMKQEAgLTEwNSw2ICsxMDUsMTEgQEAgYm9vbCBpc19pOTE1X2Rl
dmljZShpbnQgZmQpCiAJcmV0dXJuIF9faXNfZGV2aWNlKGZkLCAiaTkxNSIpOwogfQogCitib29s
IGlzX3ZjNF9kZXZpY2UoaW50IGZkKQoreworCXJldHVybiBfX2lzX2RldmljZShmZCwgInZjNCIp
OworfQorCiBzdGF0aWMgYm9vbCBoYXNfa25vd25faW50ZWxfY2hpcHNldChpbnQgZmQpCiB7CiAJ
c3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwpAQCAtNDQ0LDMgKzQ0OSw4IEBAIHZvaWQgaWd0
X3JlcXVpcmVfaW50ZWwoaW50IGZkKQogewogCWlndF9yZXF1aXJlKGlzX2k5MTVfZGV2aWNlKGZk
KSAmJiBoYXNfa25vd25faW50ZWxfY2hpcHNldChmZCkpOwogfQorCit2b2lkIGlndF9yZXF1aXJl
X3ZjNChpbnQgZmQpCit7CisJaWd0X3JlcXVpcmUoaXNfdmM0X2RldmljZShmZCkpOworfQpkaWZm
IC0tZ2l0IGEvbGliL2RybXRlc3QuaCBiL2xpYi9kcm10ZXN0LmgKaW5kZXggOTZlZTUxN2UyZWMx
Li4xZDExYmZmOTM2MWMgMTAwNjQ0Ci0tLSBhL2xpYi9kcm10ZXN0LmgKKysrIGIvbGliL2RybXRl
c3QuaApAQCAtNzgsOCArNzgsMTAgQEAgaW50IF9fZHJtX29wZW5fZHJpdmVyKGludCBjaGlwc2V0
KTsKIHZvaWQgZ2VtX3F1aWVzY2VudF9ncHUoaW50IGZkKTsKIAogdm9pZCBpZ3RfcmVxdWlyZV9p
bnRlbChpbnQgZmQpOwordm9pZCBpZ3RfcmVxdWlyZV92YzQoaW50IGZkKTsKIAogYm9vbCBpc19p
OTE1X2RldmljZShpbnQgZmQpOworYm9vbCBpc192YzRfZGV2aWNlKGludCBmZCk7CiAKIC8qKgog
ICogZG9fb3JfZGllOgotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
