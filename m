Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482289174
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 16:25:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b20so20326406edw.11
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 08:25:39 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Feb 2019 17:25:22 +0100
Message-Id: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t 1/9] tests/kms_lease: Add invalid planes
 tests
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGVzdCBnYXAgYmVjYXVzZSB3ZSdyZSB1c2luZyB1bml2ZXJzYWwgcGxhbmVzIGJ5IGRlZmF1bHQu
IEZpeCB0aGF0LgoKQ2M6IEtlaXRoIFBhY2thcmQgPGtlaXRocEBrZWl0aHAuY29tPgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIHRlc3Rz
L2ttc19sZWFzZS5jIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19sZWFzZS5jIGIvdGVzdHMva21zX2xl
YXNlLmMKaW5kZXggY2NhNDI0NTk4ZWE3Li43MGE5NjM2MmQ3N2EgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2ttc19sZWFzZS5jCisrKyBiL3Rlc3RzL2ttc19sZWFzZS5jCkBAIC01NzMsNiArNTczLDIwIEBA
IHN0YXRpYyB2b2lkIGxlYXNlX2ludmFsaWRfY3J0YyhkYXRhX3QgKmRhdGEpCiAJaWd0X2Fzc2Vy
dF9lcShyZXQsIC1FSU5WQUwpOwogfQogCitzdGF0aWMgdm9pZCBsZWFzZV9pbnZhbGlkX3BsYW5l
KGRhdGFfdCAqZGF0YSkKK3sKKwlsZWFzZV90IGxlYXNlOworCXVpbnQzMl90IHNhdmVfcGxhbmVf
aWQ7CisJaW50IHJldDsKKworCS8qIENyZWF0ZSBhbiBpbnZhbGlkIGxlYXNlICovCisJc2F2ZV9w
bGFuZV9pZCA9IGRhdGEtPnBsYW5lX2lkOworCWRhdGEtPnBsYW5lX2lkID0gMHhiYWFkZjAwZDsK
KwlyZXQgPSBtYWtlX2xlYXNlKGRhdGEsICZsZWFzZSk7CisJZGF0YS0+cGxhbmVfaWQgPSBzYXZl
X3BsYW5lX2lkOworCWlndF9hc3NlcnRfZXEocmV0LCAtRUlOVkFMKTsKK30KKwogCiBzdGF0aWMg
dm9pZCBydW5fdGVzdChkYXRhX3QgKmRhdGEsIHZvaWQgKCp0ZXN0ZnVuYykoZGF0YV90ICopKQog
ewpAQCAtNjI1LDYgKzYzOSw3IEBAIGlndF9tYWluCiAJCXsgImxlYXNlX2FnYWluIiwgbGVhc2Vf
YWdhaW4gfSwKIAkJeyAibGVhc2VfaW52YWxpZF9jb25uZWN0b3IiLCBsZWFzZV9pbnZhbGlkX2Nv
bm5lY3RvciB9LAogCQl7ICJsZWFzZV9pbnZhbGlkX2NydGMiLCBsZWFzZV9pbnZhbGlkX2NydGMg
fSwKKwkJeyAibGVhc2VfaW52YWxpZF9wbGFuZSIsIGxlYXNlX2ludmFsaWRfcGxhbmUgfSwKIAkJ
eyB9CiAJfSwgKmY7CiAKLS0gCjIuMTQuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
