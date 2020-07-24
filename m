Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867EC6E984
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2020 14:33:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 24 Jul 2020 16:33:02 +0200
Message-Id: <20200724143312.17881-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200724143312.17881-1-zbigniew.kempczynski@intel.com>
References: <20200724143312.17881-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 03/13] tests/gem_caching: adopt to batch
 flush function cleanup
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

aW50ZWxfYmIgQVBJIGhhcyBiZWVuIGNsZWFuZWQgc28gZmx1c2ggZ2VuZXJhdGVzIGFsc28gQkJF
IGFuZCBleGVjdXRlcwp0aGUgYmF0Y2guIFJlbW92ZSByZWR1bmRhbnQgY29kZSB0byB1c2UgZmx1
c2ggcHJvcGVybHkuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5p
ay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1fY2FjaGluZy5jIHwgNSAtLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY2FjaGlu
Zy5jIGIvdGVzdHMvaTkxNS9nZW1fY2FjaGluZy5jCmluZGV4IDFkODk4OWRiLi4yM2U0MjEzMiAx
MDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fY2FjaGluZy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X2NhY2hpbmcuYwpAQCAtOTksMTEgKzk5LDYgQEAgY29weV9ibyhzdHJ1Y3QgaW50ZWxfYmIgKmli
Yiwgc3RydWN0IGludGVsX2J1ZiAqc3JjLCBzdHJ1Y3QgaW50ZWxfYnVmICpkc3QpCiAJaW50ZWxf
YmJfZW1pdF9yZWxvY19mZW5jZWQoaWJiLCBzcmMtPmhhbmRsZSwKIAkJCQkgICBJOTE1X0dFTV9E
T01BSU5fUkVOREVSLAogCQkJCSAgIDAsIDAsIDB4MCk7Ci0KLQkgLyogTWFyayB0aGUgZW5kIG9m
IHRoZSBidWZmZXIuICovCi0JaW50ZWxfYmJfb3V0KGliYiwgTUlfQkFUQ0hfQlVGRkVSX0VORCk7
Ci0JaW50ZWxfYmJfcHRyX2FsaWduKGliYiwgOCk7Ci0KIAlpbnRlbF9iYl9mbHVzaF9ibGl0KGli
Yik7CiAJaW50ZWxfYmJfc3luYyhpYmIpOwogfQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
