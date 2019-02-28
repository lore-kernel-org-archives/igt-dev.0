Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-4-tvrtko.ursulin@linux.intel.com>
 <155136429518.5847.12808789372500594905@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9b6cd18d-1e9e-5b99-b293-8a90dd2e1adb@linux.intel.com>
Date: Thu, 28 Feb 2019 14:42:09 +0000
MIME-Version: 1.0
In-Reply-To: <155136429518.5847.12808789372500594905@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] autoconf: Silence void pointer
 arithmetic warnings
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI4LzAyLzIwMTkgMTQ6MzEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTAyLTI4IDE0OjE4OjI3KQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBNZXNvbiBidWlsZCBkb2VzIGl0IHNvIG1h
a2UgdGhlIHR3byBzeW1tZXRyaWNhbCBpbiB0aGlzIHJlc3BlY3QuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4+IC0tLQo+PiAg
IGNvbmZpZ3VyZS5hYyB8IDIgKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKPj4gaW5kZXgg
NGY1NWVhNWQwZjg5Li4yMTBlMmM1N2RmNTUgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3VyZS5hYwo+
PiArKysgYi9jb25maWd1cmUuYWMKPj4gQEAgLTI1Niw2ICsyNTYsOCBAQCBBQ19BUkdfRU5BQkxF
KHdlcnJvciwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0ZhaWwgb24gd2Fybmlu
Z3NdKSwKPj4gICAgICAgICAgICAgICAgW10sIFtlbmFibGVfd2Vycm9yPW5vXSkKPj4gICAKPj4g
K0NXQVJORkxBR1M9IiRDV0FSTkZMQUdTIC1Xbm8tcG9pbnRlci1hcml0aCIKPiAKPiBcby8KCk1h
eWJlIEkgYW0gb25seSB0ZXN0aW5nIHRvIHNlZSB3aG8gc3RpbGwgdXNlcyBhdXRvbWFrZS4gOikp
Cgo+PiArCj4+ICAgaWYgdGVzdCAieCRlbmFibGVfZGVidWciID0geHllczsgdGhlbgo+PiAgICAg
ICAgICBBU19DT01QSUxFUl9GTEFHKFstZzNdLCBbREVCVUdfQ0ZMQUdTPSItZzMiXSwgW0RFQlVH
X0NGTEFHUz0iLWciXSkKPj4gICAgICAgICAgQVNfQ09NUElMRVJfRkxBRyhbLU9nXSwgW0RFQlVH
X0NGTEFHUys9IiAtT2cgLVduby1tYXliZS11bmluaXRpYWxpemVkIl0sICMgZGlzYWJsZSBtYXli
ZS11bmluaXRpYWxpemVkIGR1ZSB0byBmYWxzZSBwb3NpdGl2ZXMKPj4gLS0gCj4gCj4gQnV0IHNo
b3VsZG4ndCB3ZSBiZSB1c2luZyBzb21ldGhpbmcgbGlrZSB0aGUgYWJvdmUgdG8gdmVyaWZ5IHRo
ZSBmbGFnCj4gZXhpc3RzPwoKRGVmaW5pdGVseSB0cnVlLgoKUmVnYXJkcywKClR2cnRrbwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
