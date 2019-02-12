Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87lg2l1diq.fsf@gaia.fi.intel.com>
References: <20190212101601.25562-1-chris@chris-wilson.co.uk>
 <87lg2l1diq.fsf@gaia.fi.intel.com>
Message-ID: <154996913833.15715.8024144801419918160@skylake-alporthouse-com>
Date: Tue, 12 Feb 2019 10:58:58 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_mmap_gtt: Impose a
 timeout for "hang"
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWthIEt1b3BwYWxhICgyMDE5LTAyLTEyIDEwOjU2OjEzKQo+IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cml0ZXM6Cj4gCj4gPiBPbmx5IHdhaXQgYSBt
YXhpbXVtIG9mIDIgbW9yZSBzZWNvbmRzIGZvciB0aGUgaGFuZyBjaGlsZHJlbiB0byBjb21wbGV0
ZSwKPiA+IHRvIGNhdGNoIGRlYWRsb2NrcyBpbiBhIHRpbWVseSBmYXNoaW9uLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4g
Q2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAg
dGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkx
NS9nZW1fbW1hcF9ndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPiA+IGluZGV4IGY5
ZDgxMWFkNi4uZjZmYmJlMTkzIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9n
dHQuYwo+ID4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYwo+ID4gQEAgLTQ1MCw3ICs0
NTAsNyBAQCB0ZXN0X2hhbmcoaW50IGZkKQo+ID4gICAgICAgaWd0X2luZm8oIiVsdSByZXNldHNc
biIsIGNvdW50KTsKPiA+ICAKPiA+ICAgICAgIGNvbnRyb2wtPmRvbmUgPSB0cnVlOwo+ID4gLSAg
ICAgaWd0X3dhaXRjaGlsZHJlbigpOwo+ID4gKyAgICAgaWd0X3dhaXRjaGlsZHJlbl90aW1lb3V0
KDIsIE5VTEwpOwo+IAo+IFNlZW1zIHRoYXQgbm8tb25lIGlzIHVzaW5nIHRoZSByZWFzb24gYXJn
dW1lbnQuIFlvdSBjb3VsZCBoYXZlCj4gYmVlbiB0aGUgZmlyc3QgZXZlciEKCkkgcmVzaXN0ZWQg
YmVjYXVzZSBJIHN1Z2dlc3RlZCBEYW5pZWwgY291bGQgcmVtb3ZlIGl0IGFzIGhlJ3MKb3Zlcmhh
dWxpbmcgaWd0X3dhaXRjaGlsZHJlbl90aW1lb3V0KCkuCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
