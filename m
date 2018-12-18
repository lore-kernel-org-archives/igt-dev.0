Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14D76EBCB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Dec 2018 13:33:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g22so7836372edr.7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Dec 2018 05:33:06 -0800 (PST)
Date: Tue, 18 Dec 2018 14:33:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181218133302.GM21184@phenom.ffwll.local>
References: <20180905203827.n7vpugbs6bjvijpg@smtp.gmail.com>
 <20181217154930.GH21184@phenom.ffwll.local>
 <CAKi4VALZd18PghT8=xcMw9BLG4-5RM2+dKdaTECjG4BdrvmjZg@mail.gmail.com>
 <20181218120821.GT17124@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181218120821.GT17124@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] Add support for forcing specific
 module
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
To: Lucas De Marchi <lucas.de.marchi@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, igt-dev@lists.freedesktop.org, "Gustavo F. Padovan" <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBEZWMgMTgsIDIwMTggYXQgMDI6MDg6MjFQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBNb24sIERlYyAxNywgMjAxOCBhdCAwOToyMjozMUFNIC0wODAwLCBMdWNhcyBE
ZSBNYXJjaGkgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAxNywgMjAxOCBhdCA3OjQ5IEFNIERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgU2Vw
IDA1LCAyMDE4IGF0IDA1OjM4OjI3UE0gLTAzMDAsIFJvZHJpZ28gU2lxdWVpcmEgd3JvdGU6Cj4g
PiA+ID4gVGhpcyBjb21taXQgYWRkcyBhIG5ldyBvcHRpb24gZm9yIGZvcmNpbmcgdGhlIHVzZSBv
ZiBhIHNwZWNpZmljIGRyaXZlcgo+ID4gPiA+IGluZGljYXRlZCB2aWEgYW4gZW52aXJvbm1lbnQg
dmFyaWFibGUuCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIFYxOgo+ID4gPiA+ICBQZXRy
aToKPiA+ID4gPiAgLSBVc2UgYW4gZW52aXJvbm1lbnQgdmFyaWFibGUgaW5zdGVhZCBvZiBjb21t
YW5kIGxpbmUKPiA+ID4gPiAgLSBSZWZhY3RvciB0aGUgbG9vcCBpbiBfX3NlYXJjaF9hbmRfb3Bl
biB0byBhY2NlcHQgZm9yY2VkIG1vZHVsZQo+ID4gPiA+ICAtIERvbid0IHRyeSB0byBsb2FkIGtl
cm5lbCBtb2R1bGVzCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFNpcXVl
aXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gTm90ZTogWW91
IGNhbid0IGRyb3AgdGhlIHMtby1iIGxpbmUgaWYgeW91ciBwYXRjaCBjb250YWlucyB3b3JrIGJ5
IG90aGVyCj4gPiA+IHBlb3BsZSwgbGlrZSBmcm9tIFBldHJpIGhlcmUuIFByb3BlciB3YXkgdG8g
cmVzZW5kIGEgcGF0Y2ggYnkgc29tZW9uZSBlbHNlCj4gPiA+IGlzIHRvIGp1c3QgYWRkIGEgc3Vi
amVjdCBwcmVmaXggb2YgIlBBVENIIFJFU0VORCIgYW5kIG90aGVyd2lzZSBrZWVwCj4gPiA+IGV2
ZXJ5dGhpbmcgdW5jaGFuZ2VkIChpbmNsdWRpbmcgYXV0aG9yIGFuZCBldmVyeXRoaW5nKS4KPiA+
ID4KPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI0NTUzMi8K
PiA+IAo+ID4gTGFzdCB0aW1lIEkgd2FzIHRvbGQgSSBoYXZlIHRvIF9hZGRfIG15IHMtby1iIG5v
bmV0aGVsZXNzLCBldmVuIGlmCj4gPiBqdXN0IHJlLXNlbmRpbmcgdGhlIHBhdGNoLgo+ID4gSSBk
b24ndCB0aGluayBJIHNob3VsZCwgYnV0IGluIHRoZSBlbmQgSSBoYWQgdG8gY2hhbmdlIHRoZSBz
ZXJpZXMsIGFkZAo+ID4gYW5kIGNoYW5nZSBwYXRjaGVzLAo+ID4gc28gaXQgZGlkbid0IG1hdHRl
ci4KPiAKPiAKPiBDb21tdW5pY2F0aW9uIGVycm9yIGhlcmU/IFJvZHJpZ28ncyByZXNlbmQgZGlk
bid0IGhhdmUgbXkgUy1vLWIsCj4gdGhhdCdzIHdoYXQgRGFuaWVsIHdhcyBwb2ludGluZyBhdC4g
UmVtb3ZpbmcgUy1vLWIgaXMgbmV2ZXIKPiBvay4gV2hldGhlciBpdCdzIGNvcnJlY3QgYW5kL29y
IHJlcXVpcmVkIHRvIGFkZCB5b3VyIG93biBTLW8tYiB0bwo+IHJlc2VuZHMgaXMgYW5vdGhlciBt
YXR0ZXIuCgpDb3JyZWN0LgoKPiA+IE1heWJlIHdlIG5lZWQgc29tZSBjbGFyaWZpY2F0aW9uIG9u
IHRoaXM/Cj4gPiAKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2lu
dGVsLWdmeC8yMDE4LU5vdmVtYmVyLzE4MzI5MS5odG1sCj4gCj4gVGhhdCB3YXMgYWJvdXQgYSBr
ZXJuZWwgcGF0Y2gsIGFuZCBrZXJuZWwgcGF0Y2hlcyBhcmUgX3ZlcnlfIHN0cmljdAo+IGFib3V0
IGhhdmluZyB0byBhZGQgeW91ciBTLW8tYi4KClllcywgZm9yIHRoZSBrZXJuZWwgZXZlbiBqdXN0
IHNlbmRpbmcgYSBwYXRjaCBhcm91bmQgYnkgc29tZW9uZSwgZXZlbiBpZgp5b3UgY2hhbmdlIG5v
dGhpbmcsIG5lZWRzIHlvdXIgc29iLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
