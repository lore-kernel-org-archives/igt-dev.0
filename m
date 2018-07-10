Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180710143826.GC16900@ahiler-mobl1.fi.intel.com>
References: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
 <fcdf5cfd9ed825fd090696a8014131cd249d2ed4.1531005542.git.rodrigosiqueiramelo@gmail.com>
 <20180710135849.GA16900@ahiler-mobl1.fi.intel.com>
 <153123176511.18500.17409073615916970828@skylake-alporthouse-com>
 <20180710143826.GC16900@ahiler-mobl1.fi.intel.com>
Message-ID: <153123379324.18500.14432038356207996828@skylake-alporthouse-com>
Date: Tue, 10 Jul 2018 15:43:23 +0100
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDctMTAgMTU6Mzg6MjYpCj4gT24gVHVlLCBK
dWwgMTAsIDIwMTggYXQgMDM6MDk6MjVQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDctMTAgMTQ6NTg6NDkpCj4gPiA+IE9uIFNh
dCwgSnVsIDA3LCAyMDE4IGF0IDA4OjIyOjM4UE0gLTAzMDAsIFJvZHJpZ28gU2lxdWVpcmEgd3Jv
dGU6Cj4gPiA+ID4gVGhpcyBjb21taXQgZml4ZXMgdGhlIEdDQyB3YXJuaW5nOgo+ID4gPiA+IAo+
ID4gPiA+IHdhcm5pbmc6IHBvaW50ZXIgb2YgdHlwZSDigJh2b2lkICrigJkgdXNlZCBpbiBhcml0
aG1ldGljIFstV3BvaW50ZXItYXJpdGhdCj4gPiA+ID4gICAgICBtZW1zZXQocHRyICsgb2Zmc2V0
c1swXSwgZnVsbF9yYW5nZSA/IDB4MDAgOiAweDEwLAo+ID4gPiA+ICAgICAgICAgICAgICAgICBe
Cj4gPiA+ID4gd2FybmluZzogcG9pbnRlciBvZiB0eXBlIOKAmHZvaWQgKuKAmSB1c2VkIGluIGFy
aXRobWV0aWMgWy1XcG9pbnRlci1hcml0aF0KPiA+ID4gPiAgICAgIG1lbXNldChwdHIgKyBvZmZz
ZXRzWzFdLCAweDgwLAo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgY29tbWl0IGNhc3QgdGhlIHB0ciBw
b2ludGVyLCB3aGljaCBpcyBhIHZvaWQgKiwgdG8gdWludDMyX3QgKiBpbgo+ID4gPiA+IHRoZSBw
b2ludGVyIGFyaXRobWV0aWMgb3BlcmF0aW9uLgo+ID4gPiAKPiA+ID4gVGhpcyB3aWxsIGNoYW5n
ZSBzZW1hbnRpY3MsIGFzIGFjY29yZGluZyB0byBHTlUgQyBzdGFuZGFyZFsxXSwgdm9pZAo+ID4g
PiBwb2ludGVycyBoYXZlIGEgc2l6ZSBvZiAxIGZvciBhbGwgYXJpdGhtZXRpY2FsIHB1cnBvc2Vz
Lgo+ID4gPiAKPiA+ID4gU28geW91IHNob3VsZCBiZSB1c2luZyB1aW50OF90IChvciBjaGFyKSBw
b2ludGVyIGluc3RlYWQuCj4gPiAKPiA+IFBsZWFzZSBqdXN0IGZpeCB0aGUgY29tcGlsZXIgZmxh
Z3MsIHdlIHdhbnQgY2xvc2UgY29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+ID4ga2VybmVsIGNvZGlu
ZyBzdGFuZGFyZHMgd2hpY2ggZXhwbGljaXRseSBhbGxvdyB2b2lkIGFyaXRobWV0aWMgZm9yIHRo
ZQo+ID4gc2ltcGxpY2l0eSBpdCBsZW5kcyB0byB3cml0aW5nIGNvZGUuCj4gPiAtQ2hyaXMKPiAK
PiBGYWlyIHBvaW50Lgo+IAo+IFdlIGRvbid0IHJpc2UgdGhlIGVycm9yIHdpdGggbWVzb24sIHNv
IGl0IGlzIG5vdCBhIGNoYW5nZSBpbiB0aGUgZ2NjCj4gZGVmYXVsdHMuIFNvbWVob3cgYXV0b3Rv
b2xzIG1hbmFnZSB0byBlbmQgdXAgYWRkaW5nIC1XcG9pbnRlci1hcml0aCB0bwo+IEJBU0VfQ0ZM
QUdTLgoKaWlyYywgaXQncyBwdWxsZWQgaW4gZnJvbSB4b3JnLW1hY3Jvcy4gTWF5YmUganVzdCB0
YWNrIGEKLVdub3BvaW50ZXItYXJpdGggb250byB0aGUgZW5kLCBvciBzZWQgYXdheS4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdm
eCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
