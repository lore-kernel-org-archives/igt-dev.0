Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6516E839
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 16:14:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  1 Mar 2021 17:13:59 +0100
Message-Id: <20210301161403.98278-32-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v21 31/35] tests/gem_mmap_offset: Use
 intel_buf wrapper code instead direct
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

R2VuZXJhbGx5IHdoZW4gcGxheWluZyB3aXRoIGludGVsX2J1ZiB3ZSBzaG91bGQgdXNlIHdyYXBw
ZXIgY29kZQppbnN0ZWFkIG9mIGFkZGluZyBpdCB0byBpbnRlbF9iYiBkaXJlY3RseS4gQ29kZSBj
aGVja3MgcmVxdWlyZWQKYWxpZ25tZW50IG9uIHNwZWNpZmljIGdlbnMgc28gcHJvdGVjdHMgdXMg
ZnJvbSBwYXNzaW5nIHVuYWxpZ25lZApwcm9wZXJseSBhZGRyZXNzZXMuCgpTaWduZWQtb2ZmLWJ5
OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4K
Q2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUv
Z2VtX21tYXBfb2Zmc2V0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZz
ZXQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKaW5kZXggNWU0OGNkNjk3Li44ZjIw
MDYyNzQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKKysrIGIvdGVz
dHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYwpAQCAtNjE0LDggKzYxNCw4IEBAIHN0YXRpYyB2b2lk
IGJsdF9jb2hlcmVuY3koaW50IGk5MTUpCiAJZHN0ID0gY3JlYXRlX2JvKGJvcHMsIDEsIHdpZHRo
LCBoZWlnaHQpOwogCXNpemUgPSBzcmMtPnN1cmZhY2VbMF0uc2l6ZTsKIAotCWludGVsX2JiX2Fk
ZF9vYmplY3QoaWJiLCBzcmMtPmhhbmRsZSwgc2l6ZSwgc3JjLT5hZGRyLm9mZnNldCwgMCwgZmFs
c2UpOwotCWludGVsX2JiX2FkZF9vYmplY3QoaWJiLCBkc3QtPmhhbmRsZSwgc2l6ZSwgZHN0LT5h
ZGRyLm9mZnNldCwgMCwgdHJ1ZSk7CisJaW50ZWxfYmJfYWRkX2ludGVsX2J1ZihpYmIsIHNyYywg
ZmFsc2UpOworCWludGVsX2JiX2FkZF9pbnRlbF9idWYoaWJiLCBkc3QsIHRydWUpOwogCiAJaW50
ZWxfYmJfYmx0X2NvcHkoaWJiLAogCQkJICBzcmMsIDAsIDAsIHNyYy0+c3VyZmFjZVswXS5zdHJp
ZGUsCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
