Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DD06E862
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:02:14 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:42 +0530
Message-Id: <20190621100345.20019-41-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 40/43] tests/amdgpu/amd_prime: use the
 gem_engine_topology library
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
To: igt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com, andi@etezian.org
List-ID: <igt-dev@lists.freedesktop.org>

UmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVz
CmltcGxlbWVudGVkIGluIHRoZSBnZW1fZW5naW5lX3RvcG9sb2d5IGxpYnJhcnkuCgpTaWduZWQt
b2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+Ci0tLQogdGVzdHMv
YW1kZ3B1L2FtZF9wcmltZS5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdwdS9hbWRfcHJp
bWUuYyBiL3Rlc3RzL2FtZGdwdS9hbWRfcHJpbWUuYwppbmRleCBkYzcxYWM3MGM5ZmMuLmNkMjM2
N2ZmZDUzZSAxMDA2NDQKLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZF9wcmltZS5jCisrKyBiL3Rlc3Rz
L2FtZGdwdS9hbWRfcHJpbWUuYwpAQCAtMTczLDE0ICsxNzMsMTUgQEAgc3RhdGljIHZvaWQgaTkx
NV90b19hbWQoaW50IGk5MTUsIGludCBhbWQsIGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmljZSkK
IAljb25zdCB1aW50MzJfdCBiYmUgPSBNSV9CQVRDSF9CVUZGRVJfRU5EOwogCXN0cnVjdCBkcm1f
aTkxNV9nZW1fZXhlY19vYmplY3QyIG9ialsyXTsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNi
dWZmZXIyIGV4ZWNidWY7Ci0JdW5zaWduZWQgaW50IGVuZ2luZXNbMTZdLCBlbmdpbmU7CisJdW5z
aWduZWQgaW50IGVuZ2luZXNbMTZdOworICAgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0
aW9uX2VuZ2luZTIgKmVuZ2luZTsKIAl1bnNpZ25lZCBpbnQgbmVuZ2luZTsKIAl1bnNpZ25lZCBs
b25nIGNvdW50OwogCXN0cnVjdCBjb3JrIGM7CiAKIAluZW5naW5lID0gMDsKLQlmb3JfZWFjaF9w
aHlzaWNhbF9lbmdpbmUoaTkxNSwgZW5naW5lKQotCQllbmdpbmVzW25lbmdpbmUrK10gPSBlbmdp
bmU7CisJX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoaTkxNSwgZW5naW5lKQorCQllbmdpbmVz
W25lbmdpbmUrK10gPSBlbmdpbmUtPmZsYWdzOwogCWlndF9yZXF1aXJlKG5lbmdpbmUpOwogCiAJ
bWVtc2V0KG9iaiwgMCwgc2l6ZW9mKG9iaikpOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
