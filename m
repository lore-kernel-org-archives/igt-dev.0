Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20191007082756.5963-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <d5687d58-f646-eb9a-5728-3ba3408c2789@linux.intel.com>
Date: Mon, 7 Oct 2019 17:56:20 +0100
MIME-Version: 1.0
In-Reply-To: <20191007082756.5963-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] lib/i915: Bump conservative
 threshold for ring size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA3LzEwLzIwMTkgMDk6MjcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBXZSBhcmUgc3RpbGwg
aGl0dGluZyB0aGUgb2NjYXNpb25hbCBzdGFsbCB1cG9uIHN1Ym1pc3Npb24sIHNvIGJlIGV4dHJh
Cj4gY2F1dGlvbiBhbmQgbGVhdmUgb25lIG1vcmUgc3BhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICBsaWIvaTkx
NS9nZW1fcmluZy5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fcmluZy5jIGIv
bGliL2k5MTUvZ2VtX3JpbmcuYwo+IGluZGV4IDI3MjI2NDY1OS4uOWYwOTllZGZmIDEwMDY0NAo+
IC0tLSBhL2xpYi9pOTE1L2dlbV9yaW5nLmMKPiArKysgYi9saWIvaTkxNS9nZW1fcmluZy5jCj4g
QEAgLTEwNCw3ICsxMDQsNyBAQCBfX2dlbV9tZWFzdXJlX3JpbmdfaW5mbGlnaHQoaW50IGZkLCB1
bnNpZ25lZCBpbnQgZW5naW5lLCBlbnVtIG1lYXN1cmVfcmluZ19mbGFncwo+ICAgCX0gd2hpbGUg
KDEpOwo+ICAgCj4gICAJaWd0X2Fzc2VydF9lcShfX2V4ZWNidWYoZmQsICZleGVjYnVmKSwgLUVJ
TlRSKTsKPiAtCWlndF9hc3NlcnQoY291bnQgPiAxKTsKPiArCWlndF9hc3NlcnQoY291bnQgPiAy
KTsKPiAgIAo+ICAgCW1lbXNldCgmaXR2LCAwLCBzaXplb2YoaXR2KSk7Cj4gICAJc2V0aXRpbWVy
KElUSU1FUl9SRUFMLCAmaXR2LCBOVUxMKTsKPiBAQCAtMTIwLDcgKzEyMCw3IEBAIF9fZ2VtX21l
YXN1cmVfcmluZ19pbmZsaWdodChpbnQgZmQsIHVuc2lnbmVkIGludCBlbmdpbmUsIGVudW0gbWVh
c3VyZV9yaW5nX2ZsYWdzCj4gICAJZ2VtX3F1aWVzY2VudF9ncHUoZmQpOwo+ICAgCj4gICAJLyog
QmUgY29uc2VydmF0aXZlIGluIGNhc2Ugd2UgbXVzdCB3cmFwIGxhdGVyICovCj4gLQlyZXR1cm4g
Y291bnQgLSAxOwo+ICsJcmV0dXJuIGNvdW50IC0gMjsKPiAgIH0KPiAgIAo+ICAgLyoqCj4gCgpX
aWxsIG9uZSBtYWtlIGEgZGlmZmVyZW5jZT8KClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0
CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
