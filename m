Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 885456F59C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:30 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:23 +0100
Message-Id: <20190111090532.19235-13-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 12/21] lib/igt_vc4: Add helper for
 checking SAND tiling support on plane
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

VGhpcyBpbnRyb2R1Y2VzIGEgY29udmVuaWVuY2UgaGVscGVyIGZvciBjaGVja2luZyB3aGV0aGVy
IGEgcGxhbmUKc3VwcG9ydHMgU0FORCB0aWxpbmcgZm9yIGEgZ2l2ZW4gZm9ybWF0LgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29t
PgotLS0KIGxpYi9pZ3RfdmM0LmggfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF92YzQuaCBi
L2xpYi9pZ3RfdmM0LmgKaW5kZXggOTExOGFlMTkzZjYwLi5jYjk4MDU0MWE2MWYgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3RfdmM0LmgKKysrIGIvbGliL2lndF92YzQuaApAQCAtMzMsNiArMzMsMzAgQEAg
c3RhdGljIGlubGluZSBib29sIGlndF92YzRfcGxhbmVfc3VwcG9ydHNfdF90aWxpbmcoaWd0X3Bs
YW5lX3QgKnBsYW5lLAogCQkJCQlEUk1fRk9STUFUX01PRF9CUk9BRENPTV9WQzRfVF9USUxFRCk7
CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBpZ3RfdmM0X3BsYW5lX3N1cHBvcnRzX3NhbmRfdGls
aW5nKGlndF9wbGFuZV90ICpwbGFuZSwKKwkJCQkJCSAgICAgIHVpbnQzMl90IGZvcm1hdCwKKwkJ
CQkJCSAgICAgIHNpemVfdCBjb2x1bW5fd2lkdGhfYnl0ZXMpCit7CisJdWludDY0X3QgbW9kaWZp
ZXI7CisKKwlzd2l0Y2ggKGNvbHVtbl93aWR0aF9ieXRlcykgeworCWNhc2UgMzI6CisJCW1vZGlm
aWVyID0gRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fU0FORDMyOworCQlicmVhazsKKwljYXNlIDY0
OgorCQltb2RpZmllciA9IERSTV9GT1JNQVRfTU9EX0JST0FEQ09NX1NBTkQ2NDsKKwkJYnJlYWs7
CisJY2FzZSAxMjg6CisJCW1vZGlmaWVyID0gRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fU0FORDEy
ODsKKwkJYnJlYWs7CisJY2FzZSAyNTY6CisJCW1vZGlmaWVyID0gRFJNX0ZPUk1BVF9NT0RfQlJP
QURDT01fU0FORDI1NjsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIGlndF9wbGFuZV9oYXNfZm9y
bWF0X21vZChwbGFuZSwgZm9ybWF0LCBtb2RpZmllcik7Cit9CisKIHVpbnQzMl90IGlndF92YzRf
Z2V0X2NsZWFyZWRfYm8oaW50IGZkLCBzaXplX3Qgc2l6ZSwgdWludDMyX3QgY2xlYXJ2YWwpOwog
aW50IGlndF92YzRfY3JlYXRlX2JvKGludCBmZCwgc2l6ZV90IHNpemUpOwogdm9pZCAqaWd0X3Zj
NF9tbWFwX2JvKGludCBmZCwgdWludDMyX3QgaGFuZGxlLCB1aW50MzJfdCBzaXplLCB1bnNpZ25l
ZCBwcm90KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
