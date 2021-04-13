Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB416E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:55:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 13 Apr 2021 15:54:28 +0200
Message-Id: <20210413135441.121421-26-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
References: <20210413135441.121421-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 25/38] tests/api_intel_bb: Use allocator
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
List-ID: <igt-dev@lists.freedesktop.org>

V2Ugd2FudCB0byB1c2UgYWRkcmVzcyByZXR1cm5lZCBmcm9tIGVtaXRfcmVsb2MoKSBidXQgZG8g
bm90IGNhbGwKa2VybmVsIHJlbG9jYXRpb24gcGF0aC4gQ2hhbmdlIGludGVsLWJiIHRvIHVzZSBh
bGxvY2F0b3IgdG8gZnVsbHkKY29udHJvbCBhZGRyZXNzZXMgcGFzc2VkIGluIGV4ZWNidWYuCgpT
aWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpB
Y2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQWNrZWQtYnk6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUv
YXBpX2ludGVsX2JiLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvYXBpX2ludGVsX2JiLmMgYi90
ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCmluZGV4IDljNjJmNzFlOC4uY2NiNzhkOTI4IDEwMDY0
NAotLS0gYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCisrKyBiL3Rlc3RzL2k5MTUvYXBpX2lu
dGVsX2JiLmMKQEAgLTExMjYsNyArMTEyNiw4IEBAIHN0YXRpYyB2b2lkIGRlbHRhX2NoZWNrKHN0
cnVjdCBidWZfb3BzICpib3BzKQogCXVpbnQ2NF90IG9mZnNldDsKIAlib29sIHN1cHBvcnRzXzQ4
Yml0OwogCi0JaWJiID0gaW50ZWxfYmJfY3JlYXRlKGk5MTUsIFBBR0VfU0laRSk7CisJaWJiID0g
aW50ZWxfYmJfY3JlYXRlX3dpdGhfYWxsb2NhdG9yKGk5MTUsIDAsIFBBR0VfU0laRSwKKwkJCQkJ
ICAgICBJTlRFTF9BTExPQ0FUT1JfU0lNUExFKTsKIAlzdXBwb3J0c180OGJpdCA9IGliYi0+c3Vw
cG9ydHNfNDhiX2FkZHJlc3M7CiAJaWYgKCFzdXBwb3J0c180OGJpdCkKIAkJaW50ZWxfYmJfZGVz
dHJveShpYmIpOwotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
