Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE15D6E10E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Oct 2018 21:12:10 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 18 Oct 2018 21:12:08 +0000
Message-ID: <ff6f3cb0df018d14dd28b5a710d35a6cc38defaf.camel@intel.com>
References: <20181017212658.113049-1-casey.g.bowman@intel.com>
In-Reply-To: <20181017212658.113049-1-casey.g.bowman@intel.com>
Content-Language: en-US
Content-ID: <5D193AAA89ACC5489813D7AED94949FF@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_psr: Changed psr_set logic to
 account for older kernels
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Bowman,
 Casey G" <casey.g.bowman@intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE4LTEwLTE3IGF0IDE0OjI2IC0wNzAwLCBDYXNleSBCb3dtYW4gd3JvdGU6DQo+
IE9ubHkgRUlOVkFMIHdhcyBiZWluZyB1c2VkIHRvIGFjY291bnQgZm9yIG9sZGVyIGtlcm5lbHMs
DQo+IGJ1dCBvbiBsZWdhY3kga2VybmVscyB0aGF0IGRvbid0IHVzZSBpOTE1X2VkcF9wc3JfZGVi
dWcsDQo+IHRoZSBFTk9FTlQgZXJyb3Igd2lsbCBiZSB0aHJvd24uIFRoaXMgY2hhbmdlcyB0aGUg
bG9naWMNCj4gdG8gc2V0IFBTUiB2aWEgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaWYgYSBwcm9ibGVt
IG9jY3Vycw0KPiB3aGVuIGF0dGVtcHRpbmcgdG8gc2V0IFBTUiB2aWEgdGhlIGRlYnVnZnNfZmQu
DQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogQ2FzZXkgQm93bWFuIDxjYXNleS5nLmJvd21h
bkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2lndF9wc3IuYyB8IDggKysrKystLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMNCj4gaW5kZXggMGRkZmI2NGYu
LjY5MDQzOTNjIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+ICsrKyBiL2xpYi9pZ3Rf
cHNyLmMNCj4gQEAgLTYxLDYgKzYxLDggQEAgc3RhdGljIGludCBoYXNfcHNyX2RlYnVnZnMoaW50
IGRlYnVnZnNfZmQpDQo+ICAJICogQ2hlY2sgaWYgbmV3IFBTUiBkZWJ1Z2ZzIGFwaSBpcyB1c2Fi
bGUgYnkgd3JpdGluZyBhbiBpbnZhbGlkDQo+IHZhbHVlLg0KPiAgCSAqIExlZ2FjeSBtb2RlIHdp
bGwgcmV0dXJuIE9LIGhlcmUsIGRlYnVnZnMgYXBpIHdpbGwgcmV0dXJuDQo+IC1FSU5WQUwuDQo+
ICAJICogLUVOT0RFViBpcyByZXR1cm5lZCB3aGVuIFBTUiBpcyB1bmF2YWlsYWJsZS4NCj4gKwkg
KiAtRU5PRU5UIGlzIHJldHVybmVkIHdoZW4gUFNSIGRlYnVnZnMgYXBpIGRvZXNuJ3QgZXhpc3Qg
KGkuZS4NCj4gdXNpbmcNCj4gKwkgKiBhbiBvbGRlciBrZXJuZWwpLg0KPiAgCSAqLw0KPiAgCXJl
dCA9IHBzcl93cml0ZShkZWJ1Z2ZzX2ZkLCAiMHhmIik7DQo+ICAJaWYgKHJldCA9PSAtRUlOVkFM
KQ0KPiBAQCAtMTAzLDExICsxMDUsMTEgQEAgc3RhdGljIGJvb2wgcHNyX3NldChpbnQgZGVidWdm
c19mZCwgYm9vbA0KPiBlbmFibGUpDQo+ICAJCXJldHVybiBmYWxzZTsNCj4gIAl9DQo+ICANCj4g
LQlpZiAocmV0ID09IC1FSU5WQUwpIHsNCj4gLQkJcmV0ID0gcHNyX21vZHBhcmFtX3NldChlbmFi
bGUpOw0KPiAtCX0gZWxzZSB7DQo+ICsJaWYgKHJldCA9PSAwKSB7DQo+ICAJCXJldCA9IHBzcl93
cml0ZShkZWJ1Z2ZzX2ZkLCBlbmFibGUgPyAiMHgzIiA6ICIweDEiKTsNCj4gIAkJaWd0X2Fzc2Vy
dChyZXQgPiAwKTsNCj4gKwl9IGVsc2Ugew0KPiArCQlyZXQgPSBwc3JfbW9kcGFyYW1fc2V0KGVu
YWJsZSk7DQo+ICAJfQ0KPiAgDQo+ICAJLyogUmVzdG9yZSBvcmlnaW5hbCB2YWx1ZSBvbiBleGl0
ICovDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
