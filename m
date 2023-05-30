Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90410E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 12:59:51 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 30 May 2023 12:59:29 +0000
Message-ID: <MW4PR11MB70542C0A0A6668129C7686E8EF4B9@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20230530120440.5259-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230530120440.5259-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/veboxcopy: Add packed 64bpp 16b per
 channel yuv support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYSBIZWlr
a2lsYQ0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMzAsIDIwMjMgMzowNSBQTQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpLWct
dF0gbGliL3ZlYm94Y29weTogQWRkIHBhY2tlZCA2NGJwcCAxNmIgcGVyIGNoYW5uZWwgeXV2IHN1
cHBvcnQNCj4gDQo+IEVuYWJsZSBWZWJveCBlbmdpbmUgdG8gY29weSBwYWNrZWQgNjRicHAgeXV2
IHN1cmZhY2VzLg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBp
bnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBl
a2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBsaWIvdmVib3hjb3B5X2dlbjEyLmMg
fCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL3ZlYm94Y29weV9nZW4xMi5jIGIvbGliL3ZlYm94Y29weV9nZW4xMi5jIGlu
ZGV4IDRhYjZjZWQzLi40NGM5MTRlNyAxMDA2NDQNCj4gLS0tIGEvbGliL3ZlYm94Y29weV9nZW4x
Mi5jDQo+ICsrKyBiL2xpYi92ZWJveGNvcHlfZ2VuMTIuYw0KPiBAQCAtMzAsNiArMzAsNyBAQA0K
PiAgI2RlZmluZSBQTEFOQVJfNDIwXzgJNA0KPiAgI2RlZmluZSBQQUNLRURfNDQ0QV84CTUNCj4g
ICNkZWZpbmUgUjhHOEI4QThfVU5PUk0JOA0KPiArI2RlZmluZSBQQUNLRURfNDQ0XzE2CTkNCj4g
ICNkZWZpbmUgUExBTkFSXzQyMF8xNgkxMg0KPiANCj4gIHN0cnVjdCB2ZWJveF9zdXJmYWNlX3N0
YXRlIHsNCj4gQEAgLTM0Miw2ICszNDMsMTAgQEAgdm9pZCBnZW4xMl92ZWJveF9jb3B5ZnVuYyhz
dHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAkJZm9ybWF0ID0gc3JjLT5mb3JtYXRfaXNfeXV2ID8g
UEFDS0VEXzQ0NEFfOCA6DQo+ICAJCQkJCSAgICAgIFI4RzhCOEE4X1VOT1JNOw0KPiAgCQlicmVh
azsNCj4gKwljYXNlIDY0Og0KPiArCQlpZ3RfYXNzZXJ0KCFzcmMtPmZvcm1hdF9pc195dXZfc2Vt
aXBsYW5hciAmJiBzcmMtPmZvcm1hdF9pc195dXYpOw0KPiArCQlmb3JtYXQgPSBQQUNLRURfNDQ0
XzE2Ow0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQlpZ3RfYXNzZXJ0X2YoMCwgIlVu
c3VwcG9ydGVkIGJwcDogJXVcbiIsIHNyYy0+YnBwKTsNCj4gIAl9DQo+IC0tDQo+IDIuMjUuMQ0K
DQo=
