Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Date: Fri, 1 Sep 2023 12:17:53 +0000
Message-ID: <4fa2fbf667feb0a47fc7063171a3661d2c12082a.camel@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-2-lucas.demarchi@intel.com>
 <ZPAzB95lw3vSqgan@bvivekan-mobl>
 <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
In-Reply-To: <73mgfju4usrlbao3ejqf36joimrp722pgnydmxarf6hvg5gu5s@no2ox2hlqgpj>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <44277A756ECC5449B5583B17EE2A8519@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt 1/4] lib: Add xe_pciids.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTAxIGF0IDAyOjIxIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+ICtSb2RyaWdvDQo+IA0KPiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxMTo1ODoyM0FNICsw
NTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiB3cm90ZToNCj4gPiBPbiAyOS4wOC4y
MDIzIDA3OjExLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6DQo+ID4gPiBXaXRoIHRoZSBpbnRyb2R1
Y3Rpb24gb2YgTHVuYXIgTGFrZSwgaWd0IHdvbid0IGJlIGFibGUgdG8ganVzdA0KPiA+ID4gcmUt
dXNlDQo+ID4gPiBpOTE1X3BjaWlkcy5oIGZvciBib3RoIGRyaXZlcnMgYW55bW9yZSBzaW5jZSB0
aGUgc3VwcG9ydCBmb3IgTE5MDQo+ID4gPiBpcyBvbmx5DQo+ID4gPiBjb21pbmcgd2l0aCB0aGUg
eGUgbW9kdWxlLiBDb3B5IHhlX3BjaWlkcy5oIGZyb20gdGhlIGRybS14ZS1uZXh0DQo+ID4gPiBi
cmFuY2gNCj4gPiA+ICh1cCB0byBjb21taXQgYjljOTAyMGZjODE2ICgiZHJtL3hlL3B2YzogVXNl
IGZhc3QgY29weSBlbmdpbmVzIGFzDQo+ID4gPiBtaWdyYXRlIGVuZ2luZSBvbiBQVkMiKSBhbmQg
c3RhcnQgaW5jbHVkaW5nIGl0IHdoZXJlIG5lZWRlZC4gVGhpcw0KPiA+ID4gYnJpbmdzDQo+ID4g
PiBhbGwgdGhlIExOTCBQQ0kgSURzLg0KPiA+IA0KPiA+IEkgY291bGRuJ3QgZmluZCB0aGUgY29t
bWl0IGhhc2ggYjljOTAyMGZjODE2LiBJcyBpdCBsb3N0IGR1ZSB0bw0KPiA+IHJlYmFzZT8NCj4g
PiBJbiB0aGF0IGNhc2UsIGRvZXMgaXQgbWFrZSBzZW5zZSB0byB1c2UgdGhlIGNvbW1pdCBoYXNo
IG9yIGp1c3QNCj4gPiBrZWVwIHRoZQ0KPiA+IGNvbW1pdCBzdWJqZWN0Pw0KPiANCj4gUm9kcmln
bywgZGlkIHlvdSB0YWcgdGhlIGJyYW5jaCBiZWZvcmUgZm9yY2UgcHVzaGluZz8gSWYgc28sIGNh
biB5b3UNCj4gcHVzaCBhIHRhZyBsaWtlIHRoZSBhcmNoaXZlLyogb25lcz8gVGhpcyB3b3VsZCBh
bGxvdyBwZW9wbGUgdG8gc2VlDQo+IHRoZQ0KPiBjb21taXQgcmVmZXJlbmNlZCwgZXZlbiBpZiBs
YXRlciB3ZSBmb3JjZSBwdXNoIHRoZSBicmFuY2guDQoNCm9wcywgc29ycnkgZm9yIHRoYXQuIA0K
VGhlIHRhZyBpcyB0aGVyZSBub3c6DQoNCmRybS14ZS1uZXh0LTIwMjMtMDgtMjkNCg0KYnR3LCBJ
IG5vdGljZWQgd2UgYXJlIHVzaW5nIDIgZGlmZmVyZW50IHN0eWxlcywgc2hvdWxkIHdlIGFsd2F5
cyBhZGQNCidhcmNoaXZlLycgb3Igc2hvdWxkIHdlIGRyb3AgdGhhdD8NCg0KSXMgdGhlcmUgYW55
IHRhZyB0aGF0IGlzIG5vdCBhbiBhcmNoaXZlPw0KDQo+IA0KPiANCj4gTHVjYXMgRGUgTWFyY2hp
DQoNCg==
