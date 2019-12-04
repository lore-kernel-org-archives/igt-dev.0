Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Dec 2019 13:20:51 +0000
Message-Id: <20191204132051.3740419-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Measure how many batches can
 fit into the ring
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RG8gbm90IGJsaW5kbHkgYXNzdW1lIDMwIHNwaW4gYmF0Y2hlcyB3aWxsIGFsd2F5cyBmaXQgaW50
byB0aGUgcmluZywgYnV0CnVzZSBvdXIgbWVhc3VyZW1lbnQgdG9vbCBpbnN0ZWFkLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3BlcmZfcG11
LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUuYwppbmRl
eCBkZTRjMjMxZGQuLjhlNTBhYzlhMCAxMDA2NDQKLS0tIGEvdGVzdHMvcGVyZl9wbXUuYworKysg
Yi90ZXN0cy9wZXJmX3BtdS5jCkBAIC00Miw2ICs0Miw3IEBACiAjaW5jbHVkZSAiaWd0X3BlcmYu
aCIKICNpbmNsdWRlICJpZ3Rfc3lzZnMuaCIKICNpbmNsdWRlICJpZ3RfcG0uaCIKKyNpbmNsdWRl
ICJpOTE1L2dlbV9yaW5nLmgiCiAjaW5jbHVkZSAic3dfc3luYy5oIgogCiBJR1RfVEVTVF9ERVND
UklQVElPTigiVGVzdCB0aGUgaTkxNSBwbXUgcGVyZiBpbnRlcmZhY2UiKTsKQEAgLTEyNzYsOCAr
MTI3Nyw5IEBAIHN0YXRpYyB2b2lkIGNwdV9ob3RwbHVnKGludCBnZW1fZmQpCiBzdGF0aWMgdm9p
ZAogdGVzdF9pbnRlcnJ1cHRzKGludCBnZW1fZmQpCiB7CisJY29uc3QgaW50IHRhcmdldCA9CisJ
CWdlbV9tZWFzdXJlX3JpbmdfaW5mbGlnaHQoZ2VtX2ZkLCBJOTE1X0VYRUNfREVGQVVMVCwgMCk7
CiAJY29uc3QgdW5zaWduZWQgaW50IHRlc3RfZHVyYXRpb25fbXMgPSAxMDAwOwotCWNvbnN0IGlu
dCB0YXJnZXQgPSAzMDsKIAlpZ3Rfc3Bpbl90ICpzcGluW3RhcmdldF07CiAJc3RydWN0IHBvbGxm
ZCBwZmQ7CiAJdWludDY0X3QgaWRsZSwgYnVzeTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
