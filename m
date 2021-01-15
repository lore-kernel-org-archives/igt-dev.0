Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CA66E3D6
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jan 2021 12:09:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 15 Jan 2021 13:08:27 +0100
Message-Id: <20210115120837.54901-22-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210115120837.54901-1-zbigniew.kempczynski@intel.com>
References: <20210115120837.54901-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v16 21/31] tests/gem_ppgtt: Adopt test to
 use intel_bb with allocator
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

VGVzdHMgd29yayBpbiBtdWx0aXByb2Nlc3MgZW52aXJvbm1lbnQgc28gd2UgbXVzdCB0dXJuIG9u
L29mZgp0aHJlYWQgaW4gcGFyZW50IHByb2Nlc3Mgd2hpY2ggaXMgcmVzcG9uc2libGUgZm9yIGFs
bG9jYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9wcGd0
dC5jIGIvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwppbmRleCA1ZjhiMzQyMjQuLmQ0NGJmMDc4NSAx
MDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYworKysgYi90ZXN0cy9pOTE1L2dlbV9w
cGd0dC5jCkBAIC0yODMsMTAgKzI4MywxMyBAQCBpZ3RfbWFpbgogCQlyY3MgPSBjYWxsb2Moc2l6
ZW9mKCpyY3MpLCBuY2hpbGQpOwogCQlpZ3RfYXNzZXJ0KHJjcyk7CiAKKwkJaW50ZWxfYWxsb2Nh
dG9yX211bHRpcHJvY2Vzc19zdGFydCgpOwkJCisKIAkJZm9ya19iY3NfY29weSgzMCwgMHg0MDAw
LCBiY3MsIDEpOwogCQlmb3JrX3Jjc19jb3B5KDMwLCAweDgwMDAgLyBuY2hpbGQsIHJjcywgbmNo
aWxkLCAwKTsKIAogCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7CisJCWludGVsX2FsbG9jYXRvcl9tdWx0
aXByb2Nlc3Nfc3RvcCgpOwogCiAJCXN1cmZhY2VzX2NoZWNrKGJjcywgMSwgMHg0MDAwKTsKIAkJ
c3VyZmFjZXNfY2hlY2socmNzLCBuY2hpbGQsIDB4ODAwMCAvIG5jaGlsZCk7CkBAIC0zMTAsMTAg
KzMxMywxMyBAQCBpZ3RfbWFpbgogCQlyY3MgPSBjYWxsb2Moc2l6ZW9mKCpyY3MpLCBuY2hpbGQp
OwogCQlpZ3RfYXNzZXJ0KHJjcyk7CiAKKwkJaW50ZWxfYWxsb2NhdG9yX211bHRpcHJvY2Vzc19z
dGFydCgpOworCiAJCWZvcmtfcmNzX2NvcHkoMzAsIDB4ODAwMCAvIG5jaGlsZCwgcmNzLCBuY2hp
bGQsIENSRUFURV9DT05URVhUKTsKIAkJZm9ya19iY3NfY29weSgzMCwgMHg0MDAwLCBiY3MsIDEp
OwogCiAJCWlndF93YWl0Y2hpbGRyZW4oKTsKKwkJaW50ZWxfYWxsb2NhdG9yX211bHRpcHJvY2Vz
c19zdG9wKCk7CiAKIAkJc3VyZmFjZXNfY2hlY2soYmNzLCAxLCAweDQwMDApOwogCQlzdXJmYWNl
c19jaGVjayhyY3MsIG5jaGlsZCwgMHg4MDAwIC8gbmNoaWxkKTsKLS0gCjIuMjYuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
