Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E786E7B6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Sep 2018 13:38:20 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id u24-v6so5987808pfn.13
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Sep 2018 06:38:20 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 21 Sep 2018 16:38:01 +0300
Message-Id: <1537537081-5835-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Avoid using plane sizes
 which exceed hw capability
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

TWF4IHNwcml0ZSBwbGFuZSB3aWR0aCBhdCAyMDAwIHRvIGF2b2lkIGdvaW5nIG92ZXIgaHcgd2F0
ZXJtYXJrCmxpbWl0cy4KCmJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDU0NTgKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY2NzLmMgfCA2ICsr
KystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfY2NzLmMgYi90ZXN0cy9rbXNfY2NzLmMKaW5kZXggZTFlZTU4
OC4uZjYzMDAyOSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Njcy5jCisrKyBiL3Rlc3RzL2ttc19j
Y3MuYwpAQCAtNjgsNiArNjgsOCBAQCB0eXBlZGVmIHN0cnVjdCB7CiAjZGVmaW5lIENDU19VTkNP
TVBSRVNTRUQJMHgwCiAjZGVmaW5lIENDU19DT01QUkVTU0VECQkweDU1CiAKKyNkZWZpbmUgTUFY
X1NQUklURV9QTEFORV9XSURUSCAyMDAwCisKIHN0cnVjdCBsb2NhbF9kcm1fZm9ybWF0X21vZGlm
aWVyIHsKICAgICAgICAvKiBCaXRtYXNrIG9mIGZvcm1hdHMgaW4gZ2V0X3BsYW5lIGZvcm1hdCBs
aXN0IHRoaXMgaW5mbyBhcHBsaWVzIHRvLiBUaGUKIAkqIG9mZnNldCBhbGxvd3MgYSBzbGlkaW5n
IHdpbmRvdyBvZiB3aGljaCA2NCBmb3JtYXRzIChiaXRzKS4KQEAgLTQwOCwxMiArNDEwLDEyIEBA
IHN0YXRpYyBib29sIHRyeV9jb25maWcoZGF0YV90ICpkYXRhLCBlbnVtIHRlc3RfZmJfZmxhZ3Mg
ZmJfZmxhZ3MsCiAJaWYgKGRhdGEtPnBsYW5lICYmIGZiX2ZsYWdzICYgRkJfQ09NUFJFU1NFRCkg
ewogCQlpZiAoIXBsYW5lX2hhc19mb3JtYXRfd2l0aF9jY3MoZGF0YSwgZGF0YS0+cGxhbmUsIERS
TV9GT1JNQVRfWFJHQjg4ODgpKQogCQkJcmV0dXJuIGZhbHNlOwotCQlnZW5lcmF0ZV9mYihkYXRh
LCAmZmIsIGRybV9tb2RlLT5oZGlzcGxheSwKKwkJZ2VuZXJhdGVfZmIoZGF0YSwgJmZiLCBtaW4o
TUFYX1NQUklURV9QTEFORV9XSURUSCwgZHJtX21vZGUtPmhkaXNwbGF5KSwKIAkJCSAgICBkcm1f
bW9kZS0+dmRpc3BsYXksCiAJCQkgICAgKGZiX2ZsYWdzICYgfkZCX0NPTVBSRVNTRUQpIHwgRkJf
SEFTX1BMQU5FKTsKIAkJZ2VuZXJhdGVfZmIoZGF0YSwgJmZiX3Nwcml0ZSwgMjU2LCAyNTYsIGZi
X2ZsYWdzKTsKIAl9IGVsc2UgewotCQlnZW5lcmF0ZV9mYihkYXRhLCAmZmIsIGRybV9tb2RlLT5o
ZGlzcGxheSwKKwkJZ2VuZXJhdGVfZmIoZGF0YSwgJmZiLCBtaW4oTUFYX1NQUklURV9QTEFORV9X
SURUSCwgZHJtX21vZGUtPmhkaXNwbGF5KSwKIAkJCSAgICBkcm1fbW9kZS0+dmRpc3BsYXksIGZi
X2ZsYWdzKTsKIAl9CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
