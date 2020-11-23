Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9625689CD7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 09:44:37 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 23 Nov 2020 10:43:43 +0100
Message-Id: <20201123094355.39793-20-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201123094355.39793-1-zbigniew.kempczynski@intel.com>
References: <20201123094355.39793-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 19/31] tests/gem_mmap_offset: Use
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
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
ZXQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKaW5kZXggOGIyOWQwYTAuLjhmMjAw
NjI3IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jCisrKyBiL3Rlc3Rz
L2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKQEAgLTYxNCw4ICs2MTQsOCBAQCBzdGF0aWMgdm9pZCBi
bHRfY29oZXJlbmN5KGludCBpOTE1KQogCWRzdCA9IGNyZWF0ZV9ibyhib3BzLCAxLCB3aWR0aCwg
aGVpZ2h0KTsKIAlzaXplID0gc3JjLT5zdXJmYWNlWzBdLnNpemU7CiAKLQlpbnRlbF9iYl9hZGRf
b2JqZWN0KGliYiwgc3JjLT5oYW5kbGUsIHNpemUsIHNyYy0+YWRkci5vZmZzZXQsIGZhbHNlKTsK
LQlpbnRlbF9iYl9hZGRfb2JqZWN0KGliYiwgZHN0LT5oYW5kbGUsIHNpemUsIGRzdC0+YWRkci5v
ZmZzZXQsIHRydWUpOworCWludGVsX2JiX2FkZF9pbnRlbF9idWYoaWJiLCBzcmMsIGZhbHNlKTsK
KwlpbnRlbF9iYl9hZGRfaW50ZWxfYnVmKGliYiwgZHN0LCB0cnVlKTsKIAogCWludGVsX2JiX2Js
dF9jb3B5KGliYiwKIAkJCSAgc3JjLCAwLCAwLCBzcmMtPnN1cmZhY2VbMF0uc3RyaWRlLAotLSAK
Mi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
