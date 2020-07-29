Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B156E528
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 15:09:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Jul 2020 17:09:11 +0200
Message-Id: <20200729150911.4777-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200729150911.4777-1-zbigniew.kempczynski@intel.com>
References: <20200729150911.4777-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v14 14/14] tests/gem_render_tiled_blits: try
 to use pread instead snoop
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

RXhwZXJpbWVudGFsIHRvIGZpbmQgb3V0IHdoYXQgbWFrZXMgcmVhZGluZyB2aWEgZ3R0IGluY29o
ZXJlbnQuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3Lmtl
bXBjenluc2tpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9yZW5kZXJfdGlsZWRfYmxp
dHMuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl90aWxlZF9ibGl0cy5jIGIvdGVzdHMvaTkxNS9nZW1f
cmVuZGVyX3RpbGVkX2JsaXRzLmMKaW5kZXggMGQ4M2E0M2UuLmYxZWQwMWU2IDEwMDY0NAotLS0g
YS90ZXN0cy9pOTE1L2dlbV9yZW5kZXJfdGlsZWRfYmxpdHMuYworKysgYi90ZXN0cy9pOTE1L2dl
bV9yZW5kZXJfdGlsZWRfYmxpdHMuYwpAQCAtMTA4LDYgKzEwOCwxMCBAQCBzdGF0aWMgdm9pZCBy
dW5fdGVzdCAoaW50IGZkLCBpbnQgY291bnQpCiAJCXNub29wID0gMDsKIAlpZiAoSVNfQlJPQURX
QVRFUihkZXZpZCkgfHwgSVNfQ1JFU1RMSU5FKGRldmlkKSkgLyogc25hZnUgKi8KIAkJc25vb3Ag
PSAwOworCWlmIChJU185MTVHKGRldmlkKSkgeworCQlpZ3RfZGVidWcoIkRpc2FibGUgc25vb3Bp
bmcgZm9yIEdyYW50c2RhbGVcbiIpOworCQlzbm9vcCA9IDA7CisJfQogCiAJYm9wcyA9IGJ1Zl9v
cHNfY3JlYXRlKGZkKTsKIAlpYmIgPSBpbnRlbF9iYl9jcmVhdGUoZmQsIDQwOTYpOwotLSAKMi4y
Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
