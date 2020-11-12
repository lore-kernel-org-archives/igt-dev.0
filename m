Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1966E150
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 07:36:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 12 Nov 2020 08:35:23 +0100
Message-Id: <20201112073523.25602-30-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201112073523.25602-1-zbigniew.kempczynski@intel.com>
References: <20201112073523.25602-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 29/29] tests/api_intel_bb: Use allocator
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
YXBpX2ludGVsX2JiLmMKaW5kZXggZTk4ODM0MjcuLjZkMDdmZmZiIDEwMDY0NAotLS0gYS90ZXN0
cy9pOTE1L2FwaV9pbnRlbF9iYi5jCisrKyBiL3Rlc3RzL2k5MTUvYXBpX2ludGVsX2JiLmMKQEAg
LTEwOTAsNyArMTA5MCw3IEBAIHN0YXRpYyB2b2lkIGRlbHRhX2NoZWNrKHN0cnVjdCBidWZfb3Bz
ICpib3BzKQogCXVpbnQ2NF90IG9mZnNldDsKIAlib29sIHN1cHBvcnRzXzQ4Yml0OwogCi0JaWJi
ID0gaW50ZWxfYmJfY3JlYXRlKGk5MTUsIFBBR0VfU0laRSk7CisJaWJiID0gaW50ZWxfYmJfY3Jl
YXRlX2Z1bGwoaTkxNSwgMCwgUEFHRV9TSVpFLCBJTlRFTF9BTExPQ0FUT1JfU0lNUExFKTsKIAlz
dXBwb3J0c180OGJpdCA9IGliYi0+c3VwcG9ydHNfNDhiX2FkZHJlc3M7CiAJaWYgKCFzdXBwb3J0
c180OGJpdCkKIAkJaW50ZWxfYmJfZGVzdHJveShpYmIpOwpAQCAtMTEwMiw3ICsxMTAyLDcgQEAg
c3RhdGljIHZvaWQgZGVsdGFfY2hlY2soc3RydWN0IGJ1Zl9vcHMgKmJvcHMpCiAJYnVmID0gY3Jl
YXRlX2J1Zihib3BzLCAweDEwMDAsIDB4MTAsIENPTE9SX0NDKTsKIAlidWYtPmFkZHIub2Zmc2V0
ID0gMHhmZmZmZjAwMDsKIAlpbnRlbF9iYl9hZGRfb2JqZWN0KGliYiwgYnVmLT5oYW5kbGUsIGlu
dGVsX2J1Zl9ib19zaXplKGJ1ZiksCi0JCQkgICAgYnVmLT5hZGRyLm9mZnNldCwgZmFsc2UpOwor
CQkJICAgIGJ1Zi0+YWRkci5vZmZzZXQsIDAsIGZhbHNlKTsKIAogCWludGVsX2JiX291dChpYmIs
IE1JX1NUT1JFX0RXT1JEX0lNTSk7CiAJaW50ZWxfYmJfZW1pdF9yZWxvYyhpYmIsIGJ1Zi0+aGFu
ZGxlLAotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
