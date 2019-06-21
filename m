Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095E6E868
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:01:55 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:32 +0530
Message-Id: <20190621100345.20019-31-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 30/43] tests/i915/gem_ring_sync_loop: use the
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
aTkxNS9nZW1fcmluZ19zeW5jX2xvb3AuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2Vt
X3Jpbmdfc3luY19sb29wLmMgYi90ZXN0cy9pOTE1L2dlbV9yaW5nX3N5bmNfbG9vcC5jCmluZGV4
IDExOGYzNjM4YWI5OC4uMzk4MmNmOWI5MzE5IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9y
aW5nX3N5bmNfbG9vcC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3Jpbmdfc3luY19sb29wLmMKQEAg
LTQ0LDEyICs0NCwxMiBAQCBzeW5jX2xvb3AoaW50IGZkKQogCXN0cnVjdCBkcm1faTkxNV9nZW1f
cmVsb2NhdGlvbl9lbnRyeSByZWxvY1sxXTsKIAl1bnNpZ25lZCBlbmdpbmVzWzE2XTsKIAl1bnNp
Z25lZCBuZW5naW5lOwotCXVuc2lnbmVkIGVuZ2luZTsKKwljb25zdCBzdHJ1Y3QgaW50ZWxfZXhl
Y3V0aW9uX2VuZ2luZTIgKmVuZ2luZTsKIAlpbnQgaTsKIAogCW5lbmdpbmUgPSAwOwotCWZvcl9l
YWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZW5naW5lKQotCQllbmdpbmVzW25lbmdpbmUrK10gPSBl
bmdpbmU7CisJX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGVuZ2luZSkKKwkJZW5naW5l
c1tuZW5naW5lKytdID0gZW5naW5lLT5mbGFnczsKIAlpZ3RfcmVxdWlyZShuZW5naW5lKTsKIAog
CW1lbXNldChvYmplY3QsIDAsIHNpemVvZihvYmplY3QpKTsKLS0gCjIuMTkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
