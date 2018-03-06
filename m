Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447BE6E14B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 09:23:28 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Tue,  6 Mar 2018 11:24:57 +0200
Message-Id: <20180306092457.25550-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] igt/kms_frontbuffer_tracking: Skip tests if
 FBC was disabled
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgRkJDIGhhcyBiZWVuIGRpc2FibGVkIGluIHRoZSBzeXN0ZW0gZHVlIHRvIHByZXZpb3VzCm1h
bGZ1Y3Rpb24sIHdlIHdvdWxkIHNhdmUgdGltZSBvbiBDSSBpZiB3ZSBiYWlsIG91dCBlYXJseS4K
CkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MDUzNTkKU2lnbmVkLW9mZi1ieTogTWFydGEgTG9mc3RlZHQgPG1hcnRhLmxvZnN0ZWR0QGludGVs
LmNvbT4KLS0tCiB0ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nLmMKaW5kZXggNDMzODQ4MDEuLjljZGRjNGY2IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNf
ZnJvbnRidWZmZXJfdHJhY2tpbmcuYworKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmcuYwpAQCAtMTU5Myw3ICsxNTkzLDcgQEAgc3RhdGljIGJvb2wgZmJjX3N1cHBvcnRlZF9vbl9j
aGlwc2V0KHZvaWQpCiAJY2hhciBidWZbMTI4XTsKIAogCWRlYnVnZnNfcmVhZCgiaTkxNV9mYmNf
c3RhdHVzIiwgYnVmKTsKLQlpZiAoKmJ1ZiA9PSAnXDAnKQorCWlmICgqYnVmID09ICdcMCcgfHwg
c3Ryc3RyKGJ1ZiwgIkZCQyBkaXNhYmxlZDogIikpCiAJCXJldHVybiBmYWxzZTsKIAogCXJldHVy
biAhc3Ryc3RyKGJ1ZiwgIkZCQyB1bnN1cHBvcnRlZCBvbiB0aGlzIGNoaXBzZXRcbiIpOwotLSAK
Mi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
