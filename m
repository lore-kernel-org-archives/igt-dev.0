Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AC189230
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2019 13:12:48 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Mon, 20 May 2019 13:12:45 +0000
Message-ID: <eba751d105ea8eb9bbf0eab07b6ce1e1753cc183.camel@intel.com>
References: <20190517160242.28247-1-simon.ser@intel.com>
 <20190517160242.28247-5-simon.ser@intel.com>
 <56A4AB1F0E1B5D4C83D27F43C50F662E58F9E934@IRSMSX107.ger.corp.intel.com>
In-Reply-To: <56A4AB1F0E1B5D4C83D27F43C50F662E58F9E934@IRSMSX107.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <D087F586379A524C807BD567DE397AF4@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/kms_chamelium: skip audio
 tests Chamelium doesn't support
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA1LTIwIGF0IDEzOjIxICswMTAwLCBQZXJlcywgTWFydGluIHdyb3RlOg0K
PiBPbiAxNy8wNS8yMDE5IDE5OjAzLCBTZXIsIFNpbW9uIHdyb3RlOg0KPiA+IEluIHRoZXNlIGNv
bmZpZ3VyYXRpb25zIHRoZSBDaGFtZWxpdW0gZGV2aWNlIHNlbmRzIG1hbGZvcm1lZCBkYXRhOg0K
PiA+IA0KPiA+IC0gTW9yZSB0aGFuIDIgY2hhbm5lbHMNCj4gPiAtIDIgY2hhbm5lbHMsIG1vcmUg
dGhhbiAxNi1iaXQgc2FtcGxlcyBhbmQgbW9yZSB0aGFuIDMyS0h6IHNhbXBsaW5nIHJhdGUNCj4g
PiANCj4gPiBJbiB0aGlzIGNhc2VzLCBza2lwIHRoZSB0ZXN0Lg0KPiA+IA0KPiA+IFNlZSBjcmJ1
Zy5jb20vOTUwOTE3Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBl
cmVzQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHNlcmllcywgYW5kIHRo
ZSBuaWNlIHNwbGl0IGJldHdlZW4gcGF0Y2hlcyA6KQ0KDQpFaGVoLCB0aGFua3MgZm9yIHRoZSBy
ZXZpZXchDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ttc19jaGFtZWxpdW0uYyB8IDExICsrKysrKysrKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYw0KPiA+
IGluZGV4IDg4MzU2ZGQyMzJiNi4uZTg4OGE2NDJjMjRhIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3Rz
L2ttc19jaGFtZWxpdW0uYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYw0KPiA+IEBA
IC0xMDYyLDYgKzEwNjIsMTcgQEAgc3RhdGljIGJvb2wgdGVzdF9hdWRpb19jb25maWd1cmF0aW9u
KHN0cnVjdCBhbHNhICphbHNhLCBzbmRfcGNtX2Zvcm1hdF90IGZvcm1hdCwNCj4gPiAgCQkJICBz
YW1wbGluZ19yYXRlLCBjaGFubmVscyk7DQo+ID4gIAkJcmV0dXJuIGZhbHNlOw0KPiA+ICAJfQ0K
PiA+ICsJLyogVE9ETzogdGhlIENoYW1lbGl1bSBkZXZpY2Ugc2VuZHMgYSBtYWxmb3JtZWQgc2ln
bmFsIGZvciBzb21lIGF1ZGlvDQo+ID4gKwkgKiBjb25maWd1cmF0aW9ucy4gU2VlIGNyYnVnLmNv
bS85NTA5MTcgKi8NCj4gPiArCWlmICgoZm9ybWF0ICE9IFNORF9QQ01fRk9STUFUX1MxNl9MRSAm
JiBzYW1wbGluZ19yYXRlID49IDQ0MTAwKSB8fA0KPiA+ICsJCQljaGFubmVscyA+IDIpIHsNCj4g
PiArCQlpZ3RfZGVidWcoIlNraXBwaW5nIHRlc3Qgd2l0aCBmb3JtYXQgJXMsIHNhbXBsaW5nIHJh
dGUgJWQgSHogIg0KPiA+ICsJCQkgICJhbmQgJWQgY2hhbm5lbHMgYmVjYXVzZSB0aGUgQ2hhbWVs
aXVtIGRldmljZSAiDQo+ID4gKwkJCSAgImRvZXNuJ3Qgc3VwcG9ydCB0aGlzIGNvbmZpZ3VyYXRp
b25cbiIsDQo+ID4gKwkJCSAgc25kX3BjbV9mb3JtYXRfbmFtZShmb3JtYXQpLA0KPiA+ICsJCQkg
IHNhbXBsaW5nX3JhdGUsIGNoYW5uZWxzKTsNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKwl9
DQo+ID4gIAlyZXR1cm4gdHJ1ZTsNCj4gPiAgfQ0KPiA+ICANCj4gPiANCj4gDQo+IA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
