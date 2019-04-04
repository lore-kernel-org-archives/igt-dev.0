Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573DE6E5B8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 22:40:14 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu,  4 Apr 2019 15:39:25 -0700
Message-Id: <20190404223925.1102-4-lucas.demarchi@intel.com>
In-Reply-To: <20190404223925.1102-1-lucas.demarchi@intel.com>
References: <20190404223925.1102-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 4/4] gem_exec_parallel: allow unlimited open files
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SSB3YXMgbG9va2luZyBpbnRvIGEgZmFpbHVyZSBpbiB3aGljaCBJIGhhZAoKbGlia21vZDogRVJS
T1IgLi4vbGlia21vZC9saWJrbW9kLWNvbmZpZy5jOjc5MCBjb25mX2ZpbGVzX2xpc3Q6IG9wZW5k
aXIoL2V0Yy9tb2Rwcm9iZS5kKTogVG9vIG1hbnkgb3BlbiBmaWxlcwpsaWJrbW9kOiBFUlJPUiAu
Li9saWJrbW9kL2xpYmttb2QtY29uZmlnLmM6NzkwIGNvbmZfZmlsZXNfbGlzdDogb3BlbmRpcigv
bGliL21vZHByb2JlLmQpOiBUb28gbWFueSBvcGVuIGZpbGVzCihnZW1fZXhlY19wYXJhbGxlbDox
MzE1KSBpZ3Rfa21vZC1XQVJOSU5HOiBDb3VsZCBub3QgbG9hZCBpOTE1CihnZW1fZXhlY19wYXJh
bGxlbDoxMzE1KSBpZ3Rfa21vZC1XQVJOSU5HOiBDb3VsZCBub3QgbG9hZCBpOTE1CgpJIGdvdCBj
dXJpb3VzIGJlY2F1c2UgbGlia21vZCBkb2Vzbid0IG9wZW4gbW9yZSB0aGFuIG9uZSBjb25maWcg
ZmlsZSBhdAphIHRpbWUuIFdoYXQncyBoYXBwZW5pbmcgaXMgdGhhdCBsaWJrbW9kIGlzIG5vdCB0
aGUgY3VscHJpdCwgaXQncyBqdXN0CnRoZSBvbmUgdGhhdCBmYWlsZWQgYmVjYXVzZSB3ZSBvcGVu
IC9kZXYvZHJpL2NhcmQwIC1FVE9PTUFOWVRJTUVTLgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUg
TWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhl
Y19wYXJhbGxlbC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5j
IGIvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jCmluZGV4IGY4MzIwYzNhLi41NDIwOTQ1
NSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jCisrKyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwpAQCAtMTY0LDggKzE2NCwxMCBAQCBzdGF0aWMgdm9p
ZCBhbGwoaW50IGZkLCB1bnNpZ25lZCBlbmdpbmUsIHVuc2lnbmVkIGZsYWdzKQogCWlmIChmbGFn
cyAmIENPTlRFWFRTKQogCQlnZW1fcmVxdWlyZV9jb250ZXh0cyhmZCk7CiAKLQlpZiAoZmxhZ3Mg
JiBGRFMpCisJaWYgKGZsYWdzICYgRkRTKSB7CiAJCWlndF9yZXF1aXJlKGdlbiA+IDUpOworCQlp
Z3RfcmVxdWlyZShpZ3RfYWxsb3dfdW5saW1pdGVkX2ZpbGVzKCkpOworCX0KIAogCW5lbmdpbmUg
PSAwOwogCWlmIChlbmdpbmUgPT0gQUxMX0VOR0lORVMpIHsKLS0gCjIuMjEuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
