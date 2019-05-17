Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Ser, Simon" <simon.ser@intel.com>
Date: Fri, 17 May 2019 10:55:19 +0000
Message-ID: <d3a0ad3da08f7cb2d73a117efee8c446e8498a40.camel@intel.com>
References: <20190516185840.19777-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190516185840.19777-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Content-ID: <228BCCEC92825642B864E6D6951B08DE@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] benchmarks/gem_wsim: Randomise random
 seed
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
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTE2IGF0IDE5OjU4ICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IFRvIGF2b2lkIGhpdHRpbmcgdGhlIHNhbWUgcnV0IG9uIGVhY2ggYmVuY2htYXJrIHJ1biwgc3Rh
cnQgd2l0aCBhIG5ldw0KPiByYW5kb20gc2VlZC4gVG8gYWxsb3cgaGl0dGluZyB0aGUgc2FtZSBy
dXQgYWdhaW4sIGxldCBpdCBiZSBzcGVjaWZpZWQNCj4gYnkgdGhlIHVzZXIuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gQ2M6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgYmVu
Y2htYXJrcy9nZW1fd3NpbS5jIHwgNiArKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL2dl
bV93c2ltLmMgYi9iZW5jaG1hcmtzL2dlbV93c2ltLmMNCj4gaW5kZXggNDg1NjhjZTQwLi5jZjJh
NDQ3NDYgMTAwNjQ0DQo+IC0tLSBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYw0KPiArKysgYi9iZW5j
aG1hcmtzL2dlbV93c2ltLmMNCj4gQEAgLTIyODIsOCArMjI4Miw5IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICoqYXJndikNCj4gIAlpZ3RfcmVxdWlyZShmZCk7DQo+ICANCj4gIAlpbml0X2Ns
b2NrcygpOw0KPiArCXNyYW5kKHRpbWUoTlVMTCkpOw0KDQpNYXliZSB0aGUgc2VlZCB1c2VkIGZv
ciB0aGUgcnVuIHNob3VsZCBiZSBwcmludGVkIHRvIHN0ZGVyciwgc28gdGhhdCdzDQppdCdzIGVh
c3kgdG8gcmUtcnVuIGEgZmFpbHVyZT8NCg0KPiAtCXdoaWxlICgoYyA9IGdldG9wdChhcmdjLCBh
cmd2LCAiaHF2MlJTSHhHZGM6bjpyOnc6VzphOnQ6YjpwOiIpKSAhPSAtMSkgew0KPiArCXdoaWxl
ICgoYyA9IGdldG9wdChhcmdjLCBhcmd2LCAiaHF2MlJTSHhHZGM6bjpyOnc6VzphOnQ6YjpwOnM6
IikpICE9IC0xKSB7DQo+ICAJCXN3aXRjaCAoYykgew0KPiAgCQljYXNlICdXJzoNCj4gIAkJCWlm
IChtYXN0ZXJfd29ya2xvYWQgPj0gMCkgew0KPiBAQCAtMjMwMCw2ICsyMzAxLDkgQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiAgCQljYXNlICdwJzoNCj4gIAkJCXByaW8gPSBh
dG9pKG9wdGFyZyk7DQo+ICAJCQlicmVhazsNCj4gKwkJY2FzZSAncyc6DQo+ICsJCQlzcmFuZChh
dG9pKG9wdGFyZykpOw0KPiArCQkJYnJlYWs7DQo+ICAJCWNhc2UgJ2EnOg0KPiAgCQkJaWYgKGFw
cGVuZF93b3JrbG9hZF9hcmcpIHsNCj4gIAkJCQlpZiAodmVyYm9zZSkNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
