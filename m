Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0A66E088
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 08:00:53 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 13 Aug 2019 08:00:51 +0000
Message-ID: <ef8213d9b77d0a39e4e58856b300183c5c355675.camel@intel.com>
References: <20190806210227.28141-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190806210227.28141-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Content-ID: <45C509DD0E11184C8206E223AE27D578@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] kms_ccs: Add the missing '\n' for
 igt_require_f
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
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDIyOjAyICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IEN1cnJlbnRseSB0aGUgcnVubmVyIHNlZXMNCj4gDQo+IFN0YXJ0aW5nIHN1YnRlc3Q6IHBpcGUt
Qy1iYWQtYXV4LXN0cmlkZQ0KPiBUZXN0IHJlcXVpcmVtZW50IG5vdCBtZXQgaW4gZnVuY3Rpb24g
dGVzdF9vdXRwdXQsIGZpbGUNCj4gLi4vdGVzdHMva21zX2Njcy5jOjMyNDoNCj4gVGVzdCByZXF1
aXJlbWVudDogdmFsaWRfdGVzdHMgPiAwDQo+IENDUyBub3Qgc3VwcG9ydGVkLCBza2lwcGluZ1N1
YnRlc3QgcGlwZS1DLWJhZC1hdXgtc3RyaWRlOiBTS0lQDQo+ICgwLjMzMHMpDQo+IA0KPiBhbmQg
bWFuYWdlcyB0byBleHBsb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+DQoNClJldmlld2VkLWJ5OiBTaW1vbiBTZXIgPHNpbW9u
LnNlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICB0ZXN0cy9rbXNfY2NzLmMgfCA1ICsrKy0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jY3MuYyBiL3Rlc3RzL2ttc19jY3MuYw0KPiBpbmRleCA2
Y2QzMGFhZDguLjFjZTY2Y2RlYyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2Njcy5jDQo+ICsr
KyBiL3Rlc3RzL2ttc19jY3MuYw0KPiBAQCAtMzIxLDcgKzMyMSw3IEBAIHN0YXRpYyBpbnQgX190
ZXN0X291dHB1dChkYXRhX3QgKmRhdGEpDQo+ICBzdGF0aWMgdm9pZCB0ZXN0X291dHB1dChkYXRh
X3QgKmRhdGEpDQo+ICB7DQo+ICAJaW50IHZhbGlkX3Rlc3RzID0gX190ZXN0X291dHB1dChkYXRh
KTsNCj4gLQlpZ3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzID4gMCwgIkNDUyBub3Qgc3VwcG9ydGVk
LCBza2lwcGluZyIpOw0KPiArCWlndF9yZXF1aXJlX2YodmFsaWRfdGVzdHMgPiAwLCAiQ0NTIG5v
dCBzdXBwb3J0ZWQsDQo+IHNraXBwaW5nXG4iKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGRhdGFf
dCBkYXRhOw0KPiBAQCAtMzczLDcgKzM3Myw4IEBAIGlndF9tYWluDQo+ICAJCQkJdmFsaWRfdGVz
dHMgKz0gX190ZXN0X291dHB1dCgmZGF0YSk7DQo+ICAJCQl9DQo+ICANCj4gLQkJCWlndF9yZXF1
aXJlX2YodmFsaWRfdGVzdHMgPiAwLCAiQ0NTIG5vdA0KPiBzdXBwb3J0ZWQsIHNraXBwaW5nIik7
DQo+ICsJCQlpZ3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzID4gMCwNCj4gKwkJCQkgICAgICAiQ0NT
IG5vdCBzdXBwb3J0ZWQsIHNraXBwaW5nXG4iKTsNCj4gIAkJfQ0KPiAgDQo+ICAJCWRhdGEucGxh
bmUgPSBOVUxMOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
