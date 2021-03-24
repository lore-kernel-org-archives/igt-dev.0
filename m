Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2723A6EA57
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 17:37:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 24 Mar 2021 18:35:35 +0100
Message-Id: <20210324173539.135887-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210324173539.135887-1-zbigniew.kempczynski@intel.com>
References: <20210324173539.135887-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v29 32/36] tests/gem_mmap_offset: Use
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
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpSZXZpZXdlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkFja2VkLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIHRlc3RzL2k5MTUvZ2VtX21tYXBfb2Zm
c2V0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKaW5kZXggYzcxNDU4MzJmLi45NWM5MzRkYmYgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1f
bW1hcF9vZmZzZXQuYwpAQCAtNjE0LDggKzYxNCw4IEBAIHN0YXRpYyB2b2lkIGJsdF9jb2hlcmVu
Y3koaW50IGk5MTUpCiAJZHN0ID0gY3JlYXRlX2JvKGJvcHMsIDEsIHdpZHRoLCBoZWlnaHQpOwog
CXNpemUgPSBzcmMtPnN1cmZhY2VbMF0uc2l6ZTsKIAotCWludGVsX2JiX2FkZF9vYmplY3QoaWJi
LCBzcmMtPmhhbmRsZSwgc2l6ZSwgc3JjLT5hZGRyLm9mZnNldCwgMCwgZmFsc2UpOwotCWludGVs
X2JiX2FkZF9vYmplY3QoaWJiLCBkc3QtPmhhbmRsZSwgc2l6ZSwgZHN0LT5hZGRyLm9mZnNldCwg
MCwgdHJ1ZSk7CisJaW50ZWxfYmJfYWRkX2ludGVsX2J1ZihpYmIsIHNyYywgZmFsc2UpOworCWlu
dGVsX2JiX2FkZF9pbnRlbF9idWYoaWJiLCBkc3QsIHRydWUpOwogCiAJaW50ZWxfYmJfYmx0X2Nv
cHkoaWJiLAogCQkJICBzcmMsIDAsIDAsIHNyYy0+c3VyZmFjZVswXS5zdHJpZGUsCi0tIAoyLjI2
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
