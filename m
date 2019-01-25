Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37B4A6E5FA
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 14:07:33 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 25 Jan 2019 15:06:03 +0100
Message-Id: <20190125140623.10801-2-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 01/21] lib: drmtest: Add helpers to check
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>
List-ID: <igt-dev@lists.freedesktop.org>

SW4gb3JkZXIgdG8gYWRkIHN1cHBvcnQgZm9yIGZlYXR1cmVzIHNwZWNpZmljIHRvIHRoZSBWQzQg
ZHJpdmVyLCBhZGQKaGVscGVycyBmb3IgY2hlY2tpbmcgYW5kIHJlcXVpcmluZyB0aGUgZHJpdmVy
IGxpa2UgaXQncyBkb25lIGZvciB0aGUKaTkxNSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClJldmlld2VkLWJ5
OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBsaWIvZHJtdGVzdC5jIHwgMTAgKysr
KysrKysrKwogbGliL2RybXRlc3QuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5jIGIvbGliL2RybXRlc3QuYwppbmRl
eCAxOTY0Nzk1YTZhYjIuLjI1ZGYxMWNlMWUzMiAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuYwor
KysgYi9saWIvZHJtdGVzdC5jCkBAIC0xMDUsNiArMTA1LDExIEBAIGJvb2wgaXNfaTkxNV9kZXZp
Y2UoaW50IGZkKQogCXJldHVybiBfX2lzX2RldmljZShmZCwgImk5MTUiKTsKIH0KIAorYm9vbCBp
c192YzRfZGV2aWNlKGludCBmZCkKK3sKKwlyZXR1cm4gX19pc19kZXZpY2UoZmQsICJ2YzQiKTsK
K30KKwogc3RhdGljIGJvb2wgaGFzX2tub3duX2ludGVsX2NoaXBzZXQoaW50IGZkKQogewogCXN0
cnVjdCBkcm1faTkxNV9nZXRwYXJhbSBncDsKQEAgLTQ4MiwzICs0ODcsOCBAQCB2b2lkIGlndF9y
ZXF1aXJlX2ludGVsKGludCBmZCkKIHsKIAlpZ3RfcmVxdWlyZShpc19pOTE1X2RldmljZShmZCkg
JiYgaGFzX2tub3duX2ludGVsX2NoaXBzZXQoZmQpKTsKIH0KKwordm9pZCBpZ3RfcmVxdWlyZV92
YzQoaW50IGZkKQoreworCWlndF9yZXF1aXJlKGlzX3ZjNF9kZXZpY2UoZmQpKTsKK30KZGlmZiAt
LWdpdCBhL2xpYi9kcm10ZXN0LmggYi9saWIvZHJtdGVzdC5oCmluZGV4IDg3NDNiMWJiMWVkMy4u
Y2EzNDdhNzEyMGRiIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5oCisrKyBiL2xpYi9kcm10ZXN0
LmgKQEAgLTgwLDggKzgwLDEwIEBAIGludCBfX2RybV9vcGVuX2RyaXZlcihpbnQgY2hpcHNldCk7
CiB2b2lkIGdlbV9xdWllc2NlbnRfZ3B1KGludCBmZCk7CiAKIHZvaWQgaWd0X3JlcXVpcmVfaW50
ZWwoaW50IGZkKTsKK3ZvaWQgaWd0X3JlcXVpcmVfdmM0KGludCBmZCk7CiAKIGJvb2wgaXNfaTkx
NV9kZXZpY2UoaW50IGZkKTsKK2Jvb2wgaXNfdmM0X2RldmljZShpbnQgZmQpOwogCiAvKioKICAq
IGRvX29yX2RpZToKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
