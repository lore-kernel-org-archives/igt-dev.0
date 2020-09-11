Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9BA6E2F3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2020 06:09:19 +0000 (UTC)
Date: Fri, 11 Sep 2020 08:49:38 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200911054938.GH7444@platvala-desk.ger.corp.intel.com>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
 <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
 <20200903115409.GA3720@zkempczy-mobl2>
 <0fef87a956224330bba6bae75a4b7297@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fef87a956224330bba6bae75a4b7297@intel.com>
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
To: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDQsIDIwMjAgYXQgMDc6MzE6NDZBTSArMDAwMCwgU2lkZGlxdWksIEF5YXog
QSB3cm90ZToKPiAKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBa
YmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiA+
IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMywgMjAyMCA1OjI0IFBNCj4gPiBUbzogU2lkZGlx
dWksIEF5YXogQSA8YXlhei5zaWRkaXF1aUBpbnRlbC5jb20+Cj4gPiBDYzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+IFN1YmplY3Q6IFJlOiBbaWd0LWRldl0gW1BBVENIIGktZy10
IDEvMl0gbGliL2lndF9kZXZpY2Vfc2NhbjogRml4IGRldmljZQo+ID4gc2VsZWN0aW9uIGZpbHRl
cgo+ID4gCj4gPiBPbiBUaHUsIFNlcCAwMywgMjAyMCBhdCAwNDozMTowOVBNICswNTMwLCBBeWF6
IEEgU2lkZGlxdWkgd3JvdGU6Cj4gPiA+IERSTSBzdWJzeXN0ZW0gZmlsdGVyIGluIGludGVsX2dw
dV90b3Agd2FzIG5vdCB3b3JraW5nIGR1ZSB0byBtaXNzaW5nCj4gPiA+IFBDSV9TTE9UX05BTUUg
cHJvcGVydHkuIFVzaW5nIHRoZSBwYXJlbnQgZGV2aWNlIGluIGNhc2Ugb2YgZHJtCj4gPiA+IHN1
YnN5c3RlbSBsZWFkcyB0byBmaXggdGhpcyBpc3N1ZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQXlheiBBIFNpZGRpcXVpIDxheWF6LnNpZGRpcXVpQGludGVsLmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICBsaWIvaWd0X2RldmljZV9zY2FuLmMgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZGV2aWNlX3NjYW4uYyBiL2xpYi9pZ3RfZGV2aWNlX3NjYW4uYyBpbmRleAo+ID4gPiAz
NDViYWU3NmQuLjM1ODNjNjljNyAxMDA2NDQKPiA+ID4gLS0tIGEvbGliL2lndF9kZXZpY2Vfc2Nh
bi5jCj4gPiA+ICsrKyBiL2xpYi9pZ3RfZGV2aWNlX3NjYW4uYwo+ID4gPiBAQCAtMTI2Myw3ICsx
MjYzLDcgQEAgYm9vbCBpZ3RfZGV2aWNlX2NhcmRfbWF0Y2goY29uc3QgY2hhciAqZmlsdGVyLAo+
ID4gc3RydWN0IGlndF9kZXZpY2VfY2FyZCAqY2FyZCkKPiA+ID4gIAkvKiBXZSB0YWtlIGZpcnN0
IG9uZSBpZiBtb3JlIHRoYW4gb25lIGNhcmQgbWF0Y2hlcyBmaWx0ZXIgKi8KPiA+ID4gIAlkZXYg
PSBpZ3RfbGlzdF9maXJzdF9lbnRyeSgmaWd0X2RldnMuZmlsdGVyZWQsIGRldiwgbGluayk7Cj4g
PiA+Cj4gPiA+IC0JX19jb3B5X2Rldl90b19jYXJkKGRldiwgY2FyZCk7Cj4gPiA+ICsJX19jb3B5
X2Rldl90b19jYXJkKGlzX3BjaV9zdWJzeXN0ZW0oZGV2KSA/IGRldiA6IGRldi0+cGFyZW50LAo+
ID4gY2FyZCk7Cj4gPiA+Cj4gPiA+ICAJcmV0dXJuIHRydWU7Cj4gPiA+ICB9Cj4gPiAKPiA+IFRo
ZSBvbmx5IGRvdWJ0IEkgZ290OiAtIGlzIHRoYXQgaTkxNSBkcml2ZXIgYmVoYXZpb3Igb3IgYWxs
IGRybSBjYXJkcyBkbyB0aGUKPiA+IHNhbWU/Cj4gSSBoYXZlbid0IGNoZWNrIGFuZCBJbiBjYXNl
IG9mIG90aGVyIGRybSBjYXJkIHdlIG1heSBub3QgaGF2ZSBwbXUgYWxzby4KCkZvciBpbnRlbF9n
cHVfdG9wIHdlIG5hdHVyYWxseSBkb24ndCB3b3JyeSBhYm91dCBvdGhlciBkZXZpY2VzIGJ1dAp0
aGlzIGNoYW5nZSBhZmZlY3RzIGV2ZXJ5b25lLiBQbGVhc2UgY2hlY2sgYW5kIHZlcmlmeSB0aGlz
LgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
