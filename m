Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2DC6E8B2
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2020 06:31:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 20 Aug 2020 08:30:29 +0200
Message-Id: <20200820063030.10741-32-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200820063030.10741-1-zbigniew.kempczynski@intel.com>
References: <20200820063030.10741-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v31 31/32] lib/intel_aux_pgtable: use aux
 table offset
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

UHJldmlvdXNseSBwYXNzc2VkIGludmFsaWQgYWRkcmVzcyBsZWFkIHRvIGdlbmVyYXRlIG5ldyBh
ZGRyZXNzCnNvIGNhY2hlIHRyZWUgY29udGFpbnMgaW52YWxpZCBhZGRyZXNzIHdoZXJlYXMgYmF0
Y2ggY29udGFpbnMKZm9ybWVyIG9uZS4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennF
hHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRG9taW5payBHcnplZ29y
emVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2ludGVsX2F1eF9wZ3RhYmxlLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2xpYi9pbnRlbF9hdXhfcGd0YWJsZS5jIGIvbGliL2ludGVsX2F1eF9wZ3RhYmxlLmMK
aW5kZXggYjQzYTM2NmIuLmVmNmE5ZmVmIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfYXV4X3BndGFi
bGUuYworKysgYi9saWIvaW50ZWxfYXV4X3BndGFibGUuYwpAQCAtNjEwLDcgKzYxMCw4IEBAIGdl
bjEyX2NyZWF0ZV9hdXhfcGd0YWJsZV9zdGF0ZShzdHJ1Y3QgaW50ZWxfYmIgKmliYiwKIAogCSpw
Z3RhYmxlX3B0ciA9IGludGVsX2JiX29mZnNldF9yZWxvYyhpYmIsIGF1eF9wZ3RhYmxlX2J1Zi0+
aGFuZGxlLAogCQkJCQkgICAgIDAsIDAsCi0JCQkJCSAgICAgcGd0YWJsZV9wdHJfb2Zmc2V0LCAt
MSk7CisJCQkJCSAgICAgcGd0YWJsZV9wdHJfb2Zmc2V0LAorCQkJCQkgICAgIGF1eF9wZ3RhYmxl
X2J1Zi0+YWRkci5vZmZzZXQpOwogCWludGVsX2JiX3B0cl9hZGQoaWJiLCBzaXplb2YoKnBndGFi
bGVfcHRyKSk7CiAKIAlyZXR1cm4gcGd0YWJsZV9wdHJfb2Zmc2V0OwotLSAKMi4yNi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
