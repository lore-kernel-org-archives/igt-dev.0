Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A9F6E850
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 08:52:50 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190403084608.GW2665@phenom.ffwll.local>
References: <20190403002012.24691-1-jose.souza@intel.com>
 <155427524355.24691.15103983580795112572@skylake-alporthouse-com>
 <20190403084009.GU2665@phenom.ffwll.local>
 <155428092364.24691.7423128471320073691@skylake-alporthouse-com>
 <20190403084608.GW2665@phenom.ffwll.local>
Message-ID: <155428155939.24691.2865476149282050992@skylake-alporthouse-com>
Date: Wed, 03 Apr 2019 09:52:39 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Remove i915_missed_irq
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA0LTAzIDA5OjQ2OjA4KQo+IE9uIFdlZCwgQXBy
IDAzLCAyMDE5IGF0IDA5OjQyOjAzQU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1
b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wNC0wMyAwOTo0MDowOSkKPiA+ID4gT24gV2VkLCBB
cHIgMDMsIDIwMTkgYXQgMDg6MDc6MjNBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
PiA+IFF1b3RpbmcgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSAoMjAxOS0wNC0wMyAwMToyMDoxMikK
PiA+ID4gPiA+IGk5MTVfcmluZ19taXNzZWRfaXJxIHdhcyByZW1vdmVkIGZyb20gZGVidWdmcyBp
biBrZXJuZWwgcGF0Y2gKPiA+ID4gPiA+IDc4OTY1OWY0MzA3YSAoImRybS9pOTE1OiBEcm9wIGZh
a2UgYnJlYWRjcnVtYiBpcnEiKSBhbmQgaXQgd2FzIHRoZQo+ID4gPiA+ID4gYmFzZSBvZiB3aGlj
aCBpOTE1X21pc3NlZF9pcnEgd2FzIHdyaXR0ZW4sIHNvIHJlbW92aW5nIHRoaXMgdGVzdCBmb3IK
PiA+ID4gPiA+IGdvb2QuCj4gPiA+ID4gCj4gPiA+ID4gSGFzIGl0IGJlZW4gcmVtb3ZlZCBmcm9t
IGFsbCB0cmVlcyB5ZXQ/IElzIGl0IGV2ZW4gZ29uZSBmcm9tIExpbnVzPwo+ID4gPiAKPiA+ID4g
V2Ugd29uJ3QgYmUgYWJsZSB0byByZW1vdmUgaXQgZnJvbSBvbGRlciBpZ3QgcmVsZWFzZXMgZWl0
aGVyIC4uLiBJIHRoaW5rCj4gPiA+IHdlJ2xsIGJlIGZpbmUuCj4gPiAKPiA+IEkgd2FzIG1vcmUg
Y3VyaW91cyBpZiBpdCBpcyBzdGlsbCBpbiB1c2UgZm9yIGFueSBvZiB0aGUgQ0kgdHJlZXMgLSBJ
Cj4gPiB0aGluayB0aGUgb2xkZXN0IG9mIHdoaWNoIHdlIHRlc3QgaXMgbGludXMuCj4gCj4gR29v
ZCBwb2ludC4gU2VlbXMgdG8gYmUgZ29uZSBmcm9tIExpbnVzJyB0cmVlIHRvbywgd2hpY2ggaXMg
dGhlIGxhc3Qgb25lCj4gd2UgY2FyZSBhYm91dCBJIHRoaW5rLgoKQWx0aG91Z2ggc2hlZGRpbmcg
YSB0ZWFyIG92ZXIgc29tZSBjcmFmdHkgY29kZSwgYXMgQ0kgaXMgbm90IHVzaW5nIGl0IGFueQpt
b3JlLCB0aGVyZSdzIG5vIHBvaW50IGtlZXBpbmcgYXJvdW5kIGRlYWQgY29kZS4gR2l0LCBhZCBt
ZW1vcmlhbS4KClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
