Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B622589B7B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Nov 2018 11:05:32 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 19 Nov 2018 12:05:27 +0100
Message-Id: <20181119110528.12877-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Fix -Werror=missing-braces
 compilation on clang.
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
List-ID: <igt-dev@lists.freedesktop.org>

Q2xhbmcgZmFpbHMgdG8gY29tcGlsZSB3aXRoOgplcnJvcjogc3VnZ2VzdCBicmFjZXMgYXJvdW5k
IGluaXRpYWxpemF0aW9uIG9mIHN1Ym9iamVjdCBbLVdlcnJvciwtV21pc3NpbmctYnJhY2VzXQoK
TWFrZSB0aGUgaW5pdGlhbGl6ZXIgZW1wdHkgdG8gZml4IHRoaXMgaXNzdWUuCgpTaWduZWQtb2Zm
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgotLS0KIGxpYi9pZ3RfZmIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0
X2ZiLmMKaW5kZXggMDFlZmQyNjk3MTRiLi4yNDYyZDZiYTZmYWIgMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTE5OTUsNyArMTk5NSw3IEBAIHN0YXRpYyB2
b2lkIGRlc3Ryb3lfY2Fpcm9fc3VyZmFjZV9fY29udmVydCh2b2lkICphcmcpCiBzdGF0aWMgdm9p
ZCBjcmVhdGVfY2Fpcm9fc3VyZmFjZV9fY29udmVydChpbnQgZmQsIHN0cnVjdCBpZ3RfZmIgKmZi
KQogewogCXN0cnVjdCBmYl9jb252ZXJ0X2JsaXRfdXBsb2FkICpibGl0ID0gbWFsbG9jKHNpemVv
ZigqYmxpdCkpOwotCXN0cnVjdCBmYl9jb252ZXJ0IGN2dCA9IHsgMCB9OworCXN0cnVjdCBmYl9j
b252ZXJ0IGN2dCA9IHsgfTsKIAogCWlndF9hc3NlcnQoYmxpdCk7CiAKQEAgLTIxODgsNyArMjE4
OCw3IEBAIHZvaWQgaWd0X3JlbW92ZV9mYihpbnQgZmQsIHN0cnVjdCBpZ3RfZmIgKmZiKQogdW5z
aWduZWQgaW50IGlndF9mYl9jb252ZXJ0KHN0cnVjdCBpZ3RfZmIgKmRzdCwgc3RydWN0IGlndF9m
YiAqc3JjLAogCQkJICAgIHVpbnQzMl90IGRzdF9mb3VyY2MpCiB7Ci0Jc3RydWN0IGZiX2NvbnZl
cnQgY3Z0ID0geyAwIH07CisJc3RydWN0IGZiX2NvbnZlcnQgY3Z0ID0geyB9OwogCXZvaWQgKmRz
dF9wdHIsICpzcmNfcHRyOwogCWludCBmYl9pZDsKIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
