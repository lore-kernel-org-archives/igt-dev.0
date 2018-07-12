Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05DD6EF17
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 10:12:53 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 11:12:45 +0100
Message-Id: <20180712101245.20683-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/kms_flip_tiling: Check GEM availability
 before use
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

V2UgdXNlIHRoZSBHUFUgdG8gY29udmVydCBiZXR3ZWVuIHRpbGluZyBmb3JtYXRzLCBpbmRpcmVj
dGx5IHZpYSB0aGUKY2FsbCB0byBpZ3RfY3JlYXRlX3BhdHRlcm5fZmIuIFNvIGJlZm9yZSB3ZSB0
cnkgYW5kIGV4ZWN1dGUgY29tbWFuZHMgb24KdGhlIEdQVSwgd2Ugc2hvdWxkIGNoZWNrIHRoYXQg
dGhlIEdQVSBpcyBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9rbXNfZmxpcF90aWxpbmcuYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zs
aXBfdGlsaW5nLmMgYi90ZXN0cy9rbXNfZmxpcF90aWxpbmcuYwppbmRleCBiZWViMTExYmUuLjc3
ZWQ4YTY4ZiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2ZsaXBfdGlsaW5nLmMKKysrIGIvdGVzdHMv
a21zX2ZsaXBfdGlsaW5nLmMKQEAgLTE0Nyw2ICsxNDcsNyBAQCBpZ3RfbWFpbgogCWlndF9maXh0
dXJlIHsKIAkJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRF
TCk7CiAJCWRhdGEuZ2VuID0gaW50ZWxfZ2VuKGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1f
ZmQpKTsKKwkJaWd0X3JlcXVpcmVfZ2VtKGRhdGEuZHJtX2ZkKTsKIAogCQlrbXN0ZXN0X3NldF92
dF9ncmFwaGljc19tb2RlKCk7CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
