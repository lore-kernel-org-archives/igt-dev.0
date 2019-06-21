Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D272A6E860
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:01:28 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:19 +0530
Message-Id: <20190621100345.20019-18-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 17/43] tests/i915/gem_exec_await: use the
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
aTkxNS9nZW1fZXhlY19hd2FpdC5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfYXdhaXQuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYXdhaXQuYwppbmRleCA1Y2ZlYjhlYzhi
ZmEuLjVhMzIyNDE1OTk0OCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhlY19hd2FpdC5j
CisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYXdhaXQuYwpAQCAtNzMsMTQgKzczLDE1IEBAIHN0
YXRpYyB2b2lkIHdpZGUoaW50IGZkLCBpbnQgcmluZ19zaXplLCBpbnQgdGltZW91dCwgdW5zaWdu
ZWQgaW50IGZsYWdzKQogCX0gKmV4ZWM7CiAJc3RydWN0IGRybV9pOTE1X2dlbV9leGVjX29iamVj
dDIgKm9iajsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIyIGV4ZWNidWY7CisJY29u
c3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplbmdpbmU7CiAJdW5zaWduZWQgZW5n
aW5lc1sxNl07Ci0JdW5zaWduZWQgbmVuZ2luZSwgZW5naW5lOworCXVuc2lnbmVkIG5lbmdpbmU7
CiAJdW5zaWduZWQgbG9uZyBjb3VudDsKIAlkb3VibGUgdGltZTsKIAogCW5lbmdpbmUgPSAwOwot
CWZvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZW5naW5lKQotCQllbmdpbmVzW25lbmdpbmUr
K10gPSBlbmdpbmU7CisJX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGVuZ2luZSkKKwkJ
ZW5naW5lc1tuZW5naW5lKytdID0gZW5naW5lLT5mbGFnczsKIAlpZ3RfcmVxdWlyZShuZW5naW5l
KTsKIAogCWV4ZWMgPSBjYWxsb2MobmVuZ2luZSwgc2l6ZW9mKCpleGVjKSk7Ci0tIAoyLjE5LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
