Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF16E864
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:01:13 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 21 Jun 2019 15:33:11 +0530
Message-Id: <20190621100345.20019-10-ramalingam.c@intel.com>
In-Reply-To: <20190621100345.20019-1-ramalingam.c@intel.com>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC v2 09/43] tests/i915/gem_busy: use the
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
aTkxNS9nZW1fYnVzeS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9idXN5LmMgYi90
ZXN0cy9pOTE1L2dlbV9idXN5LmMKaW5kZXggYTU1MzU4NzA4ZmFmLi5mNjYxMzQ4MDIxMzcgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2J1c3kuYworKysgYi90ZXN0cy9pOTE1L2dlbV9idXN5
LmMKQEAgLTMwNSw2ICszMDUsNyBAQCBzdGF0aWMgdm9pZCBjbG9zZV9yYWNlKGludCBmZCkKIHsK
IAljb25zdCB1bnNpZ25lZCBpbnQgbmNwdXMgPSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxO
KTsKIAljb25zdCB1bnNpZ25lZCBpbnQgbmhhbmRsZXMgPSBnZW1fbWVhc3VyZV9yaW5nX2luZmxp
Z2h0KGZkLCBBTExfRU5HSU5FUywgMCkgLyAyOworCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRp
b25fZW5naW5lMiAqZTsKIAl1bnNpZ25lZCBpbnQgZW5naW5lc1sxNl0sIG5lbmdpbmU7CiAJdW5z
aWduZWQgbG9uZyAqY29udHJvbDsKIAl1aW50MzJfdCAqaGFuZGxlczsKQEAgLTMxOSw4ICszMjAs
OCBAQCBzdGF0aWMgdm9pZCBjbG9zZV9yYWNlKGludCBmZCkKIAkgKi8KIAogCW5lbmdpbmUgPSAw
OwotCWZvcl9lYWNoX2VuZ2luZShmZCwgaSkKLQkJZW5naW5lc1tuZW5naW5lKytdID0gaTsKKwlf
X2Zvcl9lYWNoX3N0YXRpY19lbmdpbmUoZSkKKwkJZW5naW5lc1tuZW5naW5lKytdID0gZS0+Zmxh
Z3M7CiAJaWd0X3JlcXVpcmUobmVuZ2luZSk7CiAKIAljb250cm9sID0gbW1hcChOVUxMLCA0MDk2
LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwgTUFQX0FOT04sIC0xLCAwKTsKLS0gCjIuMTkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
