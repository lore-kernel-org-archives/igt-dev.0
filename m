Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26E6EEE0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2019 11:24:00 +0000 (UTC)
Date: Wed, 18 Sep 2019 14:23:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190918112358.GX4019@platvala-desk.ger.corp.intel.com>
References: <20190918103518.22012-1-chris@chris-wilson.co.uk>
 <20190918104533.GW4019@platvala-desk.ger.corp.intel.com>
 <156880379774.5729.1411264022557053301@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156880379774.5729.1411264022557053301@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Add signal sender name when
 dying
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTE6NDk6NTdBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgUGV0cmkgTGF0dmFsYSAoMjAxOS0wOS0xOCAxMTo0NTozMykKPiA+IE9u
IFdlZCwgU2VwIDE4LCAyMDE5IGF0IDExOjM1OjE4QU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90
ZToKPiA+ID4gV2Ugd2FudCB0byBrbm93IHdobyBzZW50IHVzIHRoZSBmYXRhbCBzaWduYWwsIGZv
ciB0aGVyZSBhcmUgcGxlbnR5IG9mCj4gPiA+IGZpbmdlcnMgdG8gZ28gYXJvdW5kLgo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4gPiA+IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBydW5uZXIvZXhlY3V0b3IuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBiL3J1
bm5lci9leGVjdXRvci5jCj4gPiA+IGluZGV4IGMxY2ZjY2U4My4uZjcxODMyOTNkIDEwMDY0NAo+
ID4gPiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYwo+ID4gPiArKysgYi9ydW5uZXIvZXhlY3V0b3Iu
Ywo+ID4gPiBAQCAtNjA5LDYgKzYwOSwyNiBAQCBzdGF0aWMgYm9vbCBraWxsX2NoaWxkKGludCBz
aWcsIHBpZF90IGNoaWxkKQo+ID4gPiAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4gIH0KPiA+ID4g
IAo+ID4gPiArc3RhdGljIGNvbnN0IGNoYXIgKmdldF9jbWRsaW5lKHBpZF90IHBpZCwgY2hhciAq
YnVmLCBzaXplX3QgbGVuKQo+ID4gPiArewo+ID4gPiArICAgICBpbnQgZmQ7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgaWYgKHNucHJpbnRmKGJ1ZiwgbGVuLCAiL3Byb2MvJWQvY21kbGluZSIsIHBpZCkg
PiBsZW4pCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuICJ1bmtub3duIjsKPiA+ID4gKwo+ID4g
PiArICAgICBmZCA9IG9wZW4oYnVmLCBPX1JET05MWSk7Cj4gPiA+ICsgICAgIGlmIChmZCA8IDAp
Cj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuICJ1bmtub3duIjsKPiA+ID4gKwo+ID4gPiArICAg
ICBsZW4gPSByZWFkKGZkLCBidWYsIGxlbiAtIDEpOwo+ID4gPiArICAgICBjbG9zZShmZCk7Cj4g
PiA+ICsgICAgIGlmIChsZW4gPCAwKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiAidW5rbm93
biI7Cj4gPiA+ICsKPiA+ID4gKyAgICAgYnVmW2xlbl0gPSAnXDAnOwo+ID4gPiArICAgICByZXR1
cm4gYnVmOwo+ID4gPiArfQo+ID4gCj4gPiBBcmUgeW91IGludGVudGlvbmFsbHkgb25seSBwcmlu
dGluZyBhcmd2WzBdPyBhcmd2IGl0ZW1zIGFyZQo+ID4gXDAtc2VwYXJhdGVkIGluIC9wcm9jLyov
Y21kbGluZS4KPiAKPiBZZXMsIHdlIG9ubHkgd2FudCBhIGh1bWFuIGZyaWVuZGx5IHByb2Nlc3Mg
bmFtZSwgb3IgZG8gd2UgbmVlZCB0aGUgZnVsbAo+IGNtZGxpbmUgYmVjYXVzZSBpdCdzIGphdmE/
Pz8gSWYgaXQncyBqYXZhLCBJJ20gcnVubmluZyBhd2F5LgoKCldlbGwuLi4KCgotLSAKUGV0cmkg
TGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
