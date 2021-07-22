Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2572D6EB72
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 08:33:11 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 22 Jul 2021 10:32:02 +0200
Message-Id: <20210722083240.33453-13-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/50] tests/gem_ctx_freq: Adopt to use
 allocator
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

Rm9yIG5ld2VyIGdlbnMgd2UncmUgbm90IGFibGUgdG8gcmVseSBvbiByZWxvY2F0aW9ucy4gQWRv
cHQgdG8gdXNlCm9mZnNldHMgYWNxdWlyZWQgZnJvbSB0aGUgYWxsb2NhdG9yLgoKU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFzaHV0
b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1f
Y3R4X2ZyZXEuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9mcmVxLmMgYi90ZXN0
cy9pOTE1L2dlbV9jdHhfZnJlcS5jCmluZGV4IGEzNDQ3MmRlNS4uYTI5ZmU2OGI3IDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfZnJlcS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9m
cmVxLmMKQEAgLTEyNCw2ICsxMjQsNyBAQCBzdGF0aWMgdm9pZCBzeXNmc19yYW5nZShpbnQgaTkx
NSkKIAlpZ3Rfc3Bpbl90ICpzcGluOwogCWRvdWJsZSBtZWFzdXJlZDsKIAlpbnQgcG11OworCXVp
bnQ2NF90IGFobmQgPSBnZXRfcmVsb2NfYWhuZChpOTE1LCAwKTsKIAogCS8qCiAJICogVGhlIHN5
c2ZzIGludGVyZmFjZSBzZXRzIHRoZSBnbG9iYWwgbGltaXRzIGFuZCBvdmVycmlkZXMgdGhlCkBA
IC0xNDUsNyArMTQ2LDcgQEAgc3RhdGljIHZvaWQgc3lzZnNfcmFuZ2UoaW50IGk5MTUpCiAJCXVp
bnQzMl90IGN1ciwgZGlzY2FyZDsKIAogCQlnZW1fcXVpZXNjZW50X2dwdShpOTE1KTsKLQkJc3Bp
biA9IGlndF9zcGluX25ldyhpOTE1KTsKKwkJc3BpbiA9IGlndF9zcGluX25ldyhpOTE1LCAuYWhu
ZCA9IGFobmQpOwogCQl1c2xlZXAoMTAwMDApOwogCiAJCXNldF9zeXNmc19mcmVxKHN5c19mcmVx
LCBzeXNfZnJlcSk7CkBAIC0xNjQsNiArMTY1LDcgQEAgc3RhdGljIHZvaWQgc3lzZnNfcmFuZ2Uo
aW50IGk5MTUpCiAJZ2VtX3F1aWVzY2VudF9ncHUoaTkxNSk7CiAKIAljbG9zZShwbXUpOworCXB1
dF9haG5kKGFobmQpOwogCiAjdW5kZWYgTl9TVEVQUwogfQotLSAKMi4yNi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
