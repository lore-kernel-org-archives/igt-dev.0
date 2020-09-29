Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2889E11
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 04:26:19 +0000 (UTC)
Date: Tue, 29 Sep 2020 06:26:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200929042613.GD2711@zkempczy-mobl2>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
 <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
 <20200903115409.GA3720@zkempczy-mobl2>
 <87ft717gg9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ft717gg9.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
 selection filter
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjgsIDIwMjAgYXQgMDI6MTM6MjZQTSAtMDcwMCwgRGl4aXQsIEFzaHV0b3No
IHdyb3RlOgo+IE9uIFRodSwgMDMgU2VwIDIwMjAgMDQ6NTQ6MDkgLTA3MDAsIFpiaWduaWV3IEtl
bXBjennFhHNraSB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIFNlcCAwMywgMjAyMCBhdCAwNDozMTow
OVBNICswNTMwLCBBeWF6IEEgU2lkZGlxdWkgd3JvdGU6Cj4gPiA+IERSTSBzdWJzeXN0ZW0gZmls
dGVyIGluIGludGVsX2dwdV90b3Agd2FzIG5vdCB3b3JraW5nIGR1ZSB0byBtaXNzaW5nCj4gPiA+
IFBDSV9TTE9UX05BTUUgcHJvcGVydHkuIFVzaW5nIHRoZSBwYXJlbnQgZGV2aWNlIGluIGNhc2Ug
b2YgZHJtIHN1YnN5c3RlbQo+ID4gPiBsZWFkcyB0byBmaXggdGhpcyBpc3N1ZS4KPiA+ID4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogQXlheiBBIFNpZGRpcXVpIDxheWF6LnNpZGRpcXVpQGludGVsLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBsaWIvaWd0X2RldmljZV9zY2FuLmMgfCAyICstCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZGV2aWNlX3NjYW4uYyBiL2xpYi9pZ3RfZGV2aWNlX3NjYW4u
Ywo+ID4gPiBpbmRleCAzNDViYWU3NmQuLjM1ODNjNjljNyAxMDA2NDQKPiA+ID4gLS0tIGEvbGli
L2lndF9kZXZpY2Vfc2Nhbi5jCj4gPiA+ICsrKyBiL2xpYi9pZ3RfZGV2aWNlX3NjYW4uYwo+ID4g
PiBAQCAtMTI2Myw3ICsxMjYzLDcgQEAgYm9vbCBpZ3RfZGV2aWNlX2NhcmRfbWF0Y2goY29uc3Qg
Y2hhciAqZmlsdGVyLCBzdHJ1Y3QgaWd0X2RldmljZV9jYXJkICpjYXJkKQo+ID4gPgkvKiBXZSB0
YWtlIGZpcnN0IG9uZSBpZiBtb3JlIHRoYW4gb25lIGNhcmQgbWF0Y2hlcyBmaWx0ZXIgKi8KPiA+
ID4JZGV2ID0gaWd0X2xpc3RfZmlyc3RfZW50cnkoJmlndF9kZXZzLmZpbHRlcmVkLCBkZXYsIGxp
bmspOwo+ID4gPgo+ID4gPiAtCV9fY29weV9kZXZfdG9fY2FyZChkZXYsIGNhcmQpOwo+ID4gPiAr
CV9fY29weV9kZXZfdG9fY2FyZChpc19wY2lfc3Vic3lzdGVtKGRldikgPyBkZXYgOiBkZXYtPnBh
cmVudCwgY2FyZCk7Cj4gPiA+Cj4gPiA+CXJldHVybiB0cnVlOwo+ID4gPiAgfQo+ID4KPiA+IFRo
ZSBvbmx5IGRvdWJ0IEkgZ290OiAtIGlzIHRoYXQgaTkxNSBkcml2ZXIgYmVoYXZpb3Igb3IgYWxs
IGRybSBjYXJkcyBkbwo+ID4gdGhlIHNhbWU/Cj4gCj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSBi
dXQgSSB3aWxsIGJlIHZlcnkgc3VycHJpc2VkIGlmIHRoaXMgaXMgaTkxNSBkcml2ZXIKPiBiZWhh
dmlvci4gSSdkIHRoaW5rIHRoaXMgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgZHJtIHN1YnN5c3RlbS4K
Ckxpa2VseSB5b3UncmUgcmlnaHQsIEkndmUgY2hlY2sgb24gYW5vdGhlciB2ZW5kb3IgYW5kIGl0
IGxvb2tzIHNhbWUuIApCdXQgaXNfcGNpX3N1YnN5c3RlbShkZXYpIGNhbiBiZSB3cm9uZyBvbiAh
cGNpIGRldmljZXMuIFBlcmhhcHMgaXQgbm90IAp0aGUgY2FzZSBub3cgYnV0IGZvciBvdGhlciBm
aWx0ZXIgZm9yIHBsYXRmb3JtIGRldmljZXMgaXQgbGlrZWx5IGJlCndyb25nLgoKLS0KWmJpZ25p
ZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
