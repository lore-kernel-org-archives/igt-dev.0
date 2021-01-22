Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486C66E9C4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jan 2021 09:21:38 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <9c63a44099fd43c384ffff66eb2a7b47@intel.com>
References: <20210121055221.29341-1-ashutosh.dixit@intel.com>
 <161121438323.14015.10231318935036818450@emeril.freedesktop.org>
 <871ree3d3v.wl-ashutosh.dixit@intel.com>
 <9c63a44099fd43c384ffff66eb2a7b47@intel.com>
Subject: Re: [igt-dev]  =?unknown-8bit?b?4pyX?= Fi.CI.IGT: failure for lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev15)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 22 Jan 2021 09:21:34 +0000
Message-ID: <161130729451.28599.8087490368933933202@build.alporthouse.com>
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWdWR1bSwgTGFrc2htaW5hcmF5YW5hICgyMDIxLTAxLTIyIDAzOjE0OjQyKQo+IFJl
LXJlcG9ydGVkLgo+IAo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRGl4aXQs
IEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+IAo+IFNlbnQ6IFRodXJzZGF5LCBK
YW51YXJ5IDIxLCAyMDIxIDEyOjMyIEFNCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IFZ1ZHVtLCBMYWtzaG1pbmFyYXlhbmEgPGxha3NobWluYXJheWFuYS52dWR1bUBp
bnRlbC5jb20+Cj4gU3ViamVjdDogUmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGxpYi9p
b2N0bF93cmFwcGVyczogSGFuZGxlIFBSRUFEL1BXUklURSBpb2N0bHMgbm90IHN1cHBvcnRlZCBp
biBnZW1fcmVhZC93cml0ZSAocmV2MTUpCj4gCj4gT24gV2VkLCAyMCBKYW4gMjAyMSAyMzozMzow
MyAtMDgwMCwgUGF0Y2h3b3JrIHdyb3RlOgo+ID4KPiA+IFBhdGNoIERldGFpbHMKPiA+Cj4gPiAg
U2VyaWVzOiAgbGliL2lvY3RsX3dyYXBwZXJzOiBIYW5kbGUgUFJFQUQvUFdSSVRFIGlvY3RscyBu
b3Qgc3VwcG9ydGVkIAo+ID4gaW4gZ2VtX3JlYWQvd3JpdGUgKHJldjE1KQo+ID4gIFVSTDogIGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODExNTIvCj4gPiAgU3RhdGU6
ICBmYWlsdXJlCj4gPiAgRGV0YWlsczogIAo+ID4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV181NDExL2luZGV4Lmh0bWwKPiA+Cj4gPiBDSSBCdWcgTG9nIC0g
Y2hhbmdlcyBmcm9tIElHVF81OTYxX2Z1bGwgLT4gSUdUUFdfNTQxMV9mdWxsCj4gPgo+ID4gU3Vt
bWFyeQo+ID4KPiA+IEZBSUxVUkUKPiA+Cj4gPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21p
bmcgd2l0aCBJR1RQV181NDExX2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIAo+ID4gYmUgdmVyaWZp
ZWQgbWFudWFsbHkuCj4gPgo+ID4gSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhh
dmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzIAo+ID4gaW50cm9kdWNlZCBpbiBJR1RQ
V181NDExX2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSB0byBhbGxvdyAKPiA+IHRo
ZW0gdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBm
YWxzZSBwb3NpdGl2ZXMgaW4gQ0kuCj4gPgo+ID4gRXh0ZXJuYWwgVVJMOiAKPiA+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfNTQxMS9pbmRleC5odG1sCj4g
Pgo+ID4gUG9zc2libGUgbmV3IGlzc3Vlcwo+ID4KPiA+IEhlcmUgYXJlIHRoZSB1bmtub3duIGNo
YW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfNTQxMV9mdWxsOgo+
ID4KPiA+IElHVCBjaGFuZ2VzCj4gPgo+ID4gUG9zc2libGUgcmVncmVzc2lvbnMKPiA+Cj4gPiAq
IGlndEBnZW43X2V4ZWNfcGFyc2VAYmFzaWMtYWxsb2NhdGlvbjoKPiA+Cj4gPiAgKiBzaGFyZC1o
c3c6IFBBU1MgLT4gVElNRU9VVAo+IAo+IFNpbmNlIHRoaXMgaXMgYW4gSUdUIHBhdGNoIGl0IHNo
b3VsZCBub3QgY2F1c2UgdGhpcyBmYWlsdXJlIHdoaWNoIGlzIGFsc28gYWNjb21wYW5pZWQgYnkg
YSBrZXJuZWwgdHJhY2UuIFRoZXJlZm9yZSB0aGlzIGFsc28gbG9va3MgbGlrZSBhIGZhbHNlIHBv
c2l0aXZlLiBUaGFua3MuCgpXcm9uZy4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
