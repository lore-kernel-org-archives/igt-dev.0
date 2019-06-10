Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190610104654.20130-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e6e9d079-8da7-9cdd-cd72-e78501ea557c@linux.intel.com>
Date: Mon, 10 Jun 2019 12:04:43 +0100
MIME-Version: 1.0
In-Reply-To: <20190610104654.20130-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_engines: Skip
 trying to read a non-existent TIMESTAMP
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

Ck9uIDEwLzA2LzIwMTkgMTE6NDYsIENocmlzIFdpbHNvbiB3cm90ZToKPiBUaGUgcGVyLWVuZ2lu
ZSBUSU1FU1RBTVAgKGF0IGxlYXN0IGF0IHRoZSBvZmZzZXQgSSBrbm93IGFib3V0KSBvbmx5IGNh
bWUKPiBpbnRvIGJlaW5nIHdpdGggZ2VuNi4gU28gc2tpcCB0aGUgdGVzdCBvbiBvbGRlciBnZW4g
YXMgdGhlIHJlc3VsdHMgYXJlCj4gZ2FyYmFnZS4KPiAKPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwODc0Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICB0ZXN0cy9p
OTE1L2dlbV9jdHhfZW5naW5lcy5jIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfZW5naW5lcy5jIGIv
dGVzdHMvaTkxNS9nZW1fY3R4X2VuZ2luZXMuYwo+IGluZGV4IDM4ZWEzNGQyMS4uM2VjYWRlNDE3
IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2N0eF9lbmdpbmVzLmMKPiArKysgYi90ZXN0
cy9pOTE1L2dlbV9jdHhfZW5naW5lcy5jCj4gQEAgLTQxOSw2ICs0MTksOCBAQCBzdGF0aWMgdm9p
ZCBpbmRlcGVuZGVudChpbnQgaTkxNSkKPiAgIAlpbnQgdGltZWxpbmUgPSBzd19zeW5jX3RpbWVs
aW5lX2NyZWF0ZSgpOwo+ICAgCXVpbnQzMl90IGxhc3QsICptYXA7Cj4gICAKPiArCWlndF9yZXF1
aXJlKGdlbiA+PSA2KTsgLyogTm8gcGVyLWVuZ2luZSBUSU1FU1RBTVAgb24gb2xkZXIgZ2VuICov
Cj4gKwo+ICAgCXsKPiAgIAkJc3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVyMiBleGVjYnVm
ID0gewo+ICAgCQkJLmJ1ZmZlcnNfcHRyID0gdG9fdXNlcl9wb2ludGVyKCZyZXN1bHRzKSwKPiAK
ClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoK
UmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
