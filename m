Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254A26E202
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 15:17:12 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Mon,  1 Apr 2019 18:17:07 +0300
Message-Id: <20190401151707.4576-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Fix crop test
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNl
dCB0aGUgc3JjL2RzdCB2aWV3cG9ydHMgY29ycmVjdGx5IHdoZW4gdHJ5aW5nIHRvIGNyb3Agb2Zm
IHRoZQplZGdlcy4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMTAyOTYKRml4ZXM6IDgwZWI2MTQ1OTc5MSAoInRlc3RzL2ttc19wbGFuZTog
UmVtb3ZlIHRoZSB1cHNjYWxpbmcgcmVxdWlyZW1lbnQiKQpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19w
bGFuZS5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5l
LmMKaW5kZXggMzNlMjkwNWE4ZDcxLi40NzFiY2JlYjhmNzcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2tt
c19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19wbGFuZS5jCkBAIC00MzYsOCArNDM2LDExIEBAIHN0
YXRpYyB2b2lkIHRlc3RfZm9ybWF0X3BsYW5lX2NvbG9yKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBl
IHBpcGUsCiAJLyoKIAkgKiBpZiBjbGFtcGluZyB0ZXN0LiBEUk1fRk9STUFUX1hSR0I4ODg4IGlz
IHVzZWQgZm9yIHJlZmVyZW5jZSBjb2xvci4KIAkgKi8KLQlpZiAoZGF0YS0+Y3JvcCAhPSAwICYm
IGZvcm1hdCAhPSBEUk1fRk9STUFUX1hSR0I4ODg4KQorCWlmIChkYXRhLT5jcm9wICE9IDAgJiYg
Zm9ybWF0ICE9IERSTV9GT1JNQVRfWFJHQjg4ODgpIHsKIAkJaWd0X2ZiX3NldF9wb3NpdGlvbihm
YiwgcGxhbmUsIGRhdGEtPmNyb3AsIGRhdGEtPmNyb3ApOworCQlpZ3RfZmJfc2V0X3NpemUoZmIs
IHBsYW5lLCB3aWR0aCwgaGVpZ2h0KTsKKwkJaWd0X3BsYW5lX3NldF9zaXplKHBsYW5lLCB3aWR0
aCwgaGVpZ2h0KTsKKwl9CiAKIAlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBk
YXRhLT5kaXNwbGF5LmlzX2F0b21pYyA/IENPTU1JVF9BVE9NSUMgOiBDT01NSVRfVU5JVkVSU0FM
KTsKIAlpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoZGF0YS0+ZGlzcGxheS5kcm1fZmQsIGRhdGEt
PnBpcGVfY3JjLCBjcmMpOwotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
