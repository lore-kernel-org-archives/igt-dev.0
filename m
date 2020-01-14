Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA2D6E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:25:46 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 14 Jan 2020 16:25:20 +0200
Message-Id: <20200114142523.10603-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/intel_aux_pgtable: Fix uint64_t vs.
 long mismatch
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCi4u
L2xpYi9pbnRlbF9hdXhfcGd0YWJsZS5jOiBJbiBmdW5jdGlvbiDigJhwdHJfbWFza+KAmToKLi4v
bGliL2ludGVsX2F1eF9wZ3RhYmxlLmM6MTQ6MTI6IHdhcm5pbmc6IHJpZ2h0IHNoaWZ0IGNvdW50
ID49IHdpZHRoIG9mIHR5cGUgWy1Xc2hpZnQtY291bnQtb3ZlcmZsb3ddCiAgIDE0IHwgICAgICAo
fjBVTCA+PiAoQklUU19QRVJfTE9ORyAtIDEgLSAoZSkpKSkKICAgICAgfCAgICAgICAgICAgIF5+
Ci4uL2xpYi9pbnRlbF9hdXhfcGd0YWJsZS5jOjEzODo5OiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYQklUTUFTS+KAmQogIDEzOCB8ICByZXR1cm4gQklUTUFTSyhHRlhfQUREUkVTU19C
SVRTIC0gMSwgbGQtPmVudHJ5X3B0cl9zaGlmdCk7CiAgICAgIHwgICAgICAgICBefn5+fn5+CgpT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgotLS0KIGxpYi9pbnRlbF9hdXhfcGd0YWJsZS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lu
dGVsX2F1eF9wZ3RhYmxlLmMgYi9saWIvaW50ZWxfYXV4X3BndGFibGUuYwppbmRleCBmY2QyNGYw
ODdjMTIuLmRiNTA1NWM4MjBlYyAxMDA2NDQKLS0tIGEvbGliL2ludGVsX2F1eF9wZ3RhYmxlLmMK
KysrIGIvbGliL2ludGVsX2F1eF9wZ3RhYmxlLmMKQEAgLTksOSArOSw5IEBACiAKICNpbmNsdWRl
ICJpOTE1L2dlbV9tbWFuLmgiCiAKLSNkZWZpbmUgQklUU19QRVJfTE9ORwkJKHNpemVvZihsb25n
KSAqIDgpCi0jZGVmaW5lIEJJVE1BU0soZSwgcykJCSgofjBVTCA8PCAocykpICYgXAotCQkJCSAo
fjBVTCA+PiAoQklUU19QRVJfTE9ORyAtIDEgLSAoZSkpKSkKKyNkZWZpbmUgQklUU19QRVJfTE9O
R19MT05HCShzaXplb2YobG9uZyBsb25nKSAqIDgpCisjZGVmaW5lIEJJVE1BU0soZSwgcykJCSgo
fjBVTEwgPDwgKHMpKSAmIFwKKwkJCQkgKH4wVUxMID4+IChCSVRTX1BFUl9MT05HX0xPTkcgLSAx
IC0gKGUpKSkpCiAKIC8qIFRoZSB1bml0IHNpemUgdG8gd2hpY2ggdGhlIEFVWCBDQ1Mgc3VyZmFj
ZSBpcyBhbGlnbmVkIHRvLiAqLwogI2RlZmluZSBBVVhfQ0NTX1VOSVRfU0laRQk2NAotLSAKMi4y
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
