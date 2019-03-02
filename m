Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CA66E399
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Mar 2019 13:09:17 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r124so341082pgr.3
 for <igt-dev@lists.freedesktop.org>; Sat, 02 Mar 2019 05:09:17 -0800 (PST)
Date: Sat, 2 Mar 2019 18:39:12 +0530
From: Mamta Shukla <mamtashukla555@gmail.com>
Message-ID: <20190302130912.GA2455@armorer>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Open DRM DEVICE with
 DRIVER_ANY
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
Cc: manasi.d.navare@intel.com, hamohammed.sa@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

T3BlbiBEUk0gREVWSUNFIHdpdGggRFJJVkVSX0FOWSBzbyB0aGF0IHRoaXMgdGVzdCBjYW4gcnVu
IGluIG90aGVyCmRyaXZlcnMgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IE1hbXRhIFNodWtsYSA8
bWFtdGFzaHVrbGE1NTVAZ21haWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYwppbmRleCA5MWRlNDY5NC4u
ZmQ4YTljYmYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19w
bGFuZS5jCkBAIC02NDEsNyArNjQxLDcgQEAgaWd0X21haW4KIAlpZ3Rfc2tpcF9vbl9zaW11bGF0
aW9uKCk7CiAKIAlpZ3RfZml4dHVyZSB7Ci0JCWRhdGEuZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVy
X21hc3RlcihEUklWRVJfSU5URUwgfCBEUklWRVJfQU1ER1BVKTsKKwkJZGF0YS5kcm1fZmQgPSBk
cm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9BTlkpOwogCiAJCWttc3Rlc3Rfc2V0X3Z0X2dy
YXBoaWNzX21vZGUoKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
