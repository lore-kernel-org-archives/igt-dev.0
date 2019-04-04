Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190328114925.25204-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <1a0d17d4-1a8d-9740-e53c-5d72f2bfa57e@linux.intel.com>
Date: Thu, 4 Apr 2019 12:14:19 +0100
MIME-Version: 1.0
In-Reply-To: <20190328114925.25204-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_big: Only warn for the
 first sign of a pagefault
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI4LzAzLzIwMTkgMTE6NDksIENocmlzIFdpbHNvbiB3cm90ZToKPiBXZSBvbmx5IG5lZWQg
dGhlIHdhcm5pbmcgb25jZSwgbm90IGZvciB0aGUgc2V2ZXJhbCB0aG91c2FuZCByZWxvY2F0aW9u
cwo+IHdlIHRyeS4gVGhlIGN1cnJlbnQgZXhlY2J1ZiBpbXBsZW1lbnRhdGlvbiB3aWxsIHNldCBh
bGwgcHJlc3VtZWRfb2Zmc2V0Cj4gdG8gLTEgc28gdGhpcyBsb29wIHNob3VsZCBxdWl0IG9uIHRo
ZSBmaXJzdCBlbnRyeSBpZiB3ZSBoaXQgdGhlCj4gcGFnZWZhdWx0LCBidXQgZm9yIHRoZSBzYWtl
IG9mIGNvbXBsZXRlbmVzcyBjaGVjayBhbGwuCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDI2OQo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+ICAgdGVzdHMvaTkx
NS9nZW1fZXhlY19iaWcuYyB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9l
eGVjX2JpZy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iaWcuYwo+IGluZGV4IDQ0MDEzNmVlOC4u
OWRhOTBlYWQ2IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmlnLmMKPiArKysg
Yi90ZXN0cy9pOTE1L2dlbV9leGVjX2JpZy5jCj4gQEAgLTE2OSw4ICsxNjksMTAgQEAgc3RhdGlj
IHZvaWQgZXhlY04oaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsIHVpbnQ2NF90IGJhdGNoX3NpemUs
IHVuc2lnbmVkIGZsYWdzLAo+ICAgCWlndF9wZXJtdXRlX2FycmF5KGdlbV9yZWxvYywgbnJlbG9j
LCB4Y2hnX3JlbG9jKTsKPiAgIAo+ICAgCWdlbV9leGVjYnVmKGZkLCAmZXhlY2J1Zik7Cj4gLQlm
b3IgKG4gPSAwOyBuIDwgbnJlbG9jOyBuKyspCj4gLQkJaWd0X3dhcm5fb24oZ2VtX3JlbG9jW25d
LnByZXN1bWVkX29mZnNldCA9PSAtMSk7Cj4gKwlmb3IgKG4gPSAwOyBuIDwgbnJlbG9jOyBuKysp
IHsKPiArCQlpZiAoaWd0X3dhcm5fb24oZ2VtX3JlbG9jW25dLnByZXN1bWVkX29mZnNldCA9PSAt
MSkpCj4gKwkJCWJyZWFrOwo+ICsJfQo+ICAgCj4gICAJaWYgKHVzZV82NGJpdF9yZWxvY3MpIHsK
PiAgIAkJZm9yIChuID0gMDsgbiA8IG5yZWxvYzsgbisrKSB7Cj4gCgpSZXZpZXdlZC1ieTogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlZ2FyZHMsCgpUdnJ0a28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
