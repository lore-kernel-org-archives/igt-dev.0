Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF606E1D3
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h58so17204665edb.5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:24 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:07 +0100
Message-Id: <20190228144910.26488-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 4/7] drm/lease: Check for lessor outside of locks
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
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGxlc3NvciBpcyBpbnZhcmlhbnQgb3ZlciBhIGxpZmV0aW1lIG9mIGEgbGVhc2UsIHdlIGRv
bid0IGhhdmUgdG8KZ3JhYiBhbnkgbG9ja3MgZm9yIHRoYXQuIFNwZWVkcyB1cCB0aGUgY29tbW9u
IGNhc2Ugb2Ygbm90IGJlaW5nIGEgbGVhc2UuCgpDYzogS2VpdGggUGFja2FyZCA8a2VpdGhwQGtl
aXRocC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5j
CmluZGV4IGNjZTVkOWRkNTJmZi4uNjk0ZmYzNjNhOTBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2xlYXNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jCkBAIC0x
MTEsNyArMTExLDcgQEAgc3RhdGljIGJvb2wgX2RybV9oYXNfbGVhc2VkKHN0cnVjdCBkcm1fbWFz
dGVyICptYXN0ZXIsIGludCBpZCkKICAqLwogYm9vbCBfZHJtX2xlYXNlX2hlbGQoc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYsIGludCBpZCkKIHsKLQlpZiAoZmlsZV9wcml2ID09IE5VTEwgfHwg
ZmlsZV9wcml2LT5tYXN0ZXIgPT0gTlVMTCkKKwlpZiAoIWZpbGVfcHJpdiB8fCAhZmlsZV9wcml2
LT5tYXN0ZXIpCiAJCXJldHVybiB0cnVlOwogCiAJcmV0dXJuIF9kcm1fbGVhc2VfaGVsZF9tYXN0
ZXIoZmlsZV9wcml2LT5tYXN0ZXIsIGlkKTsKQEAgLTEzMyw3ICsxMzMsNyBAQCBib29sIGRybV9s
ZWFzZV9oZWxkKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBpbnQgaWQpCiAJc3RydWN0IGRy
bV9tYXN0ZXIgKm1hc3RlcjsKIAlib29sIHJldDsKIAotCWlmIChmaWxlX3ByaXYgPT0gTlVMTCB8
fCBmaWxlX3ByaXYtPm1hc3RlciA9PSBOVUxMKQorCWlmICghZmlsZV9wcml2IHx8ICFmaWxlX3By
aXYtPm1hc3RlciB8fCAhZmlsZV9wcml2LT5tYXN0ZXItPmxlc3NvcikKIAkJcmV0dXJuIHRydWU7
CiAKIAltYXN0ZXIgPSBmaWxlX3ByaXYtPm1hc3RlcjsKQEAgLTE1OSw3ICsxNTksNyBAQCB1aW50
MzJfdCBkcm1fbGVhc2VfZmlsdGVyX2NydGNzKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCB1
aW50MzJfdCBjcnRjc19pbikKIAlpbnQgY291bnRfaW4sIGNvdW50X291dDsKIAl1aW50MzJfdCBj
cnRjc19vdXQgPSAwOwogCi0JaWYgKGZpbGVfcHJpdiA9PSBOVUxMIHx8IGZpbGVfcHJpdi0+bWFz
dGVyID09IE5VTEwpCisJaWYgKCFmaWxlX3ByaXYgfHwgIWZpbGVfcHJpdi0+bWFzdGVyIHx8ICFm
aWxlX3ByaXYtPm1hc3Rlci0+bGVzc29yKQogCQlyZXR1cm4gY3J0Y3NfaW47CiAKIAltYXN0ZXIg
PSBmaWxlX3ByaXYtPm1hc3RlcjsKLS0gCjIuMTQuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
