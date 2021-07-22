Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4D06EB10
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 08:33:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 22 Jul 2021 10:32:09 +0200
Message-Id: <20210722083240.33453-20-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 19/50] tests/gem_exec_gttfill: Require
 relocation support
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

RnJvbTogQW5kcnplaiBUdXJrbyA8YW5kcnplai50dXJrb0BsaW51eC5pbnRlbC5jb20+CgpTaW5j
ZSB0aGlzIHRlc3QgdXNlcyByZWxvY2F0aW9ucywgd2hpY2ggYXJlIG5vdyBkaXNhYmxlZCBvbiBu
ZXdlcgpnZW5lcmF0aW9ucywgd2UgbmVlZCB0byBza2lwIHRoZSB0ZXN0IGlmIHRoZXkgYXJlIG5v
dCBzdXBwb3J0ZWQuCkluIG9yZGVyIHRvIG1haW50YWluIGNvdmVyYWdlIGEgc2xpZ2h0bHkgbW9k
aWZpZWQgdmVyc2lvbiBvZiB0aGlzIHRlc3QKdXNpbmcgc29mdHBpbm5pbmcgaW5zdGVhZCBvZiBy
ZWxvY2F0aW9ucyBpcyBhZGRlZCB0byBnZW1fc29mdHBpbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJ6
ZWogVHVya28gPGFuZHJ6ZWoudHVya29AbGludXguaW50ZWwuY29tPgpDYzogWmJpZ25pZXcgS2Vt
cGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkx
NS9nZW1fZXhlY19ndHRmaWxsLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jIGIvdGVzdHMvaTkx
NS9nZW1fZXhlY19ndHRmaWxsLmMKaW5kZXggYjgyODNlYjhmLi5mMTY0Mjg3MTQgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZ3R0ZmlsbC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfZ3R0ZmlsbC5jCkBAIC0yMTYsNiArMjE2LDcgQEAgaWd0X21haW4KIAlpZ3RfZml4dHVyZSB7
CiAJCWk5MTUgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKIAkJaWd0X3JlcXVpcmVf
Z2VtKGk5MTUpOworCQlpZ3RfcmVxdWlyZShnZW1faGFzX3JlbG9jYXRpb25zKGk5MTUpKTsKIAkJ
Y3R4ID0gaW50ZWxfY3R4X2NyZWF0ZV9hbGxfcGh5c2ljYWwoaTkxNSk7CiAJCWlndF9mb3JrX2hh
bmdfZGV0ZWN0b3IoaTkxNSk7CiAJfQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
