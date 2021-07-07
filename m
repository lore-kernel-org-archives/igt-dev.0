Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A2D6E183
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:45:02 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u14so2461320pga.11
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:45:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:24 -0500
Message-Id: <20210707144337.180693-37-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 36/81] tests/i915/gem_exec_params: Convert
 to intel_ctx_t
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

U2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbXMuYyB8IDQgKysrLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYW1zLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFtcy5j
CmluZGV4IDZhYjFhYjExMC4uNzI5ZDM4YTQzIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9l
eGVjX3BhcmFtcy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYW1zLmMKQEAgLTI5OSw4
ICsyOTksMTAgQEAgc3RhdGljIHZvaWQgdGVzdF9sYXJnZXJfdGhhbl9saWZlX2JhdGNoKGludCBm
ZCkKIHsKIAljb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmU7CiAJdWludDY0
X3Qgc2l6ZSA9IDFVTEwgPDwgMzI7IC8qIGJhdGNoX2xlbiBpcyBfX3UzMiBhcyBwZXIgdGhlIEFC
SSAqLworCWNvbnN0IGludGVsX2N0eF90ICpjdHggPSBpbnRlbF9jdHhfY3JlYXRlX2FsbF9waHlz
aWNhbChmZCk7CiAJc3RydWN0IGRybV9pOTE1X2dlbV9leGVjX29iamVjdDIgZXhlYyA9IHsKIAkJ
LmhhbmRsZSA9IGJhdGNoX2NyZWF0ZV9zaXplKGZkLCBzaXplKSwKKwkJLnJzdmQxID0gY3R4LT5p
ZCwKIAl9OwogCXN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZlcjIgZXhlY2J1ZiA9IHsKIAkJ
LmJ1ZmZlcnNfcHRyID0gdG9fdXNlcl9wb2ludGVyKCZleGVjKSwKQEAgLTMxNiw3ICszMTgsNyBA
QCBzdGF0aWMgdm9pZCB0ZXN0X2xhcmdlcl90aGFuX2xpZmVfYmF0Y2goaW50IGZkKQogCWlndF9y
ZXF1aXJlKHNpemUgPCBnZW1fYXBlcnR1cmVfc2l6ZShmZCkpOwogCWludGVsX3JlcXVpcmVfbWVt
b3J5KDIsIHNpemUsIENIRUNLX1JBTSk7IC8qIGJhdGNoICsgc2hhZG93ICovCiAKLQlfX2Zvcl9l
YWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgeworCWZvcl9lYWNoX2N0eF9lbmdpbmUoZmQsIGN0
eCwgZSkgewogCQkvKiBLZWVwIHRoZSBiYXRjaF9sZW4gaW1wbGljaXQgWzBdICovCiAJCWV4ZWNi
dWYuZmxhZ3MgPSBlLT5mbGFnczsKIAotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
