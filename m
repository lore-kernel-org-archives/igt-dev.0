Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07A36E12C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 13:18:00 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  4 Apr 2019 16:17:40 +0300
Message-Id: <20190404131740.14569-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Be more verbose about failure
 in kmstest_wait_for_pageflip
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rmlyc3QsIHdlIHNldCBlcnJubyB0byAwIGJlZm9yZSBkb2luZyBzZWxlY3QoKSB0byBhdm9pZCBy
YW5kb20gcG9sbHV0aW9uCm9mIHRoZSBhc3NlcnQgbWVzc2FnZSB3aXRoIHRoaW5ncyBsaWtlOgoi
TGFzdCBlcnJubzogMjUsIEluYXBwcm9wcmlhdGUgaW9jdGwgZm9yIGRldmljZSIKClNlY29uZCwg
d2UgbG9nIGV4cGxpY2l0bHkgaWYgd2UgZXhjZWVkZWQgdGhlIHRpbWVvdXQgKHJldCA9PSAwKS4K
ClRoaXJkLCBpZiB3ZSBmYWlsIHRoZSBzZWxlY3QoKSB3ZSBsb2cgdGhhdCB3aXRoIHNvbWUgZXhw
bGFuYXRpb24uCgpDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9r
bXMuYyB8IDEwICsrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwpp
bmRleCBhOTc1ZmYxNC4uZjhiMGRhYjIgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIv
bGliL2lndF9rbXMuYwpAQCAtMTUwNCw5ICsxNTA0LDE3IEBAIHZvaWQga21zdGVzdF93YWl0X2Zv
cl9wYWdlZmxpcChpbnQgZmQpCiAJRkRfWkVSTygmZmRzKTsKIAlGRF9TRVQoZmQsICZmZHMpOwog
CWRvIHsKKwkJZXJybm8gPSAwOwogCQlyZXQgPSBzZWxlY3QoZmQgKyAxLCAmZmRzLCBOVUxMLCBO
VUxMLCAmdGltZW91dCk7CiAJfSB3aGlsZSAocmV0IDwgMCAmJiBlcnJubyA9PSBFSU5UUik7Ci0J
aWd0X2Fzc2VydF9lcShyZXQsIDEpOworCisJaWd0X2ZhaWxfb25fZihyZXQgPT0gMCwKKwkJICAg
ICAiRXhjZWVkZWQgdGltZW91dCAoNTBtcykgd2hpbGUgd2FpdGluZyBmb3IgYSBwYWdlZmxpcFxu
Iik7CisKKwlpZ3RfYXNzZXJ0X2YocmV0ID09IDEsCisJCSAgICAgIldhaXRpbmcgZm9yIHBhZ2Vm
bGlwIGZhaWxlZCB3aXRoICVkIGZyb20gc2VsZWN0KGRybWZkKVxuIiwKKwkJICAgICByZXQpOwor
CiAJaWd0X2Fzc2VydChkcm1IYW5kbGVFdmVudChmZCwgJmV2Y3R4KSA9PSAwKTsKIH0KIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
