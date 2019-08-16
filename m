Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C92B89DB7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2019 09:34:36 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 16 Aug 2019 12:34:26 +0300
Message-Id: <20190816093426.10644-11-petri.latvala@intel.com>
In-Reply-To: <20190816093426.10644-1-petri.latvala@intel.com>
References: <20190816093426.10644-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/10] i915/gem_exec_basic: Use dynamic
 subtests
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW5zdGVhZCBvZiBnZW5lcmF0aW5nIGEgc3VidGVzdCBmb3IgZWFjaCBlbmdpbmUgaW4gYSBzdGF0
aWMgbGlzdCwKY29udmVydCB0byBkeW5hbWljIHN1YnRlc3RzLCB3aXRoIG9uZSBkeW5hbWljIHN1
YnRlc3QgcGVyIGFjdHVhbGx5CnByZXNlbnQgcGh5c2ljYWwgZW5naW5lLgoKU2lnbmVkLW9mZi1i
eTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkx
NS9nZW1fZXhlY19iYXNpYy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMu
YwppbmRleCAxMjg3ODYwYi4uYTFkMTkyMmIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfYmFzaWMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKQEAgLTE1OSwxMyAr
MTU5LDI1IEBAIGlndF9tYWluCiAJaWd0X3N1YnRlc3QoImd0dC1hbGwiKQogCQlndHRfYWxsKGZk
KTsKIAotCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Ci0JCWlndF9zdWJ0ZXN0
X2YoImJhc2ljLSVzIiwgZS0+bmFtZSkKLQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKLQkJaWd0X3N1
YnRlc3RfZigicmVhZG9ubHktJXMiLCBlLT5uYW1lKQotCQkJcmVhZG9ubHkoZmQsIGUtPmZsYWdz
KTsKLQkJaWd0X3N1YnRlc3RfZigiZ3R0LSVzIiwgZS0+bmFtZSkKLQkJCWd0dChmZCwgZS0+Zmxh
Z3MpOworCWlndF9keW5hbWljX3N1YnRlc3RfY29udGFpbmVyKCJiYXNpYyIpIHsKKwkJX19mb3Jf
ZWFjaF9waHlzaWNhbF9lbmdpbmUoZmQsIGUpIHsKKwkJCWlndF9keW5hbWljX3N1YnRlc3RfZigi
JXMiLCBlLT5uYW1lKQorCQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKKwkJfQorCX0KKworCWlndF9k
eW5hbWljX3N1YnRlc3RfY29udGFpbmVyKCJyZWFkb25seSIpIHsKKwkJX19mb3JfZWFjaF9waHlz
aWNhbF9lbmdpbmUoZmQsIGUpIHsKKwkJCWlndF9keW5hbWljX3N1YnRlc3RfZigiJXMiLCBlLT5u
YW1lKQorCQkJCXJlYWRvbmx5KGZkLCBlLT5mbGFncyk7CisJCX0KKwl9CisKKwlpZ3RfZHluYW1p
Y19zdWJ0ZXN0X2NvbnRhaW5lcigiZ3R0IikgeworCQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2lu
ZShmZCwgZSkgeworCQkJaWd0X2R5bmFtaWNfc3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCisJCQkJ
Z3R0KGZkLCBlLT5mbGFncyk7CisJCX0KIAl9CiAKIAlpZ3RfZml4dHVyZSB7Ci0tIAoyLjE5LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
