Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448136E1F8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 09:46:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 10 Mar 2021 10:44:58 +0100
Message-Id: <20210310094502.75748-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210310094502.75748-1-zbigniew.kempczynski@intel.com>
References: <20210310094502.75748-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v22 32/36] tests/gem_mmap_offset: Use
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
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1f
bW1hcF9vZmZzZXQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5j
IGIvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYwppbmRleCA1ZTQ4Y2Q2OTcuLjhmMjAwNjI3
NCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYworKysgYi90ZXN0cy9p
OTE1L2dlbV9tbWFwX29mZnNldC5jCkBAIC02MTQsOCArNjE0LDggQEAgc3RhdGljIHZvaWQgYmx0
X2NvaGVyZW5jeShpbnQgaTkxNSkKIAlkc3QgPSBjcmVhdGVfYm8oYm9wcywgMSwgd2lkdGgsIGhl
aWdodCk7CiAJc2l6ZSA9IHNyYy0+c3VyZmFjZVswXS5zaXplOwogCi0JaW50ZWxfYmJfYWRkX29i
amVjdChpYmIsIHNyYy0+aGFuZGxlLCBzaXplLCBzcmMtPmFkZHIub2Zmc2V0LCAwLCBmYWxzZSk7
Ci0JaW50ZWxfYmJfYWRkX29iamVjdChpYmIsIGRzdC0+aGFuZGxlLCBzaXplLCBkc3QtPmFkZHIu
b2Zmc2V0LCAwLCB0cnVlKTsKKwlpbnRlbF9iYl9hZGRfaW50ZWxfYnVmKGliYiwgc3JjLCBmYWxz
ZSk7CisJaW50ZWxfYmJfYWRkX2ludGVsX2J1ZihpYmIsIGRzdCwgdHJ1ZSk7CiAKIAlpbnRlbF9i
Yl9ibHRfY29weShpYmIsCiAJCQkgIHNyYywgMCwgMCwgc3JjLT5zdXJmYWNlWzBdLnN0cmlkZSwK
LS0gCjIuMjYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
