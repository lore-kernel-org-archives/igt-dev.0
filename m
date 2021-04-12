Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834D96E50B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 10:32:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 12 Apr 2021 12:31:09 +0200
Message-Id: <20210412103147.61299-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412103147.61299-1-zbigniew.kempczynski@intel.com>
References: <20210412103147.61299-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v31 02/40] lib/igt_list: Add
 igt_list_for_each_entry_safe_reverse
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

RnJvbTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgoK
QWRkZWQgc2FmZSB2ZXJzaW9uIG9mIHJldmVyc2VkIGl0ZXJhdGlvbiBvdmVyIGlndF9saXN0LgoK
U2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50
ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBp
bnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0t
CiBsaWIvaWd0X2xpc3QuaCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9saXN0LmggYi9saWIvaWd0X2xpc3QuaAppbmRleCBj
YzkzZDdhMGQuLmJlNjNmZDgwNiAxMDA2NDQKLS0tIGEvbGliL2lndF9saXN0LmgKKysrIGIvbGli
L2lndF9saXN0LmgKQEAgLTEwOCw2ICsxMDgsMTIgQEAgYm9vbCBpZ3RfbGlzdF9lbXB0eShjb25z
dCBzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqaGVhZCk7CiAJICAgICAmcG9zLT5tZW1iZXIgIT0gKGhl
YWQpOwkJCQkJXAogCSAgICAgcG9zID0gaWd0X2NvbnRhaW5lcl9vZigocG9zKS0+bWVtYmVyLnBy
ZXYsIHBvcywgbWVtYmVyKSkKIAorI2RlZmluZSBpZ3RfbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
X3JldmVyc2UocG9zLCB0bXAsIGhlYWQsIG1lbWJlcikJXAorCWZvciAocG9zID0gaWd0X2NvbnRh
aW5lcl9vZigoaGVhZCktPnByZXYsIHBvcywgbWVtYmVyKSwJCVwKKwkgICAgIHRtcCA9IGlndF9j
b250YWluZXJfb2YoKHBvcyktPm1lbWJlci5wcmV2LCB0bXAsIG1lbWJlcik7CVwKKwkgICAgICZw
b3MtPm1lbWJlciAhPSAoaGVhZCk7CQkJCQlcCisJICAgICBwb3MgPSB0bXAsCQkJCQkJCVwKKwkg
ICAgIHRtcCA9IGlndF9jb250YWluZXJfb2YoKHBvcyktPm1lbWJlci5wcmV2LCB0bXAsIG1lbWJl
cikpCiAKIC8qIElHVCBjdXN0b20gaGVscGVycyAqLwogCi0tIAoyLjI2LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
