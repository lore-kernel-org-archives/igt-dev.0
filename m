Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8186EC02
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 08:08:12 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Thu,  7 Feb 2019 09:08:04 +0100
Message-Id: <20190207080804.23389-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap_wc: Adjust loop to
 OBJECT_SIZE
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

V2hlbiB3ZSBydW4gdGVzdCB3aXRoIElOVEVMX1NJTVVMQVRJT049MSB3ZSBzZXQgT0JKRUNUX1NJ
WkUKdG8gMU0gd2hpY2ggaXMgbm90IHJlZmxlY3RlZCBpbiB0ZXN0X2Nsb3NlKCkgbG9vcC4KClNp
Z25lZC1vZmYtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpDYzog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBMdWthc3ogS2FsYW1h
cnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fbW1hcF93
Yy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF93Yy5jIGIvdGVzdHMvaTkxNS9nZW1f
bW1hcF93Yy5jCmluZGV4IDExMDg4M2ViLi5iZmYwZmEyYSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkx
NS9nZW1fbW1hcF93Yy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfd2MuYwpAQCAtMjg1LDcg
KzI4NSw3IEBAIHRlc3RfY2xvc2UoaW50IGZkKQogCiAJbWVtc2V0KHB0ciwgMHhjYywgT0JKRUNU
X1NJWkUpOwogCWdlbV9jbG9zZShmZCwgaGFuZGxlKTsKLQlmb3IgKGkgPSAwOyBpIDwgNDA5Njsg
aSsrKQorCWZvciAoaSA9IDA7IGkgPCBPQkpFQ1RfU0laRS80MDk2OyBpKyspCiAJCWlndF9hc3Nl
cnQocHRyW2kqNDA5NitpXSA9PSAweGNjKTsKIAogCW11bm1hcChwdHIsIE9CSkVDVF9TSVpFKTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
