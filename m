Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7A689861
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2019 10:22:39 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Mon, 27 May 2019 10:22:36 +0000
Message-ID: <3c03752a4072d731ecb19765dccd5a1e238fddd3.camel@intel.com>
References: <20190523105632.29397-1-simon.ser@intel.com>
 <c6eb9394-5ade-cf9b-7a9a-0dc3397eba7e@linux.intel.com>
In-Reply-To: <c6eb9394-5ade-cf9b-7a9a-0dc3397eba7e@linux.intel.com>
Content-Language: en-US
Content-ID: <7C6DB9D89813F14CA42C1294B141A6BE@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_audio: add more assertions
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "martin.peres@linux.intel.com" <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA1LTI3IGF0IDEzOjA3ICswMzAwLCBNYXJ0aW4gUGVyZXMgd3JvdGU6DQo+
IA0KPiBPbiAyMy8wNS8yMDE5IDEzOjU2LCBTaW1vbiBTZXIgd3JvdGU6DQo+ID4gLSBNYWtlIHN1
cmUgYW4gYXVkaW8gc2lnbmFsIGlzbid0IGNyZWF0ZWQgd2l0aCB6ZXJvIGNoYW5uZWxzDQo+ID4g
LSBNYWtlIHN1cmUgZWFjaCBjaGFubmVsIGhhcyBhdCBsZWFzdCBvbmUgZnJlcXVlbmN5IHdoZW4g
c3ludGhlc2l6aW5nDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5z
ZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBsaWIvaWd0X2F1ZGlvLmMgfCA1ICsrKystDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2lndF9hdWRpby5jDQo+ID4g
aW5kZXggMzc2ZTA0YmE2ZWQ2Li4xNjc3ZGQwOWMwMjkgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2ln
dF9hdWRpby5jDQo+ID4gKysrIGIvbGliL2lndF9hdWRpby5jDQo+ID4gQEAgLTgwLDYgKzgwLDcg
QEAgc3RydWN0IGF1ZGlvX3NpZ25hbCAqYXVkaW9fc2lnbmFsX2luaXQoaW50IGNoYW5uZWxzLCBp
bnQgc2FtcGxpbmdfcmF0ZSkNCj4gPiAgew0KPiA+ICAJc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2ln
bmFsOw0KPiA+ICANCj4gPiArCWlndF9hc3NlcnQoY2hhbm5lbHMgPiAwKTsNCj4gPiAgCWlndF9h
c3NlcnQoY2hhbm5lbHMgPD0gQ0hBTk5FTFNfTUFYKTsNCj4gPiAgDQo+ID4gIAlzaWduYWwgPSBt
YWxsb2Moc2l6ZW9mKHN0cnVjdCBhdWRpb19zaWduYWwpKTsNCj4gPiBAQCAtMjY3LDggKzI2OCwx
MCBAQCB2b2lkIGF1ZGlvX3NpZ25hbF9maWxsKHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbCwg
ZG91YmxlICpidWZmZXIsDQo+ID4gIA0KPiA+ICAJbWVtc2V0KGJ1ZmZlciwgMCwgc2l6ZW9mKGRv
dWJsZSkgKiBzaWduYWwtPmNoYW5uZWxzICogc2FtcGxlcyk7DQo+ID4gIA0KPiA+IC0JZm9yIChp
ID0gMDsgaSA8IHNpZ25hbC0+Y2hhbm5lbHM7IGkrKykNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBz
aWduYWwtPmNoYW5uZWxzOyBpKyspIHsNCj4gPiAgCQlmcmVxc19wZXJfY2hhbm5lbFtpXSA9IGF1
ZGlvX3NpZ25hbF9jb3VudF9mcmVxcyhzaWduYWwsIGkpOw0KPiA+ICsJCWlndF9hc3NlcnQoZnJl
cXNfcGVyX2NoYW5uZWxbaV0pOw0KPiANCj4gSU1PLCBhZGRpbmcgPiAwIHdvdWxkIGJlIGNsZWFy
ZXIuDQoNCkFoLiBJIHByZWZlciBhZGRpbmcgZXhwbGljaXQgY29uZGl0aW9ucyBsaWtlIHRoaXMg
dG9vLCBidXQgSSBoYWQgYQ0KZmVlbGluZyB0aGUgaGFyZGNvcmUgY29tcHV0ZXIgdG91Y2hlcnMg
b3V0IHRoZXJlIHdvdWxkbid0IGxpa2UgaXQuIDopDQoNCldpbGwgY2hhbmdlIGl0Lg0KDQo+IFdp
dGggdGhpcyBkb25lLCB0aGUgc2VyaWVzIGlzOg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQ
ZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+ID4gKwl9DQo+ID4gIA0K
PiA+ICAJZm9yIChpID0gMDsgaSA8IHNpZ25hbC0+ZnJlcXNfY291bnQ7IGkrKykgew0KPiA+ICAJ
CWZyZXEgPSAmc2lnbmFsLT5mcmVxc1tpXTsNCj4gPiANCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
