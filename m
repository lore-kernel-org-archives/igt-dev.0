Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <155006688232.2264.2955984791588395728@skylake-alporthouse-com>
References: <20190213093137.22678-1-guillaume.tucker@collabora.com>
 <155006688232.2264.2955984791588395728@skylake-alporthouse-com>
Message-ID: <155006713596.2264.18295352705531932239@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 14:12:16 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_sseu: Fix
 32-bit build
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, kernel@collabora.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDItMTMgMTQ6MDg6MDIpCj4gUXVvdGluZyBHdWls
bGF1bWUgVHVja2VyICgyMDE5LTAyLTEzIDA5OjMxOjM3KQo+ID4gVGhpcyBmaXhlcyBhIGNvbXBp
bGVyIHdhcm5pbmcgdHJlYXRlZCBhcyBhbiBlcnJvciB3aGVuIGJ1aWxkaW5nIGZvcgo+ID4gMzIt
Yml0IGFyY2hpdGVjdHVyZXMgc2luY2UgdGhlaXIgcG9pbnRlciBzaXplIGRvZXMgbm90IG1hdGNo
IHRoZSBzaXplCj4gPiBvZiBkcm1faTkxNV9nZW1fY29udGV4dF9wYXJhbS52YWx1ZSB3aGljaCBp
cyA2NCBiaXRzOgo+ID4gCj4gPiAgIENDICAgICAgIGk5MTUvZ2VtX2N0eF9zc2V1Lm8KPiA+ICAg
aTkxNS9nZW1fY3R4X3NzZXUuYzogSW4gZnVuY3Rpb24g4oCYdGVzdF9nZ3R0X2FyZ3PigJk6Cj4g
PiAgIGk5MTUvZ2VtX2N0eF9zc2V1LmM6Mzg0Ojk6IGVycm9yOiBjYXN0IHRvIHBvaW50ZXIgZnJv
bSBpbnRlZ2VyIG9mIGRpZmZlcmVudCBzaXplIFstV2Vycm9yPWludC10by1wb2ludGVyLWNhc3Rd
Cj4gPiAgICAgbXVubWFwKCh2b2lkICopYXJnLnZhbHVlLCA0MDk2KTsKPiA+IAo+ID4gSXQgd2Fz
IGZvdW5kIHdoaWxlIGJ1aWxkaW5nIGZvciBhcm0gd2l0aCBnY2MgNi4zLjAgYW5kIEkgc3VzcGVj
dCB0aGUKPiA+IHNhbWUgcHJvYmxlbSB3b3VsZCBhcmlzZSBmb3IgaTM4NiBvciBvdGhlciAzMi1i
aXQgYXJjaGl0ZWN0dXJlcy4gIFRoZQo+ID4gdWludHB0cl90IHR5cGUgaXMgYnkgZGVmaW5pdGlv
biBhbiB1bnNpZ25lZCBpbnRlZ2VyIG9mIHRoZSBzYW1lIGxlbmd0aAo+ID4gYXMgYSBwb2ludGVy
IG9uIGEgZ2l2ZW4gYXJjaGl0ZWN0dXJlLCBzbyB0aGlzIHNob3VsZCBmaXggdGhlIHByb2JsZW0K
PiA+IGZvciBhbGwgYXJjaGl0ZWN0dXJlcyB1cCB0byA2NCBiaXRzLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdWlsbGF1bWUgVHVja2VyIDxndWlsbGF1bWUudHVja2VyQGNvbGxhYm9yYS5jb20+
Cj4gCj4gQXQgc29tZSBwb2ludCwgd2Ugc2hvdWxkIHNhdmUgb3VyIGV5ZXNpZ2h0IGFuZCBkbyB1
NjRfdG9fcG9pbnRlcigpLgo+IFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KCkFuZCBwdXNoZWQsIGhhdmluZyBmb3Jnb3R0ZW4gSSB3YXNuJ3QgdXNp
bmcgZGltIGFuZCBmb3Jnb3QgdG8gYXV0by1zb2IuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
