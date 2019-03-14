Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C477F6E178
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 11:03:33 +0000 (UTC)
From: "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>
Date: Thu, 14 Mar 2019 11:03:31 +0000
Message-ID: <58d0a7a7e2a1dbb81f0202be0881c0e900d8a71f.camel@intel.com>
References: <20190215214608.32021-1-prathap.kumar.valsan@intel.com>
 <20190312151425.3939-1-prathap.kumar.valsan@intel.com>
 <be1fd64dfd5a9dc5580202ed6d09afced38a7c97.camel@intel.com>
 <155255511522.4168.9719509102188979293@skylake-alporthouse-com>
In-Reply-To: <155255511522.4168.9719509102188979293@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <82C0FFCD0EB4A241B35C1D0CF6F3B7D6@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] i915/gem_mocs_settings: Add mocs
 table for icelake
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kumar
 Valsan, Prathap" <prathap.kumar.valsan@intel.com>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTAzLTE0IGF0IDA5OjE4ICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IFF1b3RpbmcgS2FsYW1hcnosIEx1a2FzeiAoMjAxOS0wMy0xMyAxMzo1ODo1OSkNCj4gPiBPbiBU
dWUsIDIwMTktMDMtMTIgYXQgMTE6MTQgLTA0MDAsIFByYXRoYXAgS3VtYXIgVmFsc2FuIHdyb3Rl
Og0KPiA+ID4gRnJvbTogIkt1bWFyIFZhbHNhbiwgUHJhdGhhcCIgPHByYXRoYXAua3VtYXIudmFs
c2FuQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIG1vY3MgdGFibGUg
Zm9yIGljZWxha2Ugd2l0aCBleHBlY3RlZCBMMyBhbmQgZURSQU0NCj4gPiA+IGNvbnRyb2wgdmFs
dWVzLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLdW1hciBWYWxzYW4sIFByYXRoYXAg
PA0KPiA+ID4gcHJhdGhhcC5rdW1hci52YWxzYW5AaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
DQo+ID4gQ2hyaXMgYW5kIFRvbWVrIHN1Z2dlc3RlZCBjcmVhdGluZyBuZWdhdGl2ZSBzY2VuYXJp
bywgdGhhdCB3aWxsDQo+ID4gdmVyaWZ5DQo+ID4gc2V0dGluZyBkaXJ0eSBtb2NzIHZhbHVlcyBp
bnN0ZWFkIG9mIHNraXBwaW5nIGZvciBnZW4xMSsuIEJ1dCBpZg0KPiA+IHRoZXkNCj4gPiB3aWxs
IGFncmVlIHRoYXQgdGhpcyBpcyBub3QgYSBibG9ja2VyLCB0aGVuIA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNvbT4NCj4gDQo+IEl0
IGFsbCBkZXBlbmRzIG9uIHRoZSBsZXZlbCBvZiBjb25maWRlbmNlIGluIGZvbGxvdyB0aHJvdWdo
Lg0KPiANCj4gTHVrYXN6LCBkaWQgeW91IG1lYW4gcy1vLWIgb3Igci1iPyBzLW8tYiBqdXN0IHNh
eXMgeW91J3ZlIGhhbmRsZWQgdGhlDQo+IHBhdGNoIGluIHNvbWUgb2ZmaWNpYWwgY2FwYWNpdHk7
IHdpdGggYW4gci1iIHlvdSBjb25maXJtIHRoYXQgdGhlDQo+IHBhdGNoDQo+IGRvZXMgd2hhdCBp
dCBzYXlzLCBhbmQgdGhhdCBpdCBpcyBkb2luZyB0aGUgcmlnaHQgdGhpbmcgKGdpdmUgb3IgdGFr
ZQ0KPiB3ZQ0KPiBhcmUgdG90YWxseSBub3Qgcm9ib3RzKSwgYW5kIHNvIHJlYWR5IGZvciBpbmNs
dXNpb24uDQoNCkkgbWVhbnQgcmIgLi4uDQpSZXZpZXZlZC1ieTogTHVrYXN6IEthbGFtYXJ6IDxs
dWthc3oua2FsYW1hcnpAaW50ZWwuY29tPg0KLS0tLS0NCkx1a2Fzeg0KPiAtQ2hyaXMNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
