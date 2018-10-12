Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061866E4D1
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Oct 2018 21:28:36 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 12 Oct 2018 14:28:27 -0700
Message-Id: <20181012212827.30163-2-jose.souza@intel.com>
In-Reply-To: <20181012212827.30163-1-jose.souza@intel.com>
References: <20181012212827.30163-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests: Skip testdisplay when KMS is
 disabled
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

VGhpcyB0ZXN0IHNob3VsZCBiZSBza2lwZWQgd2hlbiBLTVMgaXMgZGlzYWJsZWQuCgpDYzogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL3Rlc3Rk
aXNwbGF5LmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGVzdGRpc3BsYXkuYyBiL3Rlc3RzL3Rlc3Rk
aXNwbGF5LmMKaW5kZXggYjEzYzNkNzAuLjk5NzJmYjNjIDEwMDY0NAotLS0gYS90ZXN0cy90ZXN0
ZGlzcGxheS5jCisrKyBiL3Rlc3RzL3Rlc3RkaXNwbGF5LmMKQEAgLTQ1NywxMCArNDU3LDcgQEAg
aW50IHVwZGF0ZV9kaXNwbGF5KGJvb2wgcHJvYmUpCiAJaW50IGM7CiAKIAlyZXNvdXJjZXMgPSBk
cm1Nb2RlR2V0UmVzb3VyY2VzKGRybV9mZCk7Ci0JaWYgKCFyZXNvdXJjZXMpIHsKLQkJaWd0X3dh
cm4oImRybU1vZGVHZXRSZXNvdXJjZXMgZmFpbGVkOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsK
LQkJcmV0dXJuIDA7Ci0JfQorCWlndF9yZXF1aXJlKHJlc291cmNlcyk7CiAKIAljb25uZWN0b3Jz
ID0gY2FsbG9jKHJlc291cmNlcy0+Y291bnRfY29ubmVjdG9ycywKIAkJCSAgICBzaXplb2Yoc3Ry
dWN0IGNvbm5lY3RvcikpOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
