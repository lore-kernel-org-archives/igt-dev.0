Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BFC6E10E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 09:14:09 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 28 Feb 2018 10:14:03 +0100
Message-Id: <20180228091403.48521-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_draw: Fix bo leak in gpu draw
 routines
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

Z2VtX2hhbmRsZV90b19saWJkcm1fYm8gY3JlYXRlcyBhIG5ldyBoYW5kbGUgdGhyb3VnaCB0aGUg
dXNlIG9mIGZsaW5rLAp3aGljaCBtYWtlcyBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgdGhyb3Vn
aCBhIHNpbmdsZSBydW4gbm90IGNvbXBsZXRlCndoZW4gaXQgc3RhcnRzIGxlYWtpbmcgNTBNQiBv
YmplY3RzLiBBZGQgdGhlIG1pc3NpbmcgYm9fdW5yZWYgdG8ga2lsbAp0aGUgZHVwbGljYXRlZCBo
YW5kbGUgYW5kIGZpeCB0aGUgbGVha3MhCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2lndF9kcmF3LmMgfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHJhdy5j
IGIvbGliL2lndF9kcmF3LmMKaW5kZXggOGY4MjM4MjkyZmI1Li40YzJiMGZkOTkyNWYgMTAwNjQ0
Ci0tLSBhL2xpYi9pZ3RfZHJhdy5jCisrKyBiL2xpYi9pZ3RfZHJhdy5jCkBAIC01NTcsNiArNTU3
LDcgQEAgc3RhdGljIHZvaWQgZHJhd19yZWN0X2JsdChpbnQgZmQsIHN0cnVjdCBjbWRfZGF0YSAq
Y21kX2RhdGEsCiAKIAlpbnRlbF9iYXRjaGJ1ZmZlcl9mbHVzaChiYXRjaCk7CiAJaW50ZWxfYmF0
Y2hidWZmZXJfZnJlZShiYXRjaCk7CisJZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKGRzdCk7CiB9
CiAKIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9yZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGEg
KmNtZF9kYXRhLApAQCAtNjI0LDYgKzYyNSw4IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9yZW5k
ZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGEgKmNtZF9kYXRhLAogCQkgICByZWN0LT5oLCAmZHN0
X2J1ZiwgYWRqdXN0ZWRfZHN0X3gsIHJlY3QtPnkpOwogCiAJaW50ZWxfYmF0Y2hidWZmZXJfZnJl
ZShiYXRjaCk7CisJZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKHNyYyk7CisJZHJtX2ludGVsX2Jv
X3VucmVmZXJlbmNlKGRzdCk7CiAJZ2VtX2Nsb3NlKGZkLCB0bXAuaGFuZGxlKTsKIH0KIAotLSAK
Mi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
