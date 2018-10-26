Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138C36E3FC
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 07:30:55 +0000 (UTC)
Date: Fri, 26 Oct 2018 10:30:51 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181026073051.vhqmlnbxn6nhucqs@ahiler-desk1.fi.intel.com>
References: <20181025130840.18391-1-arkadiusz.hiler@intel.com>
 <20181025134436.20577-1-arkadiusz.hiler@intel.com>
 <154047937344.1447.8781171157874481580@skylake-alporthouse-com>
 <20181026072138.g5y2qu4cbdynmjpc@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181026072138.g5y2qu4cbdynmjpc@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests: Move drv_ tests to i915
 directory
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
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjYsIDIwMTggYXQgMTA6MjE6MzhBTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDI1LCAyMDE4IGF0IDAzOjU2OjEzUE0gKzAxMDAsIENocmlz
IFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQXJrYWRpdXN6IEhpbGVyICgyMDE4LTEwLTI1IDE0
OjQ0OjM2KQo+ID4gPiBUaGUgZHJ2XyB0ZXN0cyBhcmUgaTkxNSBzcGVjaWZpYywgc28gbGV0J3Mg
bW92ZSB0aGVtIHRvIGk5MTUgZGlyZWN0b3J5Cj4gPiA+IGFuZCBjaGFuZ2UgdGhlIGJpbmFyeSBw
cmVmaXggdG8gaTkxNV8uCj4gPiA+IAo+ID4gPiBBZGRpdGlvbmFsbHksIHdoaWxlIHdlIGF0IG1v
dmluZyBzdHVmZiBhcm91bmQsIGxldCdzIHJlbmFtZQo+ID4gPiBtb2R1bGVfcmVsb2FkIHRvIG1v
ZHVsZV9sb2FkIGFuZCBkbyB0aGUgZm9sbG93aW5nIGNsZWFudXAgd2l0aCB0aGUKPiA+ID4gc3Vi
dGVzdHM6Cj4gPiA+IAo+ID4gPiAgIGJhc2ljLXJlbG9hZCAgICAgICAgLT4gcmVsb2FkCj4gPiA+
ICAgYmFzaWMtbm8tZGlzcGxheSAgICAtPiByZWxvYWQtbm8tZGlzcGxheQo+ID4gPiAgIGJhc2lj
LXJlbG9hZC1pbmplY3QgLT4gcmVsb2FkLXdpdGgtZmF1bHQtaW5qZWN0aW9uCj4gPiAKPiA+IExn
dG0sCj4gPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4gPiAgCj4gPiA+IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRl
bC5jb20+Cj4gPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiA+ID4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+
Cj4gPiAKPiA+IE9uZSBvZiB0aGUgb3RoZXJzIHJlcXVpcmVkIHRvIGFncmVlIHRvIHRoZSBuYW1l
IGNoYW5nZSBmb3IgQ0kuIFRoZXJlJ3MKPiA+IHNvbWUgYWN0aXZlIGJ1Z3MgaW4gdGhpcyBhcmVh
LCB3aWxsIHRoYXQgYmUgYSBudWlzYW5jZT8KPiA+IC1DaHJpcwo+IAo+IFRoYXQncyBleGFjdGVs
eSB3aHkgTWFydGluIGlzIGNjZWQuIEhlIGlzIG1hbmFnaW5nIHRoZSBmaWx0ZXJzIGZvciBDSQo+
IGJ1Z3MsIGFuZCBoZSBoYXMgdG8gYWRqdXN0IHRoZW0gZmlyc3QsIHNvIHdlIHdvbid0IGluY3Jl
YXNlIG5vaXNlIGZvcgo+IG90aGVycy4gSSdsbCBtZXJnZSB0aGlzIHBhdGNoIG9uY2Ugd2UgaGF2
ZSBoaXMgYWNrLgo+IC1BcmVrCgpPaCwgYW5kIHdlIGFyZSBhbHNvIG1vdmluZyBpOTE1IHNlbGZ0
ZXN0cy4gVGhhdCByZXF1aXJlcyBzb21lIENJIGNoYW5nZWQKYnkgUGV0cmkvVG9taS4KLUFyZWsK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
