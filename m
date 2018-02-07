Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BDA36E545
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 09:09:30 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Wed,  7 Feb 2018 10:09:08 +0100
Message-Id: <20180207090910.10775-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180207090910.10775-1-boris.brezillon@bootlin.com>
References: <20180207090910.10775-1-boris.brezillon@bootlin.com>
Subject: [igt-dev] [PATCH v3 1/3] igt/vc4: Add a helper function to mark BOs
 purgeable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Eric Anholt <eric@anholt.net>, igt-dev@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29t
PgoKdjI6IFJlYmFzZSBvbiBnZXQvc2V0X3RpbGluZyBoZWxwZXJzIChieSBhbmhvbHQpLgoKU2ln
bmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJv
bnMuY29tPgpTaWduZWQtb2ZmLWJ5OiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpSZXZp
ZXdlZC1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KLS0tCiBsaWIvaWd0X3ZjNC5j
IHwgMTIgKysrKysrKysrKysrCiBsaWIvaWd0X3ZjNC5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF92YzQuYyBiL2xpYi9pZ3Rf
dmM0LmMKaW5kZXggNTM0N2FmOGRmNDAwLi4yMzhiZjI2YmQ2YmIgMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfdmM0LmMKKysrIGIvbGliL2lndF92YzQuYwpAQCAtMTQ5LDMgKzE0OSwxNSBAQCB1aW50NjRf
dCBpZ3RfdmM0X2dldF90aWxpbmcoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUpCiAKIAlyZXR1cm4g
Z2V0Lm1vZGlmaWVyOwogfQorCitib29sIGlndF92YzRfcHVyZ2VhYmxlX2JvKGludCBmZCwgaW50
IGhhbmRsZSwgYm9vbCBwdXJnZWFibGUpCit7CisJc3RydWN0IGRybV92YzRfZ2VtX21hZHZpc2Ug
YXJnID0geworCQkuaGFuZGxlID0gaGFuZGxlLAorCQkubWFkdiA9IHB1cmdlYWJsZSA/IFZDNF9N
QURWX0RPTlRORUVEIDogVkM0X01BRFZfV0lMTE5FRUQsCisJfTsKKworCWRvX2lvY3RsKGZkLCBE
Uk1fSU9DVExfVkM0X0dFTV9NQURWSVNFLCAmYXJnKTsKKworCXJldHVybiBhcmcucmV0YWluZWQ7
Cit9CmRpZmYgLS1naXQgYS9saWIvaWd0X3ZjNC5oIGIvbGliL2lndF92YzQuaAppbmRleCBkMTc0
MGI5M2YxZmMuLjJjMDE2YjE2ZGViZCAxMDA2NDQKLS0tIGEvbGliL2lndF92YzQuaAorKysgYi9s
aWIvaWd0X3ZjNC5oCkBAIC0yNyw2ICsyNyw3IEBACiB1aW50MzJfdCBpZ3RfdmM0X2dldF9jbGVh
cmVkX2JvKGludCBmZCwgc2l6ZV90IHNpemUsIHVpbnQzMl90IGNsZWFydmFsKTsKIGludCBpZ3Rf
dmM0X2NyZWF0ZV9ibyhpbnQgZmQsIHNpemVfdCBzaXplKTsKIHZvaWQgKmlndF92YzRfbW1hcF9i
byhpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdWludDMyX3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCk7
Citib29sIGlndF92YzRfcHVyZ2VhYmxlX2JvKGludCBmZCwgaW50IGhhbmRsZSwgYm9vbCBwdXJn
ZWFibGUpOwogCiB2b2lkIGlndF92YzRfc2V0X3RpbGluZyhpbnQgZmQsIHVpbnQzMl90IGhhbmRs
ZSwgdWludDY0X3QgbW9kaWZpZXIpOwogdWludDY0X3QgaWd0X3ZjNF9nZXRfdGlsaW5nKGludCBm
ZCwgdWludDMyX3QgaGFuZGxlKTsKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
