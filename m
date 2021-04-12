Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F39A6E52E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 10:32:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 12 Apr 2021 12:31:32 +0200
Message-Id: <20210412103147.61299-26-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412103147.61299-1-zbigniew.kempczynski@intel.com>
References: <20210412103147.61299-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v31 25/40] tests/api_intel_bb: Use allocator
 in delta-check test
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

V2Ugd2FudCB0byB1c2UgYWRkcmVzcyByZXR1cm5lZCBmcm9tIGVtaXRfcmVsb2MoKSBidXQgZG8g
bm90IGNhbGwKa2VybmVsIHJlbG9jYXRpb24gcGF0aC4gQ2hhbmdlIGludGVsLWJiIHRvIHVzZSBh
bGxvY2F0b3IgdG8gZnVsbHkKY29udHJvbCBhZGRyZXNzZXMgcGFzc2VkIGluIGV4ZWNidWYuCgpT
aWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpB
Y2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiB0ZXN0
cy9pOTE1L2FwaV9pbnRlbF9iYi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9i
Yi5jIGIvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYwppbmRleCA5YzYyZjcxZTguLmNjYjc4ZDky
OCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYworKysgYi90ZXN0cy9pOTE1
L2FwaV9pbnRlbF9iYi5jCkBAIC0xMTI2LDcgKzExMjYsOCBAQCBzdGF0aWMgdm9pZCBkZWx0YV9j
aGVjayhzdHJ1Y3QgYnVmX29wcyAqYm9wcykKIAl1aW50NjRfdCBvZmZzZXQ7CiAJYm9vbCBzdXBw
b3J0c180OGJpdDsKIAotCWliYiA9IGludGVsX2JiX2NyZWF0ZShpOTE1LCBQQUdFX1NJWkUpOwor
CWliYiA9IGludGVsX2JiX2NyZWF0ZV93aXRoX2FsbG9jYXRvcihpOTE1LCAwLCBQQUdFX1NJWkUs
CisJCQkJCSAgICAgSU5URUxfQUxMT0NBVE9SX1NJTVBMRSk7CiAJc3VwcG9ydHNfNDhiaXQgPSBp
YmItPnN1cHBvcnRzXzQ4Yl9hZGRyZXNzOwogCWlmICghc3VwcG9ydHNfNDhiaXQpCiAJCWludGVs
X2JiX2Rlc3Ryb3koaWJiKTsKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
