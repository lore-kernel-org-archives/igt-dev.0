Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23EA6E5D9
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 20:54:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id n19-v6so2805379edq.11
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Nov 2018 13:54:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri,  2 Nov 2018 21:53:45 +0100
Message-Id: <20181102205350.29021-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
References: <20181102205350.29021-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t 3/8] tests/kms_lease: use interactive debug
 helpers
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

TXVjaCBmYXN0ZXIsIHNpbmNlIHdoZW4gbm90IGVuYWJsZWQgdGhleSBwcm9jZWVkIHJpZ2h0IGF3
YXkuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgotLS0KIHRlc3RzL2ttc19sZWFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2xlYXNlLmMgYi90
ZXN0cy9rbXNfbGVhc2UuYwppbmRleCA1YjFiMDUyNDI4NmUuLjA0OGU1MjAzZDJhNSAxMDA2NDQK
LS0tIGEvdGVzdHMva21zX2xlYXNlLmMKKysrIGIvdGVzdHMva21zX2xlYXNlLmMKQEAgLTI5OSw3
ICsyOTksNyBAQCBzdGF0aWMgdm9pZCBzaW1wbGVfbGVhc2UoZGF0YV90ICpkYXRhKQogCS8qIFBh
aW50IHNvbWV0aGluZyBhdHRyYWN0aXZlICovCiAJcGFpbnRfZmIobGVhc2UuZmQsICZsZWFzZS5w
cmltYXJ5X2ZiLCAic2ltcGxlX2xlYXNlIiwKIAkJIGxlYXNlLm1vZGUtPm5hbWUsIGlndF9vdXRw
dXRfbmFtZShsZWFzZS5vdXRwdXQpLCBrbXN0ZXN0X3BpcGVfbmFtZShkYXRhLT5waXBlKSk7Ci0J
c2xlZXAoMyk7CisJaWd0X2RlYnVnX3dhaXRfZm9yX2tleXByZXNzKCJsZWFzZSIpOwogCWNsZWFu
dXBfY3J0YygmbGVhc2UsCiAJCSAgICAgY29ubmVjdG9yX2lkX3RvX291dHB1dCgmbGVhc2UuZGlz
cGxheSwgZGF0YS0+Y29ubmVjdG9yX2lkKSk7CiAKLS0gCjIuMTQuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
