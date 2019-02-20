Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFFB891B4
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 07:34:56 +0000 (UTC)
Date: Wed, 20 Feb 2019 09:34:53 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190220073453.5noj2vslxyhpmifa@ahiler-desk1.fi.intel.com>
References: <20190219132543.31786-1-arkadiusz.hiler@intel.com>
 <20190219132543.31786-3-arkadiusz.hiler@intel.com>
 <20190219142332.dgf5lajneohb7ed6@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219142332.dgf5lajneohb7ed6@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests: Prefix pm_ tests with i915_
 and move them to i915/
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDQ6MjM6MzJQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDE5LCAyMDE5IGF0IDAzOjI1OjQzUE0gKzAyMDAsIEFya2Fk
aXVzeiBIaWxlciB3cm90ZToKPiA+IFRoZXkgYXJlIGk5MTUtc3BlY2lmaWMsIHNvIHRoZXkgYmVs
b25nIHRvIHRoZSBkaXJlY3RvcnkuCj4gPiBUaGUgKG5vdykgaW5maXggX3BtXyBpcyBxdWl0ZSBp
bmZvcm1hdGl2ZSBhbmQgd29ydGgga2VlcGluZy4KPiA+IAo+ID4gdjI6IGFsc28gcHJlZml4IC5j
IGZpbGVzCj4gPiAKPiA+IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNv
bT4KPiA+IENjOiBFd2VsaW5hIE11c2lhbCA8ZXdlbGluYS5tdXNpYWxAaW50ZWwuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29t
Pgo+ID4gLS0tCj4gPiBBY2tzL3JicyBhcHByZWNpYXRlZCwgYnV0IHBsZWFzZSBsZXQgbWUgcHVz
aCBpdCwgYXMgSSBoYXZlIHRvIGRvCj4gPiByZW5hbWluZyBpbiB0aGUgY2lidWdsb2cgZmlyc3Qg
Oi0pCj4gCj4gSSBmb3Jnb3QgdG8gc3RhZ2UgdGhpcyBjaGFuZ2U6Cj4gCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgYi90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3Qu
dHh0Cj4gaW5kZXggZjlhZDQ3ZWEuLmYzNDQwZjMxIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVs
LWNpL2JsYWNrbGlzdC50eHQKPiArKysgYi90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4g
QEAgLTEzLDcgKzEzLDcgQEAgaWd0QGRybV9tbShALiopPwo+ICAjIGZhaWx1cmVzIGluIHRlc3Rz
IHJ1biBhZnRlcndhcmRzLgo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICBpZ3RAaTkxNV9tb2R1bGVfbG9hZChALiopPwo+IC1pZ3RAcG1fcnBtQG1v
ZHVsZS1yZWxvYWQKPiAraWd0QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQKPiAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIyBHRU0KPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBs
aXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKCkFuZCBwdXNoZWQgd2l0aCBQZXRy
aSdzIHItYnMgdmlhIElSQy4gVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
