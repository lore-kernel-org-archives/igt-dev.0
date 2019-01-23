Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC06EF61
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 14:04:09 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Wed, 23 Jan 2019 15:04:04 +0100
Message-Id: <20190123140404.11299-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_gt: Move assert with setting
 'reset' parameter after IGT env check
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

V2UgYXJlIHRyeWluZyB0byBzZXQgcmVzZXQgcGFyYW1ldGVyIGVhcmxpZXIgdGhhbiBjaGVja2lu
ZyBJR1QgZW52LgpMZXQncyBtb3ZlIGl0IGFmdGVyIGNoZWNraW5nIElHVCBlbnYgdG8gYXZvaWQg
c2V0dGluZyByZXNldCBwYXJhbWV0ZXIKd2hlbiBoYW5nIGluamVjdGlvbiBpcyBkaXNhYmxlZC4K
CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1i
eTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Ci0tLQogbGliL2lndF9n
dC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9ndC5jIGIvbGliL2lndF9ndC5jCmluZGV4IGRk
MjhkODIxLi42NDY2OTY3MiAxMDA2NDQKLS0tIGEvbGliL2lndF9ndC5jCisrKyBiL2xpYi9pZ3Rf
Z3QuYwpAQCAtMTcwLDE1ICsxNzAsMTUgQEAgaWd0X2hhbmdfdCBpZ3RfYWxsb3dfaGFuZyhpbnQg
ZmQsIHVuc2lnbmVkIGN0eCwgdW5zaWduZWQgZmxhZ3MpCiAJICovCiAJaWd0X3JlcXVpcmVfZ2Vt
KGZkKTsKIAotCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NldF9wYXJhbWV0ZXIKLQkJICAgKGZkLCAi
cmVzZXQiLCAiJWQiLCBJTlRfTUFYIC8qIGFueSByZXNldCBtZXRob2QgKi8pKTsKLQogCWlmICgh
aWd0X2NoZWNrX2Jvb2xlYW5fZW52X3ZhcigiSUdUX0hBTkciLCB0cnVlKSkKIAkJaWd0X3NraXAo
ImhhbmcgaW5qZWN0aW9uIGRpc2FibGVkIGJ5IHVzZXIiKTsKIAlnZW1fY29udGV4dF9yZXF1aXJl
X2Jhbm5hYmxlKGZkKTsKIAlpZiAoIWlndF9jaGVja19ib29sZWFuX2Vudl92YXIoIklHVF9IQU5H
X1dJVEhPVVRfUkVTRVQiLCBmYWxzZSkpCiAJCWlndF9yZXF1aXJlKGhhc19ncHVfcmVzZXQoZmQp
KTsKIAorCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NldF9wYXJhbWV0ZXIKKwkJICAgKGZkLCAicmVz
ZXQiLCAiJWQiLCBJTlRfTUFYIC8qIGFueSByZXNldCBtZXRob2QgKi8pKTsKKwogCWlmICgoZmxh
Z3MgJiBIQU5HX0FMTE9XX0NBUFRVUkUpID09IDApIHsKIAkJcGFyYW0ucGFyYW0gPSBJOTE1X0NP
TlRFWFRfUEFSQU1fTk9fRVJST1JfQ0FQVFVSRTsKIAkJcGFyYW0udmFsdWUgPSAxOwotLSAKMi4x
Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
