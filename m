Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DA076E5E6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Dec 2018 14:13:40 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu,  6 Dec 2018 15:11:26 +0100
Message-Id: <20181206141132.23349-4-paul.kocialkowski@bootlin.com>
In-Reply-To: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
References: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/9] lib: drmtest: Add helpers to check and
 require the VC4 driver
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gb3JkZXIgdG8gYWRkIHN1cHBvcnQgZm9yIGZlYXR1cmVzIHNwZWNpZmljIHRvIHRoZSBWQzQg
ZHJpdmVyLCBhZGQKaGVscGVycyBmb3IgY2hlY2tpbmcgYW5kIHJlcXVpcmluZyB0aGUgZHJpdmVy
IGxpa2UgaXQncyBkb25lIGZvciB0aGUKaTkxNSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQogbGliL2Ry
bXRlc3QuYyB8IDEwICsrKysrKysrKysKIGxpYi9kcm10ZXN0LmggfCAgMiArKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuYyBiL2xp
Yi9kcm10ZXN0LmMKaW5kZXggZDJhYTFjMTkuLjUzZWE3NTk4IDEwMDY0NAotLS0gYS9saWIvZHJt
dGVzdC5jCisrKyBiL2xpYi9kcm10ZXN0LmMKQEAgLTEwNSw2ICsxMDUsMTEgQEAgYm9vbCBpc19p
OTE1X2RldmljZShpbnQgZmQpCiAJcmV0dXJuIF9faXNfZGV2aWNlKGZkLCAiaTkxNSIpOwogfQog
Citib29sIGlzX3ZjNF9kZXZpY2UoaW50IGZkKQoreworCXJldHVybiBfX2lzX2RldmljZShmZCwg
InZjNCIpOworfQorCiBzdGF0aWMgYm9vbCBoYXNfa25vd25faW50ZWxfY2hpcHNldChpbnQgZmQp
CiB7CiAJc3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwpAQCAtNDQ0LDMgKzQ0OSw4IEBAIHZv
aWQgaWd0X3JlcXVpcmVfaW50ZWwoaW50IGZkKQogewogCWlndF9yZXF1aXJlKGlzX2k5MTVfZGV2
aWNlKGZkKSAmJiBoYXNfa25vd25faW50ZWxfY2hpcHNldChmZCkpOwogfQorCit2b2lkIGlndF9y
ZXF1aXJlX3ZjNChpbnQgZmQpCit7CisJaWd0X3JlcXVpcmUoaXNfdmM0X2RldmljZShmZCkpOwor
fQpkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuaCBiL2xpYi9kcm10ZXN0LmgKaW5kZXggOTZlZTUx
N2UuLjFkMTFiZmY5IDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5oCisrKyBiL2xpYi9kcm10ZXN0
LmgKQEAgLTc4LDggKzc4LDEwIEBAIGludCBfX2RybV9vcGVuX2RyaXZlcihpbnQgY2hpcHNldCk7
CiB2b2lkIGdlbV9xdWllc2NlbnRfZ3B1KGludCBmZCk7CiAKIHZvaWQgaWd0X3JlcXVpcmVfaW50
ZWwoaW50IGZkKTsKK3ZvaWQgaWd0X3JlcXVpcmVfdmM0KGludCBmZCk7CiAKIGJvb2wgaXNfaTkx
NV9kZXZpY2UoaW50IGZkKTsKK2Jvb2wgaXNfdmM0X2RldmljZShpbnQgZmQpOwogCiAvKioKICAq
IGRvX29yX2RpZToKLS0gCjIuMTkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
