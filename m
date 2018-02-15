Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073E46E52D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 14:22:14 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 15 Feb 2018 16:22:06 +0200
Message-Id: <20180215142206.29391-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [CI] lib/igt_kms: Don't reprobe connectors during
 igt_display_init
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

Q2M6IFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogUGV0
cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFya2Fk
aXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggZWNjN2E3OTku
LjFmNzQyYmI0IDEwMDY0NAotLS0gYS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9pZ3Rfa21zLmMK
QEAgLTE5MTksNyArMTkxOSw3IEBAIHZvaWQgaWd0X2Rpc3BsYXlfaW5pdChpZ3RfZGlzcGxheV90
ICpkaXNwbGF5LCBpbnQgZHJtX2ZkKQogCQkgKiBXZSBkb24ndCBhc3NpZ24gZWFjaCBvdXRwdXQg
YSBwaXBlIHVubGVzcwogCQkgKiBhIHBpcGUgaXMgc2V0IHdpdGggaWd0X291dHB1dF9zZXRfcGlw
ZSgpLgogCQkgKi8KLQkJb3V0cHV0LT5mb3JjZV9yZXByb2JlID0gdHJ1ZTsKKwkJb3V0cHV0LT5m
b3JjZV9yZXByb2JlID0gZmFsc2U7CiAJCW91dHB1dC0+aWQgPSByZXNvdXJjZXMtPmNvbm5lY3Rv
cnNbaV07CiAJCW91dHB1dC0+ZGlzcGxheSA9IGRpc3BsYXk7CiAKLS0gCjIuMTQuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
