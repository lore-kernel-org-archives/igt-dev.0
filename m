Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777C76E078
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 07:48:56 +0000 (UTC)
From: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 07:48:53 +0000
Message-ID: <CA5F6A4B62957246A95956419746064382B39509@IRSMSX106.ger.corp.intel.com>
References: <20180222074343.25292-1-marta.lofstedt@intel.com>
 <151928561738.11316.4884773980791963564@mail.alporthouse.com>
In-Reply-To: <151928561738.11316.4884773980791963564@mail.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] igt/kms_fbcon_fbt: Handle ENODEV
 when checking i915_edp_psr_status for chipset support
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXMgV2lsc29uIFtt
YWlsdG86Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrXQ0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMjIsIDIwMTggOTo0NyBBTQ0KPiBUbzogTG9mc3RlZHQsIE1hcnRhIDxtYXJ0YS5sb2ZzdGVk
dEBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVj
dDogUmU6IFtpZ3QtZGV2XSBbUEFUQ0ggaS1nLXQgMS8zXSBpZ3Qva21zX2ZiY29uX2ZidDogSGFu
ZGxlIEVOT0RFVg0KPiB3aGVuIGNoZWNraW5nIGk5MTVfZWRwX3Bzcl9zdGF0dXMgZm9yIGNoaXBz
ZXQgc3VwcG9ydA0KPiANCj4gUXVvdGluZyBNYXJ0YSBMb2ZzdGVkdCAoMjAxOC0wMi0yMiAwNzo0
Mzo0MSkNCj4gPiBJZiB0aGUgbWFjaGluZSBkb2Vzbid0IHN1cHBvcnQgUFNSLCBpdCB3aWxsIHJl
dHVybiAtRU5PREVWIGZyb20NCj4gPiBpOTE1X2VkcF9wc3Jfc3RhdHVzLCB3aGljaCB3ZSB3YW50
IHRvIGludGVycHJldCBhcyB1bnN1cHBvcnRlZC4NCj4gPiBUaGlzIGlzIGluIGxpbmUgd2l0aCB3
aGF0IENocmlzIGp1c3QgZml4ZWQgZm9yIEZCQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1h
cnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRl
c3RzL2ttc19mYmNvbl9mYnQuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rl
c3RzL2ttc19mYmNvbl9mYnQuYyBpbmRleA0KPiA+IDFiMjM2ZjhiLi42YWExNzFlNiAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9rbXNfZmJjb25fZmJ0LmMNCj4gPiArKysgYi90ZXN0cy9rbXNfZmJj
b25fZmJ0LmMNCj4gPiBAQCAtMTY0LDYgKzE2NCw4IEBAIHN0YXRpYyBib29sIHBzcl9zdXBwb3J0
ZWRfb25fY2hpcHNldChpbnQgZmQpICB7DQo+ID4gICAgICAgICBjaGFyIGJ1ZlsyNTZdOw0KPiA+
DQo+ID4gKyAgICAgICBpZiAoKmJ1ZiA9PSAnXDAnKSAvKiAhSEFTX1BTUiAtPiAtRU5PREVWKi8N
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICAgICAgICAgaWd0X2RlYnVn
ZnNfcmVhZChmZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYpOw0KPiANCj4gQWZ0ZXIgdGhl
IHJlYWQgOikNCg0KWWVhaCwgd2FzIHdheSB0b28gdHJpZ2dlciBoYXBweSBoZXJlDQoNCj4gDQo+
ID4gICAgICAgICByZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9ydDogeWVzXG4iKTsgIH0N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
