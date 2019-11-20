Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7D26E798
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 15:22:41 +0000 (UTC)
Date: Wed, 20 Nov 2019 07:22:40 -0800
From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Message-ID: <20191120152240.GA90081@intel.com>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
 <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
 <4275c85e-0eb9-63f7-bb0f-a8e29c2c4372@linux.intel.com>
 <157424251926.13839.7955157468403454344@skylake-alporthouse-com>
 <58d5aec1-c55e-5675-6453-59b4e60b7b24@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58d5aec1-c55e-5675-6453-59b4e60b7b24@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTkvMTEvMjAgMTA6MTgsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IAo+IE9uIDIwLzExLzIw
MTkgMDk6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgVHZydGtvIFVyc3VsaW4g
KDIwMTktMTEtMjAgMDk6MTM6NDgpCj4gPiA+IAo+ID4gPiBPbiAxOS8xMS8yMDE5IDExOjM2LCBD
aHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+ID4gUXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0x
MS0xOSAxMToyMjozMCkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gT24gMTkvMTEvMjAxOSAxMToxMSwg
Q2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiA+ID4gPiBRdW90aW5nIFZlbmthdGEgU2FuZGVlcCBE
aGFuYWxha290YSAoMjAxOS0xMS0xOSAxMTowMToxNykKPiA+ID4gPiA+ID4gPiBTaW5jZSBlbmdp
bmVzIGFyZSBub3cgbG9va2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5lIG1hcCwKPiA+ID4g
PiA+ID4gPiBjb250ZXh0IHNob3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5n
IGluIGV4ZWNidWYuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBTdG9wIGNoYW5naW5nIGZ1bmRh
bWVudGFsIHRlc3RzIG9mIGxlZ2FjeSBiZWhhdmlvdXIuIElmIHlvdSB3YW50IHRvCj4gPiA+ID4g
PiA+IGV4ZXJjaXNlIG5ldyBBUEksIGRvIHNvIGluIHBhcmFsbGVsLgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBUaGUgdGVzdCBpcyBhbHJlYWR5IHVzaW5nIHRoZSBuZXcgYXBpIHNvIGFzIGl0IHN0YW5k
cyB0aGVyZSdzIGEgbWlzbWF0Y2gKPiA+ID4gPiA+IG9uIGVuZ2luZSBmbGFncyBhbmQgY29udGV4
dCAtIHNpbmNlIGl0IHBhc3NlcyB0aGUgZW5naW5lIGZsYWdzIHRvIHRoZQo+ID4gPiA+ID4gdGhy
ZWFkLCBkZXJpdmVkIGZyb20gYSBjb250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJl
YWQgdXNlcyBhCj4gPiA+ID4gPiBsZWdhY3kgY29udGV4dC4gSXQgaGFzIHRvIGJlIGFsaWduZWQg
Zm9yIHRoZSBpbnRlbmRlZCBlbmdpbmUgdG8gZ2V0Cj4gPiA+ID4gPiBleGVyY2lzZWQuCj4gPiA+
ID4gCj4gPiA+ID4gVGhlbiBjb25zaWRlciBpdCBhIHJldHJvc3BlY3RpdmUgY29tcGxhaW50IGZv
ciBtdWNraW5nIHVwIGEgYmFzaWMgdGVzdCA6LXAKPiA+ID4gCj4gPiA+IEhlIHdobyB3b3JrcyBt
YWtlcyBtaXN0YWtlcywgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4gOikKPiA+ID4gCj4gPiA+IEFj
ayB0aGVuIHRvIG1lcmdlIHRoaXMgb25lPwo+ID4gPiAKPiA+ID4gQW5kIGVuZ2luZSBkcm9wcGlu
ZyBmbGF2b3VyIG9mIGdlbV9jdHhfZXhlYy9pbnZhbGlkLWNvbnRleHQgdG8gYmUgc2VudAo+ID4g
PiBsYXRlci4KPiA+IAo+ID4gQWNrLgo+IAo+IFRoYW5rcywgcHVzaGVkIQo+IAo+IFNhbmRlZXAg
eW91IGNhbiBub3cgcmV3b3JrIGdlbV9jdHhfZXhlYy9pbnZhbGlkLWNvbnRleHQgc2VwYXJhdGVs
eS4KPiAKClRoYW5rcyBUdnJ0a28gJiBDaHJpcyBmb3IgQWNraW5nIGFuZCBwdXNoaW5nLiBJIHdp
bGwgcmV3b3JrIHRoZSBjaGFuZ2VzCm5lZWRlZCBmb3IgdGhlIHRvIG1ha2UgaW52YWxpZF9jb250
ZXh0IHN1YnRlc3QgaW5kZXBlbmRlbnQgb2YgZW5naW5lcy4KClRoYW5rcywKU2FuZGVlcAo+IFJl
Z2FyZHMsCj4gCj4gVHZydGtvCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
