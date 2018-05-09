Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CECC6E957
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 21:14:44 +0000 (UTC)
References: <20180509203629.10409-1-antonio.argenziano@intel.com>
 <152589874312.8613.1119392407572962611@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <b1065a2f-d245-66ad-3b95-34962592f686@intel.com>
Date: Wed, 9 May 2018 14:14:43 -0700
MIME-Version: 1.0
In-Reply-To: <152589874312.8613.1119392407572962611@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwOS8wNS8xOCAxMzo0NSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTA1LTA5IDIxOjM2OjI5KQo+PiBNYWtlIHN1cmUgdGhhdCBvbmUg
b2YgdGhlICdtbWFwJyBmdW5jdGlvbnMgcmV0dXJucyBhIHZhbGlkIHBvaW50ZXIgdG8KPj4gYXZv
aWQgZGVyZWZlcmVuY2luZyBhIE5VTEwgcG9pbnRlciBsYXRlciBvbi4gKElzc3VlIGZvdW5kIHZp
YSBjb3Zlcml0eSkKPiAKPiBOb3QgbXVjaCBvZiBhbiBpc3N1ZSwgaXQgZGllcyBtb21lbnRzIGxh
dGVyLiA6LXAKPiAgIAo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+IC0tLQo+PiAgIGxpYi9pZ3RfZHVtbXlsb2FkLmMg
fCAyICsrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvbGliL2lndF9kdW1teWxvYWQuYyBiL2xpYi9pZ3RfZHVtbXlsb2FkLmMKPj4gaW5kZXgg
YmE5MTdiYTUuLmU5NmMwN2NmIDEwMDY0NAo+PiAtLS0gYS9saWIvaWd0X2R1bW15bG9hZC5jCj4+
ICsrKyBiL2xpYi9pZ3RfZHVtbXlsb2FkLmMKPj4gQEAgLTEyNSw2ICsxMjUsOCBAQCBlbWl0X3Jl
Y3Vyc2l2ZV9iYXRjaChpZ3Rfc3Bpbl90ICpzcGluLCBpbnQgZmQsIHVpbnQzMl90IGN0eCwgdW5z
aWduZWQgZW5naW5lLAo+PiAgICAgICAgICBpZiAoIWJhdGNoKQo+PiAgICAgICAgICAgICAgICAg
IGJhdGNoID0gX19nZW1fbW1hcF9fZ3R0KGZkLCBvYmpbQkFUQ0hdLmhhbmRsZSwKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCQVRDSF9TSVpFLCBQUk9UX1dSSVRF
KTsKPiAKPiBPciBnZW1fbW1hcF9fZ3R0KCkuIF9fIHdhcyBqdXN0IGZvbGxvd2luZyB0aGUgcGF0
dGVybiwgb3RvaCBsYWNrIG9mIF9fCj4gaW5kaWNhdGVzIGZpbmFsIGp1c3QgYXMgd2VsbC4KCk9L
LCBJIGNhbiBjaGFuZ2UgaXQuIEkgd2FzIHVuZGVjaWRlZCBiZXR3ZWVuIHRoaXMgYW5kIGFzc2Vy
dCBhbnl3YXkgOikuCgpBbnRvbmlvCgo+IC1DaHJpcwo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
