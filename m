Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D47E6E757
 for <igt-dev@lists.freedesktop.org>; Sat,  3 Nov 2018 11:29:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d10-v6so4493758wrs.5
 for <igt-dev@lists.freedesktop.org>; Sat, 03 Nov 2018 04:29:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sat,  3 Nov 2018 13:28:52 +0200
Message-Id: <1541244532-3421-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: Fix handling
 of unknown single plane modes
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

Rml4IGNyZWF0aW9uIG9mIGdlbSBidWZmZXIgc28gdGhhdCB1c2VkIGJwcCB3aWxsIGFsd2F5cyBo
YXZlIHZhbHVlIG90aGVyCnRoYW4gMC4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDY3MDEKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBI
ZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfYXZh
aWxhYmxlX21vZGVzX2NyYy5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXZhaWxh
YmxlX21vZGVzX2NyYy5jIGIvdGVzdHMva21zX2F2YWlsYWJsZV9tb2Rlc19jcmMuYwppbmRleCA0
NWE0Nzc1Li4wMDZjMmRiIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfYXZhaWxhYmxlX21vZGVzX2Ny
Yy5jCisrKyBiL3Rlc3RzL2ttc19hdmFpbGFibGVfbW9kZXNfY3JjLmMKQEAgLTE2NCw3ICsxNjQs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHsKICNpZmRlZiBEUk1fRk9STUFUX1AwMTYKIAl7IERS
TV9GT1JNQVRfUDAxNiwgMCwgUDAxMCwgMHg4MDAwZWIwMH0sCiAjZW5kaWYKLQl7IDAsIDAsIDAs
IDAgfQorCXsgMCwgMCwgU0tJUDQsIDAgfQogfTsKIAogLyoKQEAgLTIzMiwxMyArMjMyLDEzIEBA
IHN0YXRpYyBib29sIGZpbGxfaW5fZmIoZGF0YV90ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1
dCwgaWd0X3BsYW5lX3QgKnBsYW5lLAogCQkJd3JpdGVzaXplID0gZGF0YS0+c2l6ZTsKIAkJCWJy
ZWFrOwogCQl9Ci0JCWlndF9pbmZvKCJGb3JtYXQgJXMgQ1JDIGNvbXBhcmlzb24gc2tpcHBlZCBi
eSBkZXNpZ24uXG4iLAotCQkJIChjaGFyKikmZmlsbGVyc1tpXS5mb3VyY2MpOworCQlpZ3RfaW5m
bygiRm9ybWF0ICUuNHMgQ1JDIGNvbXBhcmlzb24gc2tpcHBlZCBieSBkZXNpZ24uXG4iLAorCQkJ
IChjaGFyKikmZm9ybWF0KTsKIAogCQlyZXR1cm4gZmFsc2U7CiAJZGVmYXVsdDoKLQkJaWd0X2lu
Zm8oIlVuc3VwcG9ydGVkIG1vZGUgZm9yIHRlc3QgJXNcbiIsCi0JCQkgKGNoYXIqKSZmaWxsZXJz
W2ldLmZvdXJjYyk7CisJCWlndF9pbmZvKCJVbnN1cHBvcnRlZCBtb2RlIGZvciB0ZXN0ICUuNHNc
biIsCisJCQkgKGNoYXIqKSZmb3JtYXQpOwogCQlyZXR1cm4gZmFsc2U7CiAJfQogCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
