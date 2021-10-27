Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1C6E4AB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Oct 2021 07:19:20 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 27 Oct 2021 07:19:14 +0000
Message-ID: <c5d6a06f3f1f6a5bbce33da3d20bbab1ceb4c162.camel@intel.com>
References: <20211021085153.10444-1-jouni.hogander@intel.com>
 <f0538d9d621a944ae76baf9501abb29c711554e2.camel@intel.com>
In-Reply-To: <f0538d9d621a944ae76baf9501abb29c711554e2.camel@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FE5449E1762EF44865D01EA726F8D69@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: add biplanar
 selective update tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Cc: "Kahola, Mika" <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDIxLTEwLTI2IGF0IDE3OjEzICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
PiAtaWYgKGRhdGEub3AgPT0gRlJPTlRCVUZGRVIgJiYNCj4gPiAtICAgIGludGVsX2Rpc3BsYXlf
dmVyKGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpKSA+PSAxMikgew0KPiA+IC0vKg0K
PiA+IC0gKiBGSVhNRTogRGlzcGxheSAxMisgcGxhdGZvcm1zIG5vdyBoYXZlIFBTUjINCj4gPiAt
ICogc2VsZWN0aXZlIGZldGNoIGVuYWJsZWQgYnkgZGVmYXVsdCBidXQgd2UNCj4gPiAtICogc3Rp
bGwgY2FuJ3QgcHJvcGVybHkgaGFuZGxlIGZyb250YnVmZmVyDQo+ID4gLSAqIHJlbmRlcmluZywg
c28gcmlnaHQgaXQgZG9lcyBmdWxsIGZyYW1lDQo+ID4gLSAqIGZldGNoZXMgYXQgZXZlcnkgZnJv
bnRidWZmZXIgcmVuZGVyaW5nLg0KPiA+IC0gKiBTbyBpdCBpcyBleHBlY3RlZCB0aGF0IHRoaXMg
dGVzdCB3aWxsIGZhaWwNCj4gPiAtICogaW4gZGlzcGxheSAxMisgcGxhdGZvcm0gZm93IG5vdy4N
Cj4gPiAtICovDQo+ID4gLWlndF9za2lwKCJQU1IyIHNlbGVjdGl2ZSBmZXRjaCBpcyBkb2luZyBm
dWxsIGZyYW1lIGZldGNoZXMgZm9yDQo+ID4gZnJvbnRidWZmZXIgcmVuZGVyaW5nXG4iKTsNCj4g
DQo+IElzIHRoZSBhYm92ZSBmaXhlZD8gSSBkb24ndCB0aGluayBzby4NCj4gRXZlbiBpZiBpcywg
dGhpcyBjaGFuZ2UgbmVlZHMgdG8gZ28gaW50byBhIHNlcGFyYXRlZCBwYXRjaC4NCg0KVGhpcyBz
bmVha2VkIGluIHdoZW4gcmViYXNpbmcuIFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQgb3V0LiBO
ZXcNCnZlcnNpb24gc2VudCBvdXQuDQoNCj4gDQo+ID4gK2NvbnN0IHVpbnQzMl90ICpmb3JtYXQg
PSBmb3JtYXRzW2RhdGEub3BdOw0KPiA+ICsNCj4gPiArd2hpbGUgKCpmb3JtYXQgIT0gRFJNX0ZP
Uk1BVF9JTlZBTElEKSB7DQo+ID4gK2RhdGEuZm9ybWF0ID0gKmZvcm1hdDsNCj4gPiAraWd0X2Rl
c2NyaWJlKCJUZXN0IHRoYXQgc2VsZWN0aXZlIHVwZGF0ZSB3b3JrcyB3aGVuIHNjcmVlbg0KPiA+
IGNoYW5nZXMiKTsNCj4gPiAraWd0X3N1YnRlc3RfZigiJXNfJXMiLCBvcF9zdHIoZGF0YS5vcCks
DQo+ID4gaWd0X2Zvcm1hdF9zdHIoZGF0YS5mb3JtYXQpKSB7DQo+IA0KPiBDSSBmb2xrcyBuZWVk
cyB0byBiZSBhd2FyZSBhbmQgYWNrIHRlc3RzIHJlbmFtZXMuDQo+IA0KPiBDQzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQo+IA0KPiBPdGhhbiB0aGFuIGFib3ZlIGxn
dG0uDQo+IA0KPiA+ICtwcmVwYXJlKCZkYXRhKTsNCj4gPiArcnVuKCZkYXRhKTsNCj4gPiArY2xl
YW51cCgmZGF0YSk7DQo+ID4gIH0NCj4gPiAtDQo+ID4gLXByZXBhcmUoJmRhdGEpOw0KPiA+IC1y
dW4oJmRhdGEpOw0KPiA+IC1jbGVhbnVwKCZkYXRhKTsNCj4gPiArZm9ybWF0Kys7DQo+ID4gIH0N
Cj4gPiAgfQ0KPiA+IA0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQo=
