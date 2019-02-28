Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36E26E1D1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:19 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b20so17178542edw.11
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:04 +0100
Message-Id: <20190228144910.26488-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 1/7] drm/leases: Drop object_id validation for
 negative ids
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
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90IGV4YWN0bHkgc3VyZSB3aGF0J3MgdGhlIGFpbSBoZXJlLCBidXQgdGhlIGNhbm9uaWNhbCBu
aWwgb2JqZWN0IGhhcwppZCA9PSAwLCB3ZSBkb24ndCB1c2UgbmVnYXRpdmUgb2JqZWN0IGlkcyBm
b3IgYW55dGhpbmcuIFBsdXMgYWxsCm9iamVjdF9pZCBhcmUgdmFsaWRlZCBieSB0aGUgb2JqZWN0
X2lkciwgdGhlcmUncyBub3RoaW5nIHdlIG5lZWQgdG8gZG8Kb24gdG9wIG9mIHRoYXQgRU5PRU5U
IGNoZWNrIGEgYml0IGZ1cnRoZXIgZG93bi4KClNwb3R0ZWQgd2hpbGUgdHlwaW5nIGV4aGF1c3Rp
dmUgaWd0IGNvdmVyYWdlIGZvciBhbGwgdGhlc2UKY29ybmVyLWNhc2VzLgoKQ2M6IEtlaXRoIFBh
Y2thcmQgPGtlaXRocEBrZWl0aHAuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMg
fCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMK
aW5kZXggNjAzYjBiZDljNWNlLi4xMTc2ZDgxNGNmN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbGVhc2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmMKQEAgLTQw
MywxMSArNDAzLDYgQEAgc3RhdGljIGludCBmaWxsX29iamVjdF9pZHIoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAkvKiBzdGVwIG9uZSAtIGdldCByZWZlcmVuY2VzIHRvIGFsbCB0aGUgbW9kZSBv
YmplY3RzCiAJICAgYW5kIGNoZWNrIGZvciB2YWxpZGl0eS4gKi8KIAlmb3IgKG8gPSAwOyBvIDwg
b2JqZWN0X2NvdW50OyBvKyspIHsKLQkJaWYgKChpbnQpIG9iamVjdF9pZHNbb10gPCAwKSB7Ci0J
CQlyZXQgPSAtRUlOVkFMOwotCQkJZ290byBvdXRfZnJlZV9vYmplY3RzOwotCQl9Ci0KIAkJb2Jq
ZWN0c1tvXSA9IGRybV9tb2RlX29iamVjdF9maW5kKGRldiwgbGVzc29yX3ByaXYsCiAJCQkJCQkg
IG9iamVjdF9pZHNbb10sCiAJCQkJCQkgIERSTV9NT0RFX09CSkVDVF9BTlkpOwotLSAKMi4xNC40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
