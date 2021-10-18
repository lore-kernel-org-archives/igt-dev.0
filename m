Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D46E07F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 04:19:45 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 18 Oct 2021 04:19:41 +0000
Message-ID: <DM8PR11MB571916D91BEA231F737525A28DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
 <20211013125949.19373-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgVmlsbGUNCj4gU3lyamFsYQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIg
MTMsIDIwMjEgNjozMCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpLWctdCAxLzddIGxpYjogSW50cm9kdWNlIGlndF9t
ZW1kdXAoKQ0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4NCj4gDQo+IFByb3ZpZGUgYSBoZWxwZXIgdG8gZG8gdGhlIG1hbGxvYygpK21l
bWNweSgpIGluIG9uZSBzd2lmdCBibG93Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0
X2F1eC5jIHwgMTEgKysrKysrKysrKysNCj4gIGxpYi9pZ3RfYXV4LmggfCAgMiArKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2ln
dF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMNCj4gaW5kZXggMTIxN2Y1ZTg4MDk0Li4yNDQ1ZTQ4M2Uy
MTAgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfYXV4LmMNCj4gKysrIGIvbGliL2lndF9hdXguYw0K
PiBAQCAtMTUyNywzICsxNTI3LDE0IEBAIHVpbnQ2NF90IHZmc19maWxlX21heCh2b2lkKQ0KPiAg
CX0NCj4gIAlyZXR1cm4gbWF4Ow0KPiAgfQ0KPiArDQo+ICt2b2lkICppZ3RfbWVtZHVwKGNvbnN0
IHZvaWQgKnB0ciwgc2l6ZV90IGxlbikNCj4gK3sNCj4gKwl2b2lkICpkdXA7DQo+ICsNCj4gKwlk
dXAgPSBtYWxsb2MobGVuKTsNCj4gKwlpZiAoZHVwKQ0KPiArCQltZW1jcHkoZHVwLCBwdHIsIGxl
bik7DQo+ICsNCj4gKwlyZXR1cm4gZHVwOw0KDQpEb24ndCB3ZSBuZWVkIHRvIGhhbmRsZSB0aGUg
bWFsbG9jKCkgZmFpbHVyZXM/DQpJZiBpdCBpcyBmaW5lIHRvIHJldHVybiBOVUxMIChpbiBjYXNl
IG9mIG1hbGxvYyBmYWlsdXJlKSBmcm9tIGhlcmUsDQpJIGhhdmVuJ3Qgc2VlbiB0aGF0IGFueSBj
YWxsZXIgKE90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMpIGlzIGhhbmRsaW5nDQp0aGlzIE5V
TEwuDQoNCi0gQmhhbnUNCg0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguaCBiL2xp
Yi9pZ3RfYXV4LmgNCj4gaW5kZXggMzBiMTc1ZDcwZDhiLi5hM2M0NzdhYmNkODYgMTAwNjQ0DQo+
IC0tLSBhL2xpYi9pZ3RfYXV4LmgNCj4gKysrIGIvbGliL2lndF9hdXguaA0KPiBAQCAtMzI0LDQg
KzMyNCw2IEBAIHZvaWQgaWd0X2xzb2YoY29uc3QgY2hhciAqZHBhdGgpOw0KPiANCj4gIHVpbnQ2
NF90IHZmc19maWxlX21heCh2b2lkKTsNCj4gDQo+ICt2b2lkICppZ3RfbWVtZHVwKGNvbnN0IHZv
aWQgKnB0ciwgc2l6ZV90IGxlbik7DQo+ICsNCj4gICNlbmRpZiAvKiBJR1RfQVVYX0ggKi8NCj4g
LS0NCj4gMi4zMi4wDQoNCg==
