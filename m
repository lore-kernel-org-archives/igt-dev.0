Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A2D89A08
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 17:21:43 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 12 Apr 2019 10:21:32 -0700
Message-Id: <20190412172136.17116-2-jose.souza@intel.com>
In-Reply-To: <20190412172136.17116-1-jose.souza@intel.com>
References: <20190412172136.17116-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/6] tests/fbcon_fbt: Allow fbcon to bind
 when running this test
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

OWM0MTE0ZWM1ZDg3IChsaWI6IEFsd2F5cyB1bmJpbmQgdGhlIGZiY29uIGFyb3VuZCBpZ3QpIGJy
b2tlCmZiY29uX2ZidCB0ZXN0IGFzIGZiY29uIGlzIG5vdCBhbGxvd2VkIHRvIGJpbmQgd2hlbiBl
eGVjdXRpbmcgYW55IElHVAp0ZXN0LCBzbyBsZXRzIGFsbG93IGl0IGFnYWluIGp1c3QgZm9yIHRo
aXMgdGVzdC4KCkNjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4KQ2M6
IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogRGhpbmFrYXJh
biBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3Rz
L2ttc19mYmNvbl9mYnQuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNv
bl9mYnQuYwppbmRleCBhNzE3ZTAwMC4uZTM2ODM1YWIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19m
YmNvbl9mYnQuYworKysgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKQEAgLTI2LDYgKzI2LDcgQEAK
IAogI2luY2x1ZGUgImlndC5oIgogI2luY2x1ZGUgImlndF9wc3IuaCIKKyNpbmNsdWRlICJpZ3Rf
c3lzZnMuaCIKICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KICNpbmNsdWRlIDxzeXMvc3RhdC5oPgog
I2luY2x1ZGUgPGZjbnRsLmg+CkBAIC0yNzksNiArMjgwLDEyIEBAIHN0YXRpYyB2b2lkIHNldHVw
X2Vudmlyb25tZW50KHZvaWQpCiAJZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVyX21hc3RlcihEUklW
RVJfSU5URUwpOwogCWlndF9yZXF1aXJlKGRybV9mZCA+PSAwKTsKIAlpZ3RfYXNzZXJ0KGNsb3Nl
KGRybV9mZCkgPT0gMCk7CisKKwkvKgorCSAqIGlndF9tYWluKCktPmlndF9zdWJ0ZXN0X2luaXRf
cGFyc2Vfb3B0cygpLT5jb21tb25faW5pdCgpIGRpc2FibGVzIHRoZQorCSAqIGZiY29uIGJpbmQs
IHNvIHRvIHRlc3QgaXQgaXMgbmVjZXNzYXJ5IGVuYWJsZSBpdCBhZ2FpbgorCSAqLworCWJpbmRf
ZmJjb24odHJ1ZSk7CiB9CiAKIHN0YXRpYyB2b2lkIHRlYXJkb3duX2Vudmlyb25tZW50KHZvaWQp
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
