Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C72D89786
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2019 15:14:43 +0000 (UTC)
From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Date: Mon, 15 Jul 2019 17:14:27 +0200
Message-Id: <20190715151427.22796-1-lukasz.kalamarz@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap_wc: Tweak close subtest
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

U21hbGwgY2hhbmdlIHRoYXQgYWxsb3cgdXNlciB0byBsb3dlciBPQkpFQ1RfU0laRSB3aXRob3V0
IGZhbHNlIG5lZ2F0aXZlLgoKU2lnbmVkLW9mZi1ieTogTHVrYXN6IEthbGFtYXJ6IDxsdWthc3ou
a2FsYW1hcnpAaW50ZWwuY29tPgpDYzogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vu
emlhbm9AaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+CkNjOiBNaWNoYWwgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KLS0t
CiB0ZXN0cy9pOTE1L2dlbV9tbWFwX3djLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1f
bW1hcF93Yy5jIGIvdGVzdHMvaTkxNS9nZW1fbW1hcF93Yy5jCmluZGV4IGM5ZTViZjIzLi4zNzVh
OWI1MCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF93Yy5jCisrKyBiL3Rlc3RzL2k5
MTUvZ2VtX21tYXBfd2MuYwpAQCAtMzAwLDggKzMwMCw4IEBAIHRlc3RfY2xvc2UoaW50IGZkKQog
CiAJbWVtc2V0KHB0ciwgMHhjYywgT0JKRUNUX1NJWkUpOwogCWdlbV9jbG9zZShmZCwgaGFuZGxl
KTsKLQlmb3IgKGkgPSAwOyBpIDwgNDA5NjsgaSsrKQotCQlpZ3RfYXNzZXJ0KHB0cltpKjQwOTYr
aV0gPT0gMHhjYyk7CisJZm9yIChpID0gMDsgaSA8IE9CSkVDVF9TSVpFIC8gNDA5NjsgaSsrKQor
CQlpZ3RfYXNzZXJ0KHB0cltpICogNDA5NiArIGldID09IDB4Y2MpOwogCiAJbXVubWFwKHB0ciwg
T0JKRUNUX1NJWkUpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
