Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF136EDAE
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 07:21:34 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue,  4 Feb 2020 08:21:22 +0100
Message-Id: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_set_tiling_vs_pwrite:
 disable test on gens without ggtt
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

VGVzdCByZXF1aXJlcyBmZW5jZXMgdG8gbWFwIHZpYSBnZ3R0IHNvIHdlIGNhbiBza2lwIGl0IG9u
IG5ld2VyIGdlbnMuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRlLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2k5MTUvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRlLmMgYi90ZXN0cy9pOTE1L2dlbV9zZXRfdGls
aW5nX3ZzX3B3cml0ZS5jCmluZGV4IDI1YTI4MTkxLi5iMzdhMmVlNCAxMDA2NDQKLS0tIGEvdGVz
dHMvaTkxNS9nZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYworKysgYi90ZXN0cy9pOTE1L2dlbV9z
ZXRfdGlsaW5nX3ZzX3B3cml0ZS5jCkBAIC01NSw2ICs1NSw3IEBAIGlndF9zaW1wbGVfbWFpbgog
CXVpbnQzMl90IGhhbmRsZTsKIAogCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7
CisJZ2VtX3JlcXVpcmVfbWFwcGFibGVfZ2d0dChmZCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgT0JK
RUNUX1NJWkUvNDsgaSsrKQogCQlkYXRhW2ldID0gaTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
