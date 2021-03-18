Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D786E8E3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 11:25:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 18 Mar 2021 12:23:55 +0100
Message-Id: <20210318112407.28717-25-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210318112407.28717-1-zbigniew.kempczynski@intel.com>
References: <20210318112407.28717-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v27 24/36] tests/api_intel_bb: Use allocator
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
QGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
LS0KIHRlc3RzL2k5MTUvYXBpX2ludGVsX2JiLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvYXBp
X2ludGVsX2JiLmMgYi90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCmluZGV4IDBjNzNlZTIxYy4u
MjZlOTgyMDU3IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCisrKyBiL3Rl
c3RzL2k5MTUvYXBpX2ludGVsX2JiLmMKQEAgLTExMjYsNyArMTEyNiw4IEBAIHN0YXRpYyB2b2lk
IGRlbHRhX2NoZWNrKHN0cnVjdCBidWZfb3BzICpib3BzKQogCXVpbnQ2NF90IG9mZnNldDsKIAli
b29sIHN1cHBvcnRzXzQ4Yml0OwogCi0JaWJiID0gaW50ZWxfYmJfY3JlYXRlKGk5MTUsIFBBR0Vf
U0laRSk7CisJaWJiID0gaW50ZWxfYmJfY3JlYXRlX3dpdGhfYWxsb2NhdG9yKGk5MTUsIDAsIFBB
R0VfU0laRSwKKwkJCQkJICAgICBJTlRFTF9BTExPQ0FUT1JfU0lNUExFKTsKIAlzdXBwb3J0c180
OGJpdCA9IGliYi0+c3VwcG9ydHNfNDhiX2FkZHJlc3M7CiAJaWYgKCFzdXBwb3J0c180OGJpdCkK
IAkJaW50ZWxfYmJfZGVzdHJveShpYmIpOwotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
