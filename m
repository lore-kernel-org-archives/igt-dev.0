Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8389BFC
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 12:22:12 +0000 (UTC)
Date: Wed, 20 Mar 2019 14:22:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190320122209.GT4038@platvala-desk.ger.corp.intel.com>
References: <973e1099bb84177875aeccb4140ad7958bbc5bbd.camel@intel.com>
 <87woktevhp.fsf@intel.com>
 <0fa8cad45c9fa58e39518aaf1364fc916b4782d5.camel@intel.com>
 <87tvfxeoez.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tvfxeoez.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: add -Wno-missing-braces
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDI6MTE6MTZQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gV2VkLCAyMCBNYXIgMjAxOSwgIlNlciwgU2ltb24iIDxzaW1vbi5zZXJAaW50ZWwu
Y29tPiB3cm90ZToKPiA+IE9uIFdlZCwgMjAxOS0wMy0yMCBhdCAxMTozOCArMDIwMCwgSmFuaSBO
aWt1bGEgd3JvdGU6Cj4gPj4gT24gV2VkLCAyMCBNYXIgMjAxOSwgIlNlciwgU2ltb24iIDxzaW1v
bi5zZXJAaW50ZWwuY29tPiB3cm90ZToKPiA+PiA+IEVuYWJsaW5nIC1XZXJyb3I9bWlzc2luZy1i
cmFjZXMgcmVzdWx0cyBpbiB0aGlzIGVycm9yIHdpdGggQ2xhbmc6Cj4gPj4gPiAKPiA+PiA+ICAg
ICAuLi90ZXN0cy9rbXNfdnJyLmM6MjAzOjIwOiBlcnJvcjogc3VnZ2VzdCBicmFjZXMgYXJvdW5k
Cj4gPj4gPiBpbml0aWFsaXphdGlvbiBvZiBzdWJvYmplY3QgWy1XZXJyb3IsLVdtaXNzaW5nLWJy
YWNlc10KPiA+PiA+ICAgICAgICAgICAgIGRybVZCbGFuayB2YmwgPSB7IDAgfTsKPiA+PiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+PiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHt9Cj4gPj4gPiAKPiA+PiA+IEkgZG9uJ3QgYmVsaWV2ZSB0aGVyZSBpcyBhbnkg
dmFsdWUgaW4ga2VlcGluZyB0aGlzLCBzbyBsZXQncyBqdXN0Cj4gPj4gPiBkaXNhYmxlIGl0Lgo+
ID4+IAo+ID4+IEkgZmFpbCB0byBjb21lIHVwIHdpdGggZXhhbXBsZXMgcmlnaHQgbm93LCBidXQg
SSB0aGluayB0aGVyZSBhcmUKPiA+PiBsZWdpdGltYXRlIGNhc2VzIGZvciB0aGUgd2FybmluZy4K
PiA+PiAKPiA+PiBBcmd1YWJseSB0aGUgYWJvdmUgaW5pdGlhbGl6ZXIgc2hvdWxkIGJlIHdyaXR0
ZW4gYXMgc2ltcGx5IHt9IGluc3RlYWQKPiA+PiBvZgo+ID4+IGhhdmluZyB0aGUgMCB2YWx1ZSBm
b3IgaW5pdGlhbGl6aW5nIHRoZSBmaXJzdCBtZW1iZXIgd2hpY2ggaGFwcGVucyB0bwo+ID4+IGJl
Cj4gPj4gYSBzdWJzdHJ1Y3QuCj4gPgo+ID4gVW5mb3J0dW5hdGVseSB1c2luZyB7fSBpcyBhIEdO
VSBleHRlbnNpb24sIGFuZCBJU08gQyBmb3JiaWRzIGVtcHR5Cj4gPiBpbml0aWFsaXplciBsaXN0
cy4KPiAKPiBSaWdodCwgaXQncyBhbHNvIG9rYXkgaW4gSVNPIEMrKzExLgo+IAo+ID4gRG9lcyBJ
R1QgdXNlIHVuLXN0YW5kYXJkaXplZCBleHRlbnNpb25zPwo+IAo+IEknbSBwcmV0dHkgc3VyZSBp
dCBkb2VzLCBidXQgSSdsbCBkZWZlciBkZWNpc2lvbnMgYWJvdXQgdGhpcyB0byB0aGUgSUdUCj4g
bWFpbnRhaW5lcnMuCgoKV2UgdXNlIC1zdGQ9Z251MTEuCgpJdCdzIG5vdCBhcyBhbiBleHBsaWNp
dCBmbGFnIGFueXdoZXJlLCBtYWtpbmcgaXQgaGFyZCB0byBmaW5kLiBJdCdzIGluCnRvcGxldmVs
IG1lc29uLmJ1aWxkLCB0aGUgcHJvamVjdCgpIGNhbGwsIGRlZmF1bHRfb3B0aW9uczoKJ2Nfc3Rk
PWdudTExJwoKQSBxdWljayBsb29rIGluIGF1dG90b29scyByZXZlYWxzIHRoYXQgd2UgZG9uJ3Qg
c2V0IHRoZSBzdGQgb24gaXQgYXQKYWxsLiBPaCB3ZWxsLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
