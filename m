Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38A89DBF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2020 13:15:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 28 Aug 2020 15:13:53 +0200
Message-Id: <20200828131354.26519-39-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200828131354.26519-1-zbigniew.kempczynski@intel.com>
References: <20200828131354.26519-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v32 38/39] tests/gem_concurrent_all: address
 review comment (remove sync)
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

UmFuZG9tIHN5bmMgbGVhZCB0byBub3QgY29uY3VycmVudCBleGVjdXRpb24gd2hhdCBpcyBub3Qg
d2Ugd2FudC4KRml4IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kg
PHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8
ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2NvbmN1cnJlbnRfYWxsLmMgfCA4
ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY29uY3VycmVudF9hbGwuYyBiL3Rlc3RzL2k5
MTUvZ2VtX2NvbmN1cnJlbnRfYWxsLmMKaW5kZXggOTBlMTMyZmYuLjQ4YjAzMTVkIDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9jb25jdXJyZW50X2FsbC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X2NvbmN1cnJlbnRfYWxsLmMKQEAgLTYzMywxMyArNjMzLDkgQEAgc3RhdGljIHZvaWQKIGNwdV9z
ZXRfYm8oc3RydWN0IGJ1ZmZlcnMgKmIsIHN0cnVjdCBpbnRlbF9idWYgKmJ1ZiwgdWludDMyX3Qg
dmFsKQogewogCWludCBzaXplID0gYi0+bnBpeGVsczsKLQlpbnQgaTkxNSA9IGJ1Zl9vcHNfZ2V0
X2ZkKGJ1Zi0+Ym9wcyk7CiAJdWludDMyX3QgKnZhZGRyOwogCi0JaWYgKGdlbV9oYXNfbGxjKGk5
MTUpKQotCQlpbnRlbF9idWZfY3B1X21hcChidWYsIHRydWUpOwotCWVsc2UKLQkJaW50ZWxfYnVm
X2RldmljZV9tYXAoYnVmLCB0cnVlKTsKKwlpbnRlbF9idWZfZGV2aWNlX21hcChidWYsIHRydWUp
OwogCiAJdmFkZHIgPSBidWYtPnB0cjsKIAl3aGlsZSAoc2l6ZS0tKQpAQCAtODc2LDcgKzg3Miw2
IEBAIHN0YXRpYyB2b2lkIHJlbmRlcl9jb3B5X2JvKHN0cnVjdCBidWZmZXJzICpiLCBzdHJ1Y3Qg
aW50ZWxfYnVmICpkc3QsCiAJCSAgIHNyYywgMCwgMCwKIAkJICAgYi0+d2lkdGgsIGItPmhlaWdo
dCwKIAkJICAgZHN0LCAwLCAwKTsKLQlpbnRlbF9iYl9zeW5jKGItPmliYik7CiAJaW50ZWxfYmJf
cmVzZXQoYi0+aWJiLCB0cnVlKTsKIH0KIApAQCAtODg3LDcgKzg4Miw2IEBAIHN0YXRpYyB2b2lk
IGJsdF9jb3B5X2JvKHN0cnVjdCBidWZmZXJzICpiLCBzdHJ1Y3QgaW50ZWxfYnVmICpkc3QsCiAJ
CSAgICAgICBzcmMsIDAsIDAsIDQqYi0+d2lkdGgsCiAJCSAgICAgICBkc3QsIDAsIDAsIDQqYi0+
d2lkdGgsCiAJCSAgICAgICBiLT53aWR0aCwgYi0+aGVpZ2h0LCAzMik7Ci0JaW50ZWxfYmJfc3lu
YyhiLT5pYmIpOwogCWludGVsX2JiX3Jlc2V0KGItPmliYiwgdHJ1ZSk7CiB9CiAKLS0gCjIuMjYu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
