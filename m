Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11C06E2EF
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jan 2021 12:23:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Jan 2021 13:22:31 +0100
Message-Id: <20210114122233.32906-32-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210114122233.32906-1-zbigniew.kempczynski@intel.com>
References: <20210114122233.32906-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v14 31/33] tests/api_intel_bb: Use allocator
 in delta-check test
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

VG8gYmUgc3F1YXNoZWQgYmVmb3JlIG1lcmdlLgoKV2Ugd2FudCB0byB1c2UgYWRkcmVzcyByZXR1
cm5lZCBmcm9tIGVtaXRfcmVsb2MoKSBidXQgZG8gbm90IGNhbGwKa2VybmVsIHJlbG9jYXRpb24g
cGF0aC4gQ2hhbmdlIGludGVsLWJiIHRvIHVzZSBhbGxvY2F0b3IgdG8gZnVsbHkKY29udHJvbCBh
ZGRyZXNzZXMgcGFzc2VkIGluIGV4ZWNidWYuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvYXBpX2ludGVsX2Ji
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYyBiL3Rlc3RzL2k5MTUv
YXBpX2ludGVsX2JiLmMKaW5kZXggNzZjZmZjNzcxLi5hMTlkNjIwZTUgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2k5MTUvYXBpX2ludGVsX2JiLmMKKysrIGIvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYwpA
QCAtMTEwOSw3ICsxMTA5LDcgQEAgc3RhdGljIHZvaWQgZGVsdGFfY2hlY2soc3RydWN0IGJ1Zl9v
cHMgKmJvcHMpCiAJdWludDY0X3Qgb2Zmc2V0OwogCWJvb2wgc3VwcG9ydHNfNDhiaXQ7CiAKLQlp
YmIgPSBpbnRlbF9iYl9jcmVhdGUoaTkxNSwgUEFHRV9TSVpFKTsKKwlpYmIgPSBpbnRlbF9iYl9j
cmVhdGVfZnVsbChpOTE1LCAwLCBQQUdFX1NJWkUsIElOVEVMX0FMTE9DQVRPUl9TSU1QTEUpOwog
CXN1cHBvcnRzXzQ4Yml0ID0gaWJiLT5zdXBwb3J0c180OGJfYWRkcmVzczsKIAlpZiAoIXN1cHBv
cnRzXzQ4Yml0KQogCQlpbnRlbF9iYl9kZXN0cm95KGliYik7CkBAIC0xMTIxLDcgKzExMjEsNyBA
QCBzdGF0aWMgdm9pZCBkZWx0YV9jaGVjayhzdHJ1Y3QgYnVmX29wcyAqYm9wcykKIAlidWYgPSBj
cmVhdGVfYnVmKGJvcHMsIDB4MTAwMCwgMHgxMCwgQ09MT1JfQ0MpOwogCWJ1Zi0+YWRkci5vZmZz
ZXQgPSAweGZmZmZmMDAwOwogCWludGVsX2JiX2FkZF9vYmplY3QoaWJiLCBidWYtPmhhbmRsZSwg
aW50ZWxfYnVmX2JvX3NpemUoYnVmKSwKLQkJCSAgICBidWYtPmFkZHIub2Zmc2V0LCBmYWxzZSk7
CisJCQkgICAgYnVmLT5hZGRyLm9mZnNldCwgMCwgZmFsc2UpOwogCiAJaW50ZWxfYmJfb3V0KGli
YiwgTUlfU1RPUkVfRFdPUkRfSU1NKTsKIAlpbnRlbF9iYl9lbWl0X3JlbG9jKGliYiwgYnVmLT5o
YW5kbGUsCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
