Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180710135849.GA16900@ahiler-mobl1.fi.intel.com>
References: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
 <fcdf5cfd9ed825fd090696a8014131cd249d2ed4.1531005542.git.rodrigosiqueiramelo@gmail.com>
 <20180710135849.GA16900@ahiler-mobl1.fi.intel.com>
Message-ID: <153123176511.18500.17409073615916970828@skylake-alporthouse-com>
Date: Tue, 10 Jul 2018 15:09:25 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/7] Cast void * pointer
 used in arithmetic to uint32_t*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDctMTAgMTQ6NTg6NDkpCj4gT24gU2F0LCBK
dWwgMDcsIDIwMTggYXQgMDg6MjI6MzhQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWlyYSB3cm90ZToK
PiA+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBHQ0Mgd2FybmluZzoKPiA+IAo+ID4gd2FybmluZzog
cG9pbnRlciBvZiB0eXBlIOKAmHZvaWQgKuKAmSB1c2VkIGluIGFyaXRobWV0aWMgWy1XcG9pbnRl
ci1hcml0aF0KPiA+ICAgICAgbWVtc2V0KHB0ciArIG9mZnNldHNbMF0sIGZ1bGxfcmFuZ2UgPyAw
eDAwIDogMHgxMCwKPiA+ICAgICAgICAgICAgICAgICBeCj4gPiB3YXJuaW5nOiBwb2ludGVyIG9m
IHR5cGUg4oCYdm9pZCAq4oCZIHVzZWQgaW4gYXJpdGhtZXRpYyBbLVdwb2ludGVyLWFyaXRoXQo+
ID4gICAgICBtZW1zZXQocHRyICsgb2Zmc2V0c1sxXSwgMHg4MCwKPiA+IAo+ID4gVGhpcyBjb21t
aXQgY2FzdCB0aGUgcHRyIHBvaW50ZXIsIHdoaWNoIGlzIGEgdm9pZCAqLCB0byB1aW50MzJfdCAq
IGluCj4gPiB0aGUgcG9pbnRlciBhcml0aG1ldGljIG9wZXJhdGlvbi4KPiAKPiBUaGlzIHdpbGwg
Y2hhbmdlIHNlbWFudGljcywgYXMgYWNjb3JkaW5nIHRvIEdOVSBDIHN0YW5kYXJkWzFdLCB2b2lk
Cj4gcG9pbnRlcnMgaGF2ZSBhIHNpemUgb2YgMSBmb3IgYWxsIGFyaXRobWV0aWNhbCBwdXJwb3Nl
cy4KPiAKPiBTbyB5b3Ugc2hvdWxkIGJlIHVzaW5nIHVpbnQ4X3QgKG9yIGNoYXIpIHBvaW50ZXIg
aW5zdGVhZC4KClBsZWFzZSBqdXN0IGZpeCB0aGUgY29tcGlsZXIgZmxhZ3MsIHdlIHdhbnQgY2xv
c2UgY29tcGF0aWJpbGl0eSB3aXRoIHRoZQprZXJuZWwgY29kaW5nIHN0YW5kYXJkcyB3aGljaCBl
eHBsaWNpdGx5IGFsbG93IHZvaWQgYXJpdGhtZXRpYyBmb3IgdGhlCnNpbXBsaWNpdHkgaXQgbGVu
ZHMgdG8gd3JpdGluZyBjb2RlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4Cg==
