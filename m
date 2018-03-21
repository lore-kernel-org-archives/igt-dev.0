Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176C76E37B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 05:06:38 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed, 21 Mar 2018 10:34:04 +0530
Message-Id: <1521608644-25707-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: modify fb
 height for yuv planar
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: sunil.kamath@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

ZmIgc3JjIGhlaWdodCB0byBiZSBtb3JlIHRoYW4gbWluaW11bSBzY2FubGluZXMgZm9yIHBsYW5h
cgpmb3JtYXRzIGxpa2UgTlYxMi4gQ2hhbmdpbmcgdGhlIGZiIGhlaWdodCB0byAxOQpzbyB0aGF0
IHRoZSBoZWlnaHQgaXMgbW9yZSB0aGFuIG1pbiB2YWx1ZSBhZnRlciBLTUQgYWRqdXN0bWVudHMK
CkNyZWRpdHMtdG86IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5j
b20+Ci0tLQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKaW5kZXggMzZm
Y2ZjMC4uOGRjNjAzOCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYworKysg
Yi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xMzEsOCArMTMxLDkgQEAgc3RhdGljIHZv
aWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRhX3QgKmQsIGlndF9wbGFuZV90ICpw
bGFuZSwKIAogCS8qIGNyZWF0ZSBidWZmZXIgaW4gdGhlIHJhbmdlIG9mICBtaW4gYW5kIG1heCBz
b3VyY2Ugc2lkZSBsaW1pdC4qLwogCXdpZHRoID0gaGVpZ2h0ID0gOTsKLQlpZiAocGl4ZWxfZm9y
bWF0ID09IERSTV9GT1JNQVRfTlYxMikKLQkJd2lkdGggPSBoZWlnaHQgPSAxNzsKKwlpZiAocGl4
ZWxfZm9ybWF0ID09IERSTV9GT1JNQVRfTlYxMikgeworCQl3aWR0aCA9IGhlaWdodCA9IDE5Owor
CX0KIAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3BsYXktPmRybV9mZCwgd2lkdGgsIGhlaWdodCwK
IAkJICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAmZC0+ZmJbMF0p
OwogCWlndF9wbGFuZV9zZXRfZmIocGxhbmUsICZkLT5mYlswXSk7Ci0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
