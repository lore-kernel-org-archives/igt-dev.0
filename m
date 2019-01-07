Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Jan 2019 13:28:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190107112809.GX17124@platvala-desk.ger.corp.intel.com>
References: <20190104153709.19350-1-tvrtko.ursulin@linux.intel.com>
 <20190107110125.GW17124@platvala-desk.ger.corp.intel.com>
 <ee86d31e-c39e-e854-1a40-a58cf40545d4@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee86d31e-c39e-e854-1a40-a58cf40545d4@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_shrink: Exercise OOM and
 other routes to shrinking in reasonable time
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKYW4gMDcsIDIwMTkgYXQgMTE6MTI6MzBBTSArMDAwMCwgVHZydGtvIFVyc3VsaW4g
d3JvdGU6Cj4gCj4gT24gMDcvMDEvMjAxOSAxMTowMSwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+
IE9uIEZyaSwgSmFuIDA0LCAyMDE5IGF0IDAzOjM3OjA5UE0gKzAwMDAsIFR2cnRrbyBVcnN1bGlu
IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCBi
L3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKPiA+ID4gaW5kZXggNzNkMTI3NjAzZDI4Li5k
NzZhNGIzYjFjNzEgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50
eHQKPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+ID4gPiBAQCAtNjAs
NiArNjAsNyBAQCBpZ3RAZ2VtX3Jpbmdfc3luY19jb3B5KEAuKik/Cj4gPiA+ICAgaWd0QGdlbV9y
aW5nX3N5bmNfbG9vcChALiopPwo+ID4gPiAgIGlndEBnZW1fc2Vxbm9fd3JhcChALiopPwo+ID4g
PiAgIGlndEBnZW1fc2hyaW5rQCg/IXJlY2xhaW0kKS4qCj4gPiA+ICtpZ3RAZ2VtX3Nocmlua0Ao
PyFyZWNsYWltcy1hbmQtb29tKS4qCj4gPiA+ICAgaWd0QGdlbV9zb2Z0cGluQC4qKGhhbmd8UzQp
LioKPiA+ID4gICBpZ3RAZ2VtX3NwaW5fYmF0Y2goQC4qKT8KPiA+ID4gICBpZ3RAZ2VtX3N0b2xl
bkAuKmhpYmVybmF0ZS4qCj4gPiAKPiA+IAo+ID4gSW4gY2FzZSB5b3UgZGlkbid0IG5vdGljZTog
VGhlIGZpcnN0IGdlbV9zaHJpbmsgbGluZSByZW1vdmVzIHRoZQo+ID4gcmVjbGFpbXMtYW5kLW9v
bSogc3VidGVzdHMsIGFuZCB0aGUgc2Vjb25kIGxpbmUgKHRoZSBvbmUgeW91IGFkZGVkKQo+ID4g
dGhlbiByZW1vdmVzIHRoZSAncmVjbGFpbScgc3VidGVzdCwgcmVzdWx0aW5nIGluIGFsbCBnZW1f
c2hyaW5rCj4gPiBzdWJ0ZXN0cyBibGFja2xpc3RlZC4KPiAKPiBObyBJIGhhdmVuJ3QgdGhhbmsg
eW91LiBJbnRlcmVzdGluZ2x5IHRoZSByZWNsYWltIHN1YnRlc3Qgc3RpbGwgZGlkIHJ1bi4KCmh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMjE4NS9zaGFyZHMt
YWxsLmh0bWwKaXQncyBOT1RSVU4gb24gYWxsIG1hY2hpbmVzIG9uIHBhdGNoZWQgSUdULgoKPiBP
a2F5LCBidXQgaW4gZXNzZW5jZSBzaG91bGQgdGhpcyB3b3JrIHRoZW46Cj4gCj4gICBpZ3RAZ2Vt
X3Nocmlua0AoPyFyZWNsYWltKS4qCj4gCj4gVG8gYmxhY2tsaXN0IGV2ZXJ5dGhpbmcgYXBhcnQg
ZnJvbSByZWNsYWltcyBhbmQgcmVjbGFpbXMtYW5kLW9vbS4qCj4gc3VidGVzdHM/CgpZZWFoIHRo
YXQgbG9va3MgY29ycmVjdC4KCgotLSAKUGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
