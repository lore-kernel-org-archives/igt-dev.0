Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730D6E3FA
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 07:21:43 +0000 (UTC)
Date: Fri, 26 Oct 2018 10:21:38 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181026072138.g5y2qu4cbdynmjpc@ahiler-desk1.fi.intel.com>
References: <20181025130840.18391-1-arkadiusz.hiler@intel.com>
 <20181025134436.20577-1-arkadiusz.hiler@intel.com>
 <154047937344.1447.8781171157874481580@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <154047937344.1447.8781171157874481580@skylake-alporthouse-com>
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjUsIDIwMTggYXQgMDM6NTY6MTNQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQXJrYWRpdXN6IEhpbGVyICgyMDE4LTEwLTI1IDE0OjQ0OjM2KQo+ID4g
VGhlIGRydl8gdGVzdHMgYXJlIGk5MTUgc3BlY2lmaWMsIHNvIGxldCdzIG1vdmUgdGhlbSB0byBp
OTE1IGRpcmVjdG9yeQo+ID4gYW5kIGNoYW5nZSB0aGUgYmluYXJ5IHByZWZpeCB0byBpOTE1Xy4K
PiA+IAo+ID4gQWRkaXRpb25hbGx5LCB3aGlsZSB3ZSBhdCBtb3Zpbmcgc3R1ZmYgYXJvdW5kLCBs
ZXQncyByZW5hbWUKPiA+IG1vZHVsZV9yZWxvYWQgdG8gbW9kdWxlX2xvYWQgYW5kIGRvIHRoZSBm
b2xsb3dpbmcgY2xlYW51cCB3aXRoIHRoZQo+ID4gc3VidGVzdHM6Cj4gPiAKPiA+ICAgYmFzaWMt
cmVsb2FkICAgICAgICAtPiByZWxvYWQKPiA+ICAgYmFzaWMtbm8tZGlzcGxheSAgICAtPiByZWxv
YWQtbm8tZGlzcGxheQo+ID4gICBiYXNpYy1yZWxvYWQtaW5qZWN0IC0+IHJlbG9hZC13aXRoLWZh
dWx0LWluamVjdGlvbgo+IAo+IExndG0sCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ICAKPiA+IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5w
ZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBp
bnRlbC5jb20+Cj4gCj4gT25lIG9mIHRoZSBvdGhlcnMgcmVxdWlyZWQgdG8gYWdyZWUgdG8gdGhl
IG5hbWUgY2hhbmdlIGZvciBDSS4gVGhlcmUncwo+IHNvbWUgYWN0aXZlIGJ1Z3MgaW4gdGhpcyBh
cmVhLCB3aWxsIHRoYXQgYmUgYSBudWlzYW5jZT8KPiAtQ2hyaXMKClRoYXQncyBleGFjdGVseSB3
aHkgTWFydGluIGlzIGNjZWQuIEhlIGlzIG1hbmFnaW5nIHRoZSBmaWx0ZXJzIGZvciBDSQpidWdz
LCBhbmQgaGUgaGFzIHRvIGFkanVzdCB0aGVtIGZpcnN0LCBzbyB3ZSB3b24ndCBpbmNyZWFzZSBu
b2lzZSBmb3IKb3RoZXJzLiBJJ2xsIG1lcmdlIHRoaXMgcGF0Y2ggb25jZSB3ZSBoYXZlIGhpcyBh
Y2suCi1BcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
