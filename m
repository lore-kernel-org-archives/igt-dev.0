Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190517112526.6738-1-tvrtko.ursulin@linux.intel.com>
 <20190517112526.6738-25-tvrtko.ursulin@linux.intel.com>
 <20190517121034.GE2556@intel.intel>
 <c12ac60c-78f5-376d-7c2d-cbfe8f5d05ea@linux.intel.com>
 <20190517130221.GA2428@intel.intel>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <86c71e9e-0fc7-8e52-098a-c059b2c9db3f@linux.intel.com>
Date: Fri, 17 May 2019 14:05:38 +0100
MIME-Version: 1.0
In-Reply-To: <20190517130221.GA2428@intel.intel>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 24/25] gem_wsim: Discover engines
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
To: Andi Shyti <andi.shyti@intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE3LzA1LzIwMTkgMTQ6MDIsIEFuZGkgU2h5dGkgd3JvdGU6Cj4+Pj4gK3N0YXRpYyB2b2lk
IHF1ZXJ5X2VuZ2luZXModm9pZCkKPj4+PiArewo+Pj4+ICsJc3RydWN0IGk5MTVfZW5naW5lX2Ns
YXNzX2luc3RhbmNlICplbmdpbmVzOwo+Pj4+ICsJdW5zaWduZWQgaW50IG51bTsKPj4+PiArCj4+
Pj4gKwlpZiAoX19lbmdpbmVzX3F1ZXJpZWQpCj4+Pj4gKwkJcmV0dXJuOwo+Pj4+ICsKPj4+PiAr
CV9fZW5naW5lc19xdWVyaWVkID0gdHJ1ZTsKPj4+PiArCj4+Pj4gKwlpZiAoIWhhc19xdWVyeShm
ZCkgfHwgIWhhc19lbmdpbmVfcXVlcnkoZmQpKSB7Cj4gCj4gWy4uLl0KPiAKPj4+PiArCQl1bnNp
Z25lZCBpbnQgbnVtX2JzZCA9IGdlbV9oYXNfYnNkKGZkKSArIGdlbV9oYXNfYnNkMihmZCk7Cj4+
Pj4gKwkJdW5zaWduZWQgaW50IGkgPSAwOwo+Pj4+ICsKPj4+PiArCQlpZ3RfYXNzZXJ0KG51bSk7
Cj4+Pj4gKwo+Pj4+ICsJCW51bSA9IDEgKyBudW1fYnNkOwo+Pj4KPj4+IGRpZCB5b3UgbWVhbiB0
aGUgYWJvdmUgdHdvIGxpbmVzIHN3YXBwZWQ/Cj4+Cj4+IE5vLCBJIHdhbnQgdG8gYXZvaWQgcnVu
bmluZyBvbiBwbGF0Zm9ybXMgd2l0aCBubyB2Y3MgZW5naW5lcyBzaW5jZSBubyBvbmUKPj4gZXZl
ciB0ZXN0ZWQgZ2VtX3dzaW0gdGhlcmUuCj4gCj4gYnV0IHlvdSBhcmUgYXNzZXJ0aW5nIG9uICdu
dW0nIHdoaWxlIG51bSBpcyBub3QgaW5pdGlhbGl6ZWQuCgpUcnVlLCBteSBiYWQuIFdoZXJlIGFy
ZSBjb21waWxlciB3YXJuaW5ncyB3aGVuIHlvdSBuZWVkIHRoZW0uCgo+IHNvIHRoYXQgSSBndWVz
cyBpdCBzaG91bGQgZmlyc3QgYmUKPiAKPiAJbnVtID0gMSArIG51bV9ic2Q7Cj4gCj4gYW5kIHRo
ZW4KPiAKPiAJaWd0X2Fzc2VydChudW0pOwo+IAo+IHJpZ2h0PwoKSSBqdXN0IHdhbnQgaWd0X2Fz
c2VydChudW1fYnNkKS4KClJlZ2FyZHMsCgpUdnJ0a28KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
