Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387D36EE8D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2019 22:39:37 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 13 Nov 2019 14:39:28 -0800
Message-Id: <20191113223931.174701-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_psr: Unset errno when expected
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
Cc: Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V3JpdGluZyAweGYgdG8gaTkxNV9lZHBfcHNyX2RlYnVnIGlzIGV4cGVjdGVkIHRvIGhhdmUgLUVJ
TlZBTApyZXR1cm5lZCBpbiBuZXdlciBrZXJuZWxzIGJ1dCB0aGlzIGVycm9yIGFjdHVhbGx5IGNv
bWVzIGZyb20gZXJybm8Kbm90IGZyb20gdGhlIHJldHVybiBvZiB3cml0ZSgpKGNoZWNrIHdyaXRl
TigpKSwgc28gdW5zZXRpbmcgdGhlCmV4cGVjdGVkIGVycm5vIHNvIHRoaXMgZG8gbm90IGNhdXNl
IHRlc3RzIHRvIHNraXBzLgoKRml4ZXM6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hv
d19idWcuY2dpP2lkPTExMjI1NwpDYzogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4KQ2M6
IEFuc2h1bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+CkNjOiBBcmthZGl1c3og
SGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJv
YmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfcHNyLmMg
fCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCmluZGV4IDZkMTky
Njg5Li44M2NjYWNkZCAxMDA2NDQKLS0tIGEvbGliL2lndF9wc3IuYworKysgYi9saWIvaWd0X3Bz
ci5jCkBAIC03Miw5ICs3MiwxMCBAQCBzdGF0aWMgaW50IGhhc19wc3JfZGVidWdmcyhpbnQgZGVi
dWdmc19mZCkKIAkgKiAtRU5PREVWIGlzIHJldHVybmVkIHdoZW4gUFNSIGlzIHVuYXZhaWxhYmxl
LgogCSAqLwogCXJldCA9IHBzcl93cml0ZShkZWJ1Z2ZzX2ZkLCAiMHhmIik7Ci0JaWYgKHJldCA9
PSAtRUlOVkFMKQorCWlmIChyZXQgPT0gLUVJTlZBTCkgeworCQllcnJubyA9IDA7CiAJCXJldHVy
biAwOwotCWVsc2UgaWYgKHJldCA8IDApCisJfSBlbHNlIGlmIChyZXQgPCAwKQogCQlyZXR1cm4g
cmV0OwogCiAJLyogbGVnYWN5IGRlYnVnZnMgYXBpLCB3ZSBlbmFibGVkIGlycXMgYnkgd3JpdGlu
ZywgZGlzYWJsZSB0aGVtLiAqLwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
