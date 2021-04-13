Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522996E270
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:55:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 15:54:35 +0200
Message-Id: <20210413135441.121421-33-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 32/38] tests/gem_mmap_offset: Use
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
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpBY2tlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0
cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jIGIvdGVzdHMvaTkxNS9n
ZW1fbW1hcF9vZmZzZXQuYwppbmRleCBjNzE0NTgzMmYuLjk1YzkzNGRiZiAxMDA2NDQKLS0tIGEv
dGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYworKysgYi90ZXN0cy9pOTE1L2dlbV9tbWFwX29m
ZnNldC5jCkBAIC02MTQsOCArNjE0LDggQEAgc3RhdGljIHZvaWQgYmx0X2NvaGVyZW5jeShpbnQg
aTkxNSkKIAlkc3QgPSBjcmVhdGVfYm8oYm9wcywgMSwgd2lkdGgsIGhlaWdodCk7CiAJc2l6ZSA9
IHNyYy0+c3VyZmFjZVswXS5zaXplOwogCi0JaW50ZWxfYmJfYWRkX29iamVjdChpYmIsIHNyYy0+
aGFuZGxlLCBzaXplLCBzcmMtPmFkZHIub2Zmc2V0LCAwLCBmYWxzZSk7Ci0JaW50ZWxfYmJfYWRk
X29iamVjdChpYmIsIGRzdC0+aGFuZGxlLCBzaXplLCBkc3QtPmFkZHIub2Zmc2V0LCAwLCB0cnVl
KTsKKwlpbnRlbF9iYl9hZGRfaW50ZWxfYnVmKGliYiwgc3JjLCBmYWxzZSk7CisJaW50ZWxfYmJf
YWRkX2ludGVsX2J1ZihpYmIsIGRzdCwgdHJ1ZSk7CiAKIAlpbnRlbF9iYl9ibHRfY29weShpYmIs
CiAJCQkgIHNyYywgMCwgMCwgc3JjLT5zdXJmYWNlWzBdLnN0cmlkZSwKLS0gCjIuMjYuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
