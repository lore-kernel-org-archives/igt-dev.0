Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960D56EA4D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:39:58 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id y12so8286029pgk.6
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:39:58 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:52 -0500
Message-Id: <20210609173903.249112-33-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 82/93] lib/igt_dummyload: Stop supporting
 ALL_ENGINES without an intel_ctx_t
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
bC5jb20+Ci0tLQogbGliL2lndF9kdW1teWxvYWQuYyB8IDIxICsrKysrKy0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL2lndF9kdW1teWxvYWQuYyBiL2xpYi9pZ3RfZHVtbXlsb2FkLmMKaW5kZXgg
ODI0NTllNTIuLmIwYTdiMzYxIDEwMDY0NAotLS0gYS9saWIvaWd0X2R1bW15bG9hZC5jCisrKyBi
L2xpYi9pZ3RfZHVtbXlsb2FkLmMKQEAgLTEyOSwyMiArMTI5LDEzIEBAIGVtaXRfcmVjdXJzaXZl
X2JhdGNoKGlndF9zcGluX3QgKnNwaW4sCiAJaWYgKG9wdHMtPmVuZ2luZSA9PSBBTExfRU5HSU5F
UykgewogCQlzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmVuZ2luZTsKIAotCQlpZiAo
b3B0cy0+Y3R4KSB7Ci0JCQlmb3JfZWFjaF9jdHhfZW5naW5lKGZkLCBvcHRzLT5jdHgsIGVuZ2lu
ZSkgewotCQkJCWlmIChvcHRzLT5mbGFncyAmIElHVF9TUElOX1BPTExfUlVOICYmCi0JCQkJICAg
ICFnZW1fY2xhc3NfY2FuX3N0b3JlX2R3b3JkKGZkLCBlbmdpbmUtPmNsYXNzKSkKLQkJCQkJY29u
dGludWU7CisJCWlndF9hc3NlcnQob3B0cy0+Y3R4KTsKKwkJZm9yX2VhY2hfY3R4X2VuZ2luZShm
ZCwgb3B0cy0+Y3R4LCBlbmdpbmUpIHsKKwkJCWlmIChvcHRzLT5mbGFncyAmIElHVF9TUElOX1BP
TExfUlVOICYmCisJCQkgICAgIWdlbV9jbGFzc19jYW5fc3RvcmVfZHdvcmQoZmQsIGVuZ2luZS0+
Y2xhc3MpKQorCQkJCWNvbnRpbnVlOwogCi0JCQkJZmxhZ3NbbmVuZ2luZSsrXSA9IGVuZ2luZS0+
ZmxhZ3M7Ci0JCQl9Ci0JCX0gZWxzZSB7Ci0JCQlmb3JfZWFjaF9jb250ZXh0X2VuZ2luZShmZCwg
b3B0cy0+Y3R4X2lkLCBlbmdpbmUpIHsKLQkJCQlpZiAob3B0cy0+ZmxhZ3MgJiBJR1RfU1BJTl9Q
T0xMX1JVTiAmJgotCQkJCSAgICAhZ2VtX2NsYXNzX2Nhbl9zdG9yZV9kd29yZChmZCwgZW5naW5l
LT5jbGFzcykpCi0JCQkJCWNvbnRpbnVlOwotCi0JCQkJZmxhZ3NbbmVuZ2luZSsrXSA9IGVuZ2lu
ZS0+ZmxhZ3M7Ci0JCQl9CisJCQlmbGFnc1tuZW5naW5lKytdID0gZW5naW5lLT5mbGFnczsKIAkJ
fQogCX0gZWxzZSB7CiAJCWZsYWdzW25lbmdpbmUrK10gPSBvcHRzLT5lbmdpbmU7Ci0tIAoyLjMx
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
