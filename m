Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07606E868
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 10:08:45 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 3 Sep 2021 10:08:25 +0000
Message-ID: <BY5PR11MB43724C7060097EF0F69DC80189CF9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210804025637.2473-1-vidya.srinivas@intel.com>
 <07c8928d3a3e470ab225d64eb4550671@intel.com>
In-Reply-To: <07c8928d3a3e470ab225d64eb4550671@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Fix rounding error in draw_squares
 in kms_plane_alpha_blend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: "juhapekkaheikkila@gmail.com" <juhapekkaheikkila@gmail.com>, "tejaskumax.surendrakumar.upadhyay@intel.com" <tejaskumax.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhhbmsgeW91IHNvIG11Y2guDQpASm9zaGksIEt1bmFsMSBLaW5kbHkgaGVscCBtZXJnZSB0aGUg
c2VyaWVzLg0KDQpSZWdhcmRzDQpWaWR5YQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiBTZW50OiBG
cmlkYXksIFNlcHRlbWJlciAzLCAyMDIxIDEyOjQ2IFBNDQo+IFRvOiBTcmluaXZhcywgVmlkeWEg
PHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBqdWhhcGVra2FoZWlra2lsYUBnbWFpbC5jb207DQo+IHRlamFza3VtYXguc3VyZW5k
cmFrdW1hci51cGFkaHlheUBpbnRlbC5jb207IFNyaW5pdmFzLCBWaWR5YQ0KPiA8dmlkeWEuc3Jp
bml2YXNAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW2lndC1kZXZdIFtQQVRDSCBpLWctdCAw
LzJdIEZpeCByb3VuZGluZyBlcnJvciBpbiBkcmF3X3NxdWFyZXMgaW4NCj4ga21zX3BsYW5lX2Fs
cGhhX2JsZW5kDQo+IA0KPiBGb3IgdGhlIHNlcmllcy4NCj4gDQo+IFJldmlld2VkLWJ5OiBNaWth
IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IGlndC1kZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IFZpZHlhIFNyaW5pdmFzDQo+ID4gU2VudDog
V2VkbmVzZGF5LCBBdWd1c3QgNCwgMjAyMSA1OjU3IEFNDQo+ID4gVG86IGlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IGp1aGFwZWtrYWhlaWtraWxhQGdtYWlsLmNvbTsNCj4g
PiB0ZWphc2t1bWF4LnN1cmVuZHJha3VtYXIudXBhZGh5YXlAaW50ZWwuY29tOyBTcmluaXZhcywg
VmlkeWENCj4gPiA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtpZ3Qt
ZGV2XSBbUEFUQ0ggaS1nLXQgMC8yXSBGaXggcm91bmRpbmcgZXJyb3IgaW4NCj4gPiBkcmF3X3Nx
dWFyZXMgaW4ga21zX3BsYW5lX2FscGhhX2JsZW5kDQo+ID4NCj4gPiBTZXJpZXMgY29udGFpbnMg
cGF0Y2ggd2hpY2ggZml4ZXMgYSByb3VuZGluZyBpc3N1ZSBpbiBkcmF3X3NxdWFyZXMuDQo+ID4g
RHVlIHRvIHRoaXMsIGNvdmVyYWdlLXByZW11bHRpcGxpZWQtY29uc3RhbnQgc3VidGVzdCBnaXZl
cyBDUkMNCj4gPiBtaXNtYXRjaCBvbiBwYW5lbHMgd2l0aA0KPiA+IDEzNjZ4NzY4IHJlc29sdXRp
b24uDQo+ID4NCj4gPiBJbiBvcmRlciB0byBnZXQgdGhpcyByaWdodCBmaXggaW4gZnJvbSBKdWhh
LVBla2thLCB3ZSBuZWVkIHRvIHJldmVydA0KPiA+IHRoZSBBTElHTk1FTlQgZml4IHByZXZpb3Vz
bHkgc3VibWl0dGVkLg0KPiA+DQo+ID4gVmlkeWEgU3Jpbml2YXMgKDIpOg0KPiA+ICAgUmV2ZXJ0
ICJ0ZXN0cy9rbXNfcGxhbmVfYWxwaGFfYmxlbmQ6IEFsaWduIHdpZHRoIHRvIDI1NkIiDQo+ID4g
ICB0ZXN0cy9rbXNfcGxhbmVfYWxwaGFfYmxlbmQ6IEZpeCByb3VuZGluZyBpbiBkcmF3X3NxdWFy
ZXMNCj4gPg0KPiA+ICB0ZXN0cy9rbXNfcGxhbmVfYWxwaGFfYmxlbmQuYyB8IDMgKy0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IC0tDQo+ID4gMi4zMi4wDQo+IA0KDQo=
