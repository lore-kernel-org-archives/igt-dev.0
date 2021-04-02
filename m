Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1816EE4F
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Apr 2021 09:40:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  2 Apr 2021 11:38:44 +0200
Message-Id: <20210402093844.39637-40-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210402093844.39637-1-zbigniew.kempczynski@intel.com>
References: <20210402093844.39637-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v30 39/39] tests/api_intel_allocator: Check
 alloc with strategy API
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

VmVyaWZ5IHN0cmF0ZWd5IGlzIHByb3Blcmx5IGhhbmRsZWQgaW4gYWxsb2NhdG9yIGFsbG9jKCkg
Y2FsbC4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2Vt
cGN6eW5za2lAaW50ZWwuY29tPgpDYzogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQu
bmV0PgotLS0KIHRlc3RzL2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jIHwgMTEgKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYWxsb2NhdG9yLmMgYi90ZXN0cy9pOTE1L2Fw
aV9pbnRlbF9hbGxvY2F0b3IuYwppbmRleCA3ZmY5MmExNzQuLjE4MmQ5YmE3OSAxMDA2NDQKLS0t
IGEvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYWxsb2NhdG9yLmMKKysrIGIvdGVzdHMvaTkxNS9hcGlf
aW50ZWxfYWxsb2NhdG9yLmMKQEAgLTUwLDEwICs1MCwxOSBAQCBzdGF0aWMgdm9pZCBhbGxvY19z
aW1wbGUoaW50IGZkKQogCiAJaW50ZWxfYWxsb2NhdG9yX2dldF9hZGRyZXNzX3JhbmdlKGFobmQs
ICZzdGFydCwgJmVuZCk7CiAJb2Zmc2V0MCA9IGludGVsX2FsbG9jYXRvcl9hbGxvYyhhaG5kLCAx
LCBlbmQgLSBzdGFydCwgMCk7Ci0Jb2Zmc2V0MSA9IF9faW50ZWxfYWxsb2NhdG9yX2FsbG9jKGFo
bmQsIDIsIDQwOTYsIDApOworCW9mZnNldDEgPSBfX2ludGVsX2FsbG9jYXRvcl9hbGxvYyhhaG5k
LCAyLCA0MDk2LCAwLCBBTExPQ19TVFJBVEVHWV9OT05FKTsKIAlpZ3RfYXNzZXJ0KG9mZnNldDEg
PT0gQUxMT0NfSU5WQUxJRF9BRERSRVNTKTsKIAlpbnRlbF9hbGxvY2F0b3JfZnJlZShhaG5kLCAx
KTsKIAorCW9mZnNldDAgPSBpbnRlbF9hbGxvY2F0b3JfYWxsb2Nfd2l0aF9zdHJhdGVneShhaG5k
LCAxLCA0MDk2LCAwLAorCQkJCQkJICAgICAgQUxMT0NfU1RSQVRFR1lfSElHSF9UT19MT1cpOwor
CW9mZnNldDEgPSBpbnRlbF9hbGxvY2F0b3JfYWxsb2Nfd2l0aF9zdHJhdGVneShhaG5kLCAyLCA0
MDk2LCAwLAorCQkJCQkJICAgICAgQUxMT0NfU1RSQVRFR1lfTE9XX1RPX0hJR0gpOworCWlndF9h
c3NlcnQob2Zmc2V0MCA+IG9mZnNldDEpOworCisJaW50ZWxfYWxsb2NhdG9yX2ZyZWUoYWhuZCwg
MSk7CisJaW50ZWxfYWxsb2NhdG9yX2ZyZWUoYWhuZCwgMik7CisKIAlpZ3RfYXNzZXJ0X2VxKGlu
dGVsX2FsbG9jYXRvcl9jbG9zZShhaG5kKSwgdHJ1ZSk7CiB9CiAKLS0gCjIuMjYuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
