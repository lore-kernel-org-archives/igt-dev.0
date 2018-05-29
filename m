Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A7B6E61E
 for <igt-dev@lists.freedesktop.org>; Tue, 29 May 2018 19:38:14 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 29 May 2018 20:38:08 +0100
Message-Id: <20180529193810.20266-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v7 0/2] intel: per context powergating tests
 & benchmark
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

SGksCgpTb21lIG1vcmUgY2hhbmdlcyBDaHJpcyB3YW50ZWQgdG8gbm90IGRlcGVuZCBvbiBkcm1f
aW50ZWwuIEFsc28KaW1wcm92ZWQgdGVzdHMgZm9yIGR5bmFtaWMgc3NldSBvbi9vZmYgc2V0dGlu
Z3MuCgpDaGVlcnMsCgpMaW9uZWwgTGFuZHdlcmxpbiAoMik6CiAgaGVhZGVyczogYnVtcAogIHRl
c3RzOiBhZGQgc2xpY2UgcG93ZXIgcHJvZ3JhbW1pbmcgdGVzdAoKIGluY2x1ZGUvZHJtLXVhcGkv
YW1kZ3B1X2RybS5oICB8ICAyMyArCiBpbmNsdWRlL2RybS11YXBpL2RybS5oICAgICAgICAgfCAg
IDcgKwogaW5jbHVkZS9kcm0tdWFwaS9kcm1fbW9kZS5oICAgIHwgIDIyICstCiBpbmNsdWRlL2Ry
bS11YXBpL2V0bmF2aXZfZHJtLmggfCAgIDYgKwogaW5jbHVkZS9kcm0tdWFwaS9leHlub3NfZHJt
LmggIHwgMjQwICsrKysrKysrKwogaW5jbHVkZS9kcm0tdWFwaS9pOTE1X2RybS5oICAgIHwgIDQz
ICsrCiBpbmNsdWRlL2RybS11YXBpL21zbV9kcm0uaCAgICAgfCAgIDIgKwogaW5jbHVkZS9kcm0t
dWFwaS90ZWdyYV9kcm0uaCAgIHwgNDkyICsrKysrKysrKysrKysrKysrLQogaW5jbHVkZS9kcm0t
dWFwaS92YzRfZHJtLmggICAgIHwgIDEzICstCiBpbmNsdWRlL2RybS11YXBpL3ZpcnRncHVfZHJt
LmggfCAgIDEgKwogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgICAgICAgIHwgICAxICsKIHRlc3Rz
L2dlbV9jdHhfcGFyYW0uYyAgICAgICAgICB8ICAgNCArLQogdGVzdHMvZ2VtX2N0eF9zc2V1LmMg
ICAgICAgICAgIHwgODc4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMv
bWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgICAxICsKIDE0IGZpbGVzIGNoYW5nZWQsIDE3MTYg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMv
Z2VtX2N0eF9zc2V1LmMKCi0tCjIuMTcuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
