Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30C36E2F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Apr 2018 23:33:48 +0000 (UTC)
Message-ID: <1524527912.24461.2.camel@dk-H97M-D3H>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Mon, 23 Apr 2018 16:58:32 -0700
In-Reply-To: <20180423230650.GC27583@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-20-dhinakaran.pandiyan@intel.com>
 <20180411084259.uxn2ub6op7jueeni@platvala-desk.ger.corp.intel.com>
 <C56C55B681623645A065C9EE352337D619C2F28A@ORSMSX109.amr.corp.intel.com>
 <20180413091600.twtum2yil7jvqlsu@platvala-desk.ger.corp.intel.com>
 <1523754820.2453.22.camel@dk-H97M-D3H> <20180423230650.GC27583@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 20/20] tests/psr: Add more PSR subtests
 to fast feedback list
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

CgoKT24gTW9uLCAyMDE4LTA0LTIzIGF0IDE2OjA2IC0wNzAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6
Cj4gT24gU2F0LCBBcHIgMTQsIDIwMTggYXQgMDY6MTM6NDBQTSAtMDcwMCwgRGhpbmFrYXJhbiBQ
YW5kaXlhbiB3cm90ZToKPiA+IAo+ID4gT24gRnJpLCAyMDE4LTA0LTEzIGF0IDEyOjE2ICswMzAw
LCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEFwciAxMSwgMjAxOCBhdCAwNzox
NDozNlBNICswMzAwLCBQYW5kaXlhbiwgRGhpbmFrYXJhbiB3cm90ZToKPiA+ID4gPiBZZWFoLCB0
aGF0IGlzIGV4cGVjdGVkLiBUaGUga2VybmVsIHBhdGNoZXMgYXJlIG5vdCBpbiB5ZXQuCj4gPiA+
IAo+ID4gPiBUaGUgcmVxdWlyZW1lbnQgZm9yIHVzaW5nIC0tc2luay1jcmMgaXMgZ29pbmcgYXdh
eSB3aGVuIGtlcm5lbCBzaWRlCj4gPiA+IHBhdGNoZXMgbGFuZD8gT3IgaG93IGlzIHRoaXMgcGxh
bm5lZD8KPiA+ID4gCj4gPiBJcnJlc3BlY3RpdmUgb2Ygd2hldGhlciBvciB3aGVuIHRoZSBrZXJu
ZWwgcGF0Y2hlcyBsYW5kLCAtLXNpbmstY3JjIHdpbGwKPiA+IG5vdCBiZSB1c2VkIGZvciBDSS4g
LS1zaW5rLWNyYyBpcyBiZWluZyByZXRhaW5lZCBmb3IgZGV2ZWxvcGVycyB0bwo+ID4gbWFudWFs
bHkgdXNlIGl0IGZvciBkZWJ1ZyBhbmQgcG9zc2libHkgZml4IHRoZSBjb2RlIGluIGZ1dHVyZS4K
PiA+IAo+ID4gSGF2aW5nIHNhaWQgdGhhdCwgdGhlIGtlcm5lbCBwYXRjaGVzIGFkZGluZyB0aW1l
IHN0YW1wIHN1cHBvcnQgc2hvdWxkCj4gPiBsYW5kIHNvb24sIGFmdGVyIHdoaWNoIHRoZSB0ZXN0
cyB3aWxsIG5vdCBza2lwLgo+IAo+IE9rLCBJIGZpbmFsbHkgbG9va2VkIHRvIGFsbCBwYXRjaGVz
IG9uIHRoaXMgc2VyaWVzIGFuZCBJIHN1cHBvcnQgYWxsIG9mIHRoZW0uCj4gCj4gTXkgb25seSBj
b25jZXJuIGlzIGFjdHVhbGx5IHdpdGggcGF0Y2ggMTQgdGhhdCBpcyBhcm91bmQgdGhpcyBkaXNj
dXNzaW9uIGhlcmUuLi4KPiAKPiBGb3IgbWUgaXQgc2VlbXMgdGhhdCBvciB5b3UgcnVuIHdpdGgg
aW50ZXJhY3RpdmUgZGVidWcgb24gb3Igd2l0aCBzaW5rX2NyYwo+IGFuZCBDSSBpcyBub3QgcnVu
bmluZyB3aXRoIGFueSBzbyBpdCB3aWxsIGFsbCBza2lwLgo+IAo+IFVubGVzcyBJIG1pc3N1bmRl
cnN0b29kIHNvbWV0aGluZyBvbiB0aGF0IHBhdGNoLi4uCj4gCj4gSWYgQ0kgc3RpbGwgcnVucyB3
aXRob3V0IHJlcXVpcmluZyBhbnkgZXh0cmEgb3B0aW9uIEknbSBpbiBmYXZvciBvZiB0aGUgd2hv
bGUgc2VyaWVzCj4gYW5kIEknbSB0ZW5kaW5nIHRvIG1lcmdlIGl0IHNvb24uLi4KPiAKCkNJIHdp
bGwgbm90IG5lZWQgYW55IG9wdGlvbnMuIFRpbWVzdGFtcHMgYXJlIHN1cHBvcnRlZCBieSBkZWZh
dWx0IG9uIGFsbApwbGF0Zm9ybXMgZXhjZXB0IENIVi9WTFYuIFdlIGRvbid0IGhhdmUgdGhvc2Ug
cGxhdGZvcm1zIGluIENJIGFuZCBJIGFtCnBsYW5uaW5nIHRvIG51a2UgUFNSIHN1cHBvcnQgZm9y
IHRoZW0uCgoKPiBUaGFua3MsCj4gUm9kcmlnby4KPiAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
