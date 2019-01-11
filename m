Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 259D06F59C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:30 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:21 +0100
Message-Id: <20190111090532.19235-11-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 10/21] lib/igt_vc4: Add helper for
 checking T-tiling support on plane
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
IGEgcGxhbmUKc3VwcG9ydHMgVC10aWxpbmcgZm9yIGEgZ2l2ZW4gZm9ybWF0LgoKU2lnbmVkLW9m
Zi1ieTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgot
LS0KIGxpYi9pZ3RfdmM0LmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfdmM0LmggYi9saWIvaWd0X3ZjNC5oCmluZGV4
IGQ1YzUyOWJiY2NkYS4uZWU3YWY3MzdhZGU5IDEwMDY0NAotLS0gYS9saWIvaWd0X3ZjNC5oCisr
KyBiL2xpYi9pZ3RfdmM0LmgKQEAgLTI0LDYgKzI0LDE1IEBACiAjaWZuZGVmIElHVF9WQzRfSAog
I2RlZmluZSBJR1RfVkM0X0gKIAorI2luY2x1ZGUgImlndF9rbXMuaCIKKworc3RhdGljIGlubGlu
ZSBib29sIGlndF92YzRfcGxhbmVfc3VwcG9ydHNfdF90aWxpbmcoaWd0X3BsYW5lX3QgKnBsYW5l
LAorCQkJCQkJICAgdWludDMyX3QgZm9ybWF0KQoreworCXJldHVybiBpZ3RfcGxhbmVfaGFzX2Zv
cm1hdF9tb2QocGxhbmUsIGZvcm1hdCwKKwkJCQkJRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fVkM0
X1RfVElMRUQpOworfQorCiB1aW50MzJfdCBpZ3RfdmM0X2dldF9jbGVhcmVkX2JvKGludCBmZCwg
c2l6ZV90IHNpemUsIHVpbnQzMl90IGNsZWFydmFsKTsKIGludCBpZ3RfdmM0X2NyZWF0ZV9ibyhp
bnQgZmQsIHNpemVfdCBzaXplKTsKIHZvaWQgKmlndF92YzRfbW1hcF9ibyhpbnQgZmQsIHVpbnQz
Ml90IGhhbmRsZSwgdWludDMyX3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCk7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
