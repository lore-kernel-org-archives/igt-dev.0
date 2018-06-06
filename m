Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3ED6F064
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 16:52:02 +0000 (UTC)
References: <20180605162536.26848-1-lionel.g.landwerlin@intel.com>
 <20180605162536.26848-3-lionel.g.landwerlin@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <ef6703e9-8085-aa12-3315-651aeb9df706@intel.com>
Date: Wed, 6 Jun 2018 09:52:01 -0700
MIME-Version: 1.0
In-Reply-To: <20180605162536.26848-3-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/perf: add test for disabled
 preemption stream
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwNS8wNi8xOCAwOToyNSwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+
IC0tLQoKPiArCgpNYXliZSBhIGNvbW1lbnQgb24gd2hhdCBidXN5IGxvb3AgaXMgdHJ5aW5nIHRv
IGRvIHdvdWxkIGhlbHAgdGhlIGxhenkgCnJlYWRlciA6KS4KCj4gK3N0YXRpYyB1aW50MzJfdAo+
ICtidXN5X2xvb3AodWludDMyX3QgY29udGV4dCwgdWludDMyX3QgZHVyYXRpb25fbnMpCj4gK3sK
PiArCXN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZlcjIgZXhlY2J1ZjsKPiArCXN0cnVjdCBk
cm1faTkxNV9nZW1fZXhlY19vYmplY3QyIG9ials0XTsKCj4gKwo+ICsJZm9yIChpID0gMSAvKiBz
a2lwIGRhdGFfaGFuZGxlICovOyBpIDwgQVJSQVlfU0laRShvYmopOyBpKyspCj4gKwkJZ2VtX2Ns
b3NlKGRybV9mZCwgb2JqW2ldLmhhbmRsZSk7Cj4gKwo+ICsJcmV0dXJuIGRhdGFfaGFuZGxlOwo+
ICt9Cj4gKwoKPiArCj4gKy8qCj4gKyAqIFZlcmlmeSB0aGF0IGhvbGRpbmcgcHJlZW1wdGlvbiBp
cyBub3QgYXZhaWxhYmxlIGZvciBub3JtYWwgdXNlcnMKPiArICogdW5sZXNzIHRoZXkgcGVyZl9z
dHJlYW1fcGFyYW5vaWQgaXMgb2ZmLgo+ICsgKi8KPiArc3RhdGljIHZvaWQKPiArdGVzdF91bnBy
aXZpbGVnZWRfc2luZ2xlX2N0eF9jb3VudGVyc19kaXNhYmxlZF9wcmVlbXB0aW9uKHZvaWQpCj4g
K3sKPiArCWlndF9mb3JrKGNoaWxkLCAxKSB7Cj4gKwkJd3JpdGVfdTY0X2ZpbGUoIi9wcm9jL3N5
cy9kZXYvaTkxNS9wZXJmX3N0cmVhbV9wYXJhbm9pZCIsIDEpOwo+ICsKPiArCQlpZ3RfZHJvcF9y
b290KCk7Cj4gKwo+ICsJCWlndF9hc3NlcnQoIWhhc19pOTE1X3BlcmZfZGlzYWJsZV9wcmVlbXB0
aW9uX3N1cHBvcnQoZHJtX2ZkKSk7CgpTaG91bGRuJ3QgdGhpcyBhc3NlcnQgdGhlIHJldHVybiBj
b2RlIGZyb20gdGhlIElPQ1RMIGlzIC1FUEVSTT8KCj4gKwl9Cj4gKwo+ICsJaWd0X3dhaXRjaGls
ZHJlbigpOwo+ICsKPiArCWlndF9mb3JrKGNoaWxkLCAxKSB7Cj4gKwkJd3JpdGVfdTY0X2ZpbGUo
Ii9wcm9jL3N5cy9kZXYvaTkxNS9wZXJmX3N0cmVhbV9wYXJhbm9pZCIsIDApOwo+ICsKPiArCQlp
Z3RfZHJvcF9yb290KCk7Cj4gKwo+ICsJCWlndF9hc3NlcnQoaGFzX2k5MTVfcGVyZl9kaXNhYmxl
X3ByZWVtcHRpb25fc3VwcG9ydChkcm1fZmQpKTsKPiArCX0KPiArCj4gKwlpZ3Rfd2FpdGNoaWxk
cmVuKCk7CgpJIHRoaW5rIHRoaXMgY291bGQgYmUgc3BsaXQgaW50byB0d28gc3ViLXRlc3RzLiBE
byB5b3UgcGxhbiB0byBhZGQgbW9yZSAKQVBJIHRlc3RzPwoKVGhhbmtzLApBbnRvbmlvCgo+ICt9
Cj4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
