Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8D6E01C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 19:37:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <c6efbe89-c789-b120-576f-1f89350c2566@intel.com>
References: <20190226182353.2125-1-antonio.argenziano@intel.com>
 <155120579777.17933.14831240638485565131@skylake-alporthouse-com>
 <f2c631c6-b393-bfea-c95f-14f99c18a6fe@intel.com>
 <155120684682.17933.10687997382247620268@skylake-alporthouse-com>
 <c6efbe89-c789-b120-576f-1f89350c2566@intel.com>
Message-ID: <155120976554.17933.13773590320384066200@skylake-alporthouse-com>
Date: Tue, 26 Feb 2019 19:36:06 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/i915: Add mmap_offset support
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjYgMTk6Mjk6NTApCj4gCj4gCj4g
T24gMjYvMDIvMTkgMTA6NDcsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTI2IDE4OjQ0OjE3KQo+ID4+Cj4gPj4KPiA+PiBPbiAyNi8w
Mi8xOSAxMDoyOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4+PiBRdW90aW5nIEFudG9uaW8gQXJn
ZW56aWFubyAoMjAxOS0wMi0yNiAxODoyMzo1MykKPiA+Pj4+ICtib29sIGhhc19tbWFwX29mZnNl
dChpbnQgZmQpCj4gPj4+Cj4gPj4+IFByZWZpeCBwbGVhc2UuCj4gPj4+Cj4gPj4+PiArewo+ID4+
Pj4gKyAgICAgICBzdGF0aWMgaW50IGhhc19tbWFwX29mZnNldCA9IC0xOwo+ID4+Pgo+ID4+PiBX
aGF0J3Mgb3VyIHBsYW4gdG8gYXZvaWRpbmcgdGhlIHN0YXRpYz8KPiA+Pgo+ID4+IEhvdyBhYm91
dDogbWFrZSB0aGUgdmFyaWFibGUgbm90IHN0YXRpYyBhbmQgcmVtb3ZlIHRoZSBpZj8KPiA+Pgo+
ID4+Pgo+ID4+PiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhlIHN0YXRpY3MgZm9yIHRoZXNlLCBh
cyB0aGVpciB1c2Ugc2hvdWxkIGJlCj4gPj4+IGxpbWl0ZWQgdG8gZml4dHVyZXMuIE9uY2UgcGxh
biBoYXMgYmVlbiBkZWNpZGVkIHVwb24sIGVuYWN0IGl0IGZvciBhbGwKPiA+Pj4gaW4gZ2VtX21t
YW4uYyA6KQo+ID4+Cj4gPj4gT0ssIHRoZXJlIGlzbid0IHJlYWxseSBtdWNoIGluIGdlbV9tbWFu
LCBJJ2xsIGFkZCBhIHBhdGNoIGJlZm9yZSB0aGlzCj4gPj4gb25lIHRvIHJlbW92ZSB3aGF0IGlz
IHRoZXJlIGFuZCBub3QgYWRkIHRoaXMgaGVyZS4KPiA+Pgo+ID4+IEFudG9uaW8KPiA+Pgo+ID4+
Pgo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAgICBpZiAoaGFzX21tYXBfb2Zmc2V0ID09IC0xKSB7Cj4g
Pj4+PiArICAgICAgICAgICAgICAgc3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwo+ID4+Pj4g
Kwo+ID4+Pj4gKyAgICAgICAgICAgICAgIGhhc19tbWFwX29mZnNldCA9IDA7Cj4gPj4+PiArCj4g
Pj4+PiArICAgICAgICAgICAgICAgbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7Cj4gPj4+PiAr
ICAgICAgICAgICAgICAgZ3AucGFyYW0gPSAweDU1OyAvKiBJOTE1X1BBUkFNX01NQVBfT0ZGU0VU
X1ZFUlNJT04gKi8KPiA+IAo+ID4gV2FpdGFzZWMuLi4gSSB0aG91Z2h0IHdlIHdvdWxkIGJlIG92
ZXJsb2FkaW5nIHRoZSBNTUFQX0dUVF9WRVJTSU9OIHNpbmNlCj4gPiB3ZSBhcmUgb3ZlcmxvYWRp
bmcgdGhlIE1NQVBfR1RUPwo+IAo+IEkgdGhpbmsgdGhlIGlkZWEgd2FzIHRvIGhhdmUgdGhlbSBz
ZXBhcmF0ZSwgaWYgd2Ugd2VyZSB0byBtZXJnZSB0aGVtIAo+IHdoYXQgd291bGQgeW91IGhhdmUg
cmV0dXJuIE1NQVBfR1RUX1ZFUlNJT04sIGEgbmV3IHZhbHVlIG9yIGxpa2UgYSBmbGFnPwoKSXQg
ZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlLCB0aGUgcGFyYW0gbmFtZXNwYWNlIGlzIGh1Z2Uu
IEl0IGp1c3QKc3RydWNrIG1lIGFzIGJlaW5nIGEgbGl0dGxlIGRpc2Nvbm5lY3RlZC4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
