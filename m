Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E78589EFF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 08:59:43 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Thu, 21 Mar 2019 10:59:38 +0200
Message-Id: <20190321085938.17043-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_latency: fix
 uninitialized variable
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

U2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgotLS0KIHRlc3Rz
L2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19s
YXRlbmN5LmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYwppbmRleCA2ZGQxOTFlYy4u
MWIwMjJkZjUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCisrKyBi
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCkBAIC01OTcsNyArNTk3LDcgQEAgcnRob2df
bGF0ZW5jeV9vbl9yaW5nKGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSwgY29uc3QgY2hhciAq
bmFtZSwgdW5zaWduZWQgaW4KIAlmb3IgKHVuc2lnbmVkIGludCBjaGlsZCA9IDA7IGNoaWxkIDwg
bmVuZ2luZTsgY2hpbGQrKykgewogCQlzdHJ1Y3QgcnRfcGt0IG5vcm1hbCA9IHJlc3VsdHNbTlBB
U1MgKiBjaGlsZCArIDFdOwogCQlpZ3Rfc3RhdHNfdCBzdGF0czsKLQkJZG91YmxlIHZhcmlhbmNl
OworCQlkb3VibGUgdmFyaWFuY2UgPSAwLjA7CiAKIAkJaWd0X3N0YXRzX2luaXRfd2l0aF9zaXpl
KCZzdGF0cywgTlBBU1MpOwogCi0tIAoyLjIxLjAKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5k
IE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3Mg
SWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMg
ZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVy
aWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJl
dmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBz
ZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
