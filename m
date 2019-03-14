Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB58899F2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 09:26:28 +0000 (UTC)
Date: Thu, 14 Mar 2019 10:26:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <20190314102623.65f46878@collabora.com>
In-Reply-To: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
References: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/9] tests/kms_lease: Add invalid planes
 tests
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMCBGZWIgMjAxOSAxNzoyNToyMiArMDEwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gVGVzdCBnYXAgYmVjYXVzZSB3ZSdyZSB1c2luZyB1
bml2ZXJzYWwgcGxhbmVzIGJ5IGRlZmF1bHQuIEZpeCB0aGF0Lgo+IAo+IENjOiBLZWl0aCBQYWNr
YXJkIDxrZWl0aHBAa2VpdGhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9y
aXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9rbXNfbGVhc2UuYyB8
IDE1ICsrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfbGVhc2UuYyBiL3Rlc3RzL2ttc19sZWFzZS5jCj4g
aW5kZXggY2NhNDI0NTk4ZWE3Li43MGE5NjM2MmQ3N2EgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21z
X2xlYXNlLmMKPiArKysgYi90ZXN0cy9rbXNfbGVhc2UuYwo+IEBAIC01NzMsNiArNTczLDIwIEBA
IHN0YXRpYyB2b2lkIGxlYXNlX2ludmFsaWRfY3J0YyhkYXRhX3QgKmRhdGEpCj4gIAlpZ3RfYXNz
ZXJ0X2VxKHJldCwgLUVJTlZBTCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGxlYXNlX2ludmFs
aWRfcGxhbmUoZGF0YV90ICpkYXRhKQo+ICt7Cj4gKwlsZWFzZV90IGxlYXNlOwo+ICsJdWludDMy
X3Qgc2F2ZV9wbGFuZV9pZDsKPiArCWludCByZXQ7Cj4gKwo+ICsJLyogQ3JlYXRlIGFuIGludmFs
aWQgbGVhc2UgKi8KPiArCXNhdmVfcGxhbmVfaWQgPSBkYXRhLT5wbGFuZV9pZDsKPiArCWRhdGEt
PnBsYW5lX2lkID0gMHhiYWFkZjAwZDsKPiArCXJldCA9IG1ha2VfbGVhc2UoZGF0YSwgJmxlYXNl
KTsKPiArCWRhdGEtPnBsYW5lX2lkID0gc2F2ZV9wbGFuZV9pZDsKPiArCWlndF9hc3NlcnRfZXEo
cmV0LCAtRUlOVkFMKTsKPiArfQo+ICsKPiAgCj4gIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KGRhdGFf
dCAqZGF0YSwgdm9pZCAoKnRlc3RmdW5jKShkYXRhX3QgKikpCj4gIHsKPiBAQCAtNjI1LDYgKzYz
OSw3IEBAIGlndF9tYWluCj4gIAkJeyAibGVhc2VfYWdhaW4iLCBsZWFzZV9hZ2FpbiB9LAo+ICAJ
CXsgImxlYXNlX2ludmFsaWRfY29ubmVjdG9yIiwgbGVhc2VfaW52YWxpZF9jb25uZWN0b3IgfSwK
PiAgCQl7ICJsZWFzZV9pbnZhbGlkX2NydGMiLCBsZWFzZV9pbnZhbGlkX2NydGMgfSwKPiArCQl7
ICJsZWFzZV9pbnZhbGlkX3BsYW5lIiwgbGVhc2VfaW52YWxpZF9wbGFuZSB9LAo+ICAJCXsgfQo+
ICAJfSwgKmY7Cj4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
