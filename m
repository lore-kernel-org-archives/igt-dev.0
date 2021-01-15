Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F416289B68
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jan 2021 12:58:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 15 Jan 2021 13:57:29 +0100
Message-Id: <20210115125739.66577-22-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210115125739.66577-1-zbigniew.kempczynski@intel.com>
References: <20210115125739.66577-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v17 21/31] tests/gem_ppgtt: Adopt test to
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
List-ID: <igt-dev@lists.freedesktop.org>

VGVzdHMgd29yayBpbiBtdWx0aXByb2Nlc3MgZW52aXJvbm1lbnQgc28gd2UgbXVzdCB0dXJuIG9u
L29mZgp0aHJlYWQgaW4gcGFyZW50IHByb2Nlc3Mgd2hpY2ggaXMgcmVzcG9uc2libGUgZm9yIGFs
bG9jYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9wcGd0
dC5jIGIvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwppbmRleCA1ZjhiMzQyMjQuLjY3OGE2MzQ5OCAx
MDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYworKysgYi90ZXN0cy9pOTE1L2dlbV9w
cGd0dC5jCkBAIC0yODMsMTAgKzI4MywxMyBAQCBpZ3RfbWFpbgogCQlyY3MgPSBjYWxsb2Moc2l6
ZW9mKCpyY3MpLCBuY2hpbGQpOwogCQlpZ3RfYXNzZXJ0KHJjcyk7CiAKKwkJaW50ZWxfYWxsb2Nh
dG9yX211bHRpcHJvY2Vzc19zdGFydCgpOworCiAJCWZvcmtfYmNzX2NvcHkoMzAsIDB4NDAwMCwg
YmNzLCAxKTsKIAkJZm9ya19yY3NfY29weSgzMCwgMHg4MDAwIC8gbmNoaWxkLCByY3MsIG5jaGls
ZCwgMCk7CiAKIAkJaWd0X3dhaXRjaGlsZHJlbigpOworCQlpbnRlbF9hbGxvY2F0b3JfbXVsdGlw
cm9jZXNzX3N0b3AoKTsKIAogCQlzdXJmYWNlc19jaGVjayhiY3MsIDEsIDB4NDAwMCk7CiAJCXN1
cmZhY2VzX2NoZWNrKHJjcywgbmNoaWxkLCAweDgwMDAgLyBuY2hpbGQpOwpAQCAtMzEwLDEwICsz
MTMsMTMgQEAgaWd0X21haW4KIAkJcmNzID0gY2FsbG9jKHNpemVvZigqcmNzKSwgbmNoaWxkKTsK
IAkJaWd0X2Fzc2VydChyY3MpOwogCisJCWludGVsX2FsbG9jYXRvcl9tdWx0aXByb2Nlc3Nfc3Rh
cnQoKTsKKwogCQlmb3JrX3Jjc19jb3B5KDMwLCAweDgwMDAgLyBuY2hpbGQsIHJjcywgbmNoaWxk
LCBDUkVBVEVfQ09OVEVYVCk7CiAJCWZvcmtfYmNzX2NvcHkoMzAsIDB4NDAwMCwgYmNzLCAxKTsK
IAogCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7CisJCWludGVsX2FsbG9jYXRvcl9tdWx0aXByb2Nlc3Nf
c3RvcCgpOwogCiAJCXN1cmZhY2VzX2NoZWNrKGJjcywgMSwgMHg0MDAwKTsKIAkJc3VyZmFjZXNf
Y2hlY2socmNzLCBuY2hpbGQsIDB4ODAwMCAvIG5jaGlsZCk7Ci0tIAoyLjI2LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
