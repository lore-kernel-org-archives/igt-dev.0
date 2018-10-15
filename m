Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C398907B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 21:40:21 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 15 Oct 2018 21:40:19 +0000
Message-ID: <7445650fc8cc7474cfee4bd657ec59da483d8403.camel@intel.com>
References: <20181005080802.11082-1-chris@chris-wilson.co.uk>
In-Reply-To: <20181005080802.11082-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Content-ID: <2C818F439B681248B46145C4BA2DF0CA@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/chamelium: Check
 drmModeGetResources()
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE4LTEwLTA1IGF0IDA5OjA4ICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IElmIEtNUyBpcyBub3QgYXZhaWxhYmxlLCBkcm1Nb2RlR2V0UmVzb3VyZXMoKSByZXBvcnRzIE5V
TEwgYW5kIHNvIHdlDQo+IGNhbm5vdCB1c2UgdGhpcyBkZXZpY2UgdG8gZmluZCB0aGUgY2hhbWVs
aXVtIGNvbm5lY3Rvci4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gLS0tDQo+ICBsaWIvaWd0X2NoYW1lbGl1bS5j
IHwgNyArKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY2hhbWVsaXVtLmMgYi9saWIvaWd0
X2NoYW1lbGl1bS5jDQo+IGluZGV4IGZlNWM0ZGFjLi4zMTUwZjYwOSAxMDA2NDQNCj4gLS0tIGEv
bGliL2lndF9jaGFtZWxpdW0uYw0KPiArKysgYi9saWIvaWd0X2NoYW1lbGl1bS5jDQo+IEBAIC0x
NDIyLDYgKzE0MjIsMTAgQEAgc3RhdGljIGJvb2wNCj4gY2hhbWVsaXVtX3JlYWRfcG9ydF9tYXBw
aW5ncyhzdHJ1Y3QgY2hhbWVsaXVtICpjaGFtZWxpdW0sDQo+ICAJaW50IHBvcnRfaSwgaSwgajsN
Cj4gIAlib29sIHJldCA9IHRydWU7DQo+ICANCj4gKwlyZXMgPSBkcm1Nb2RlR2V0UmVzb3VyY2Vz
KGRybV9mZCk7DQo+ICsJaWYgKCFyZXMpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiAgCWdy
b3VwX2xpc3QgPSBnX2tleV9maWxlX2dldF9ncm91cHMoaWd0X2tleV9maWxlLCBOVUxMKTsNCj4g
IA0KPiAgCS8qIENvdW50IGhvdyBtYW55IGNvbm5lY3RvciBtYXBwaW5ncyBhcmUgc3BlY2lmaWVk
IGluIHRoZQ0KPiBjb25maWcgKi8NCj4gQEAgLTE0MzMsNyArMTQzNyw2IEBAIHN0YXRpYyBib29s
IGNoYW1lbGl1bV9yZWFkX3BvcnRfbWFwcGluZ3Moc3RydWN0DQo+IGNoYW1lbGl1bSAqY2hhbWVs
aXVtLA0KPiAgCWNoYW1lbGl1bS0+cG9ydHMgPSBjYWxsb2Moc2l6ZW9mKHN0cnVjdCBjaGFtZWxp
dW1fcG9ydCksDQo+ICAJCQkJICBjaGFtZWxpdW0tPnBvcnRfY291bnQpOw0KPiAgCXBvcnRfaSA9
IDA7DQo+IC0JcmVzID0gZHJtTW9kZUdldFJlc291cmNlcyhkcm1fZmQpOw0KPiAgDQo+ICAJZm9y
IChpID0gMDsgZ3JvdXBfbGlzdFtpXSAhPSBOVUxMOyBpKyspIHsNCj4gIAkJZ3JvdXAgPSBncm91
cF9saXN0W2ldOw0KPiBAQCAtMTQ5NCw4ICsxNDk3LDggQEAgc3RhdGljIGJvb2wgY2hhbWVsaXVt
X3JlYWRfcG9ydF9tYXBwaW5ncyhzdHJ1Y3QNCj4gY2hhbWVsaXVtICpjaGFtZWxpdW0sDQo+ICAJ
fQ0KPiAgDQo+ICBvdXQ6DQo+IC0JZHJtTW9kZUZyZWVSZXNvdXJjZXMocmVzKTsNCj4gIAlnX3N0
cmZyZWV2KGdyb3VwX2xpc3QpOw0KPiArCWRybU1vZGVGcmVlUmVzb3VyY2VzKHJlcyk7DQo+ICAN
Cj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
