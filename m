Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3B892B6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 16:58:18 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 8 Sep 2021 16:57:42 +0000
Message-ID: <13f36df25dd3bda350f200aaca8365dfc0316b7d.camel@intel.com>
References: <20210907180130.43156-1-jose.souza@intel.com>
 <YTiGuZskUmWyiuHD@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YTiGuZskUmWyiuHD@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA88F4C6CA3A10498921E98E11A34268@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] tests/kms_cursor_legacy: Handle
 cursor movements as slow patch for display 9+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTA5LTA4IGF0IDEyOjQ3ICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBPbiBUdWUsIFNlcCAwNywgMjAyMSBhdCAxMTowMToyN0FNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IGk5MTUgaXMgZHJvcHBpbmcgZnJvbnRidWZmZXIgcmVuZGVy
aW5nIHN1cHBvcnQgZm9yIGRpc3BsYXkgOSsgc28NCj4gPiB0aGlzIGV2YXNpb24gYXR0ZW1wdHMg
d2lsbCBuZXZlciBoYXBwZW4gYXMgRFJNX0lPQ1RMX01PREVfQ1VSU09SIHdpbGwNCj4gPiBiZSBj
b252ZXJ0ZWQgdG8gYXRvbWljIGNvbW1pdHMgdGhhdCB3aWxsIGJlIGV4ZWN1dGVkIGR1cmluZyB2
YmxhbmtzLg0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gTm90IHVzaW5nIGRhdGEgZmlsZWQgYnkgZml4
dHVyZSB0byBnZW5lcmF0ZSBzdWJ0ZXN0IGxpc3QgKFBldHJpKQ0KPiA+IA0KPiA+IENjOiBQZXRy
aSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4NCj4gPiBDYzogR3dhbi1neWVvbmcg
TXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0
ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jIHwgMjQgKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyBiL3Rlc3RzL2tt
c19jdXJzb3JfbGVnYWN5LmMNCj4gPiBpbmRleCAwZjBkZjk1MWIuLjNkZGVhOWMzNSAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jDQo+ID4gKysrIGIvdGVzdHMva21z
X2N1cnNvcl9sZWdhY3kuYw0KPiA+IEBAIC0zMDMsOCArMzAzLDEzIEBAIGVudW0gZmxpcF90ZXN0
IHsNCj4gPiAgCWZsaXBfdGVzdF9sYXN0ID0gZmxpcF90ZXN0X2F0b21pY190cmFuc2l0aW9uc192
YXJ5aW5nX3NpemUNCj4gPiAgfTsNCj4gPiAgDQo+ID4gLXN0YXRpYyBib29sIGN1cnNvcl9zbG93
cGF0aChlbnVtIGZsaXBfdGVzdCBtb2RlKQ0KPiA+ICtzdGF0aWMgYm9vbCBjdXJzb3Jfc2xvd3Bh
dGgoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgZW51bSBmbGlwX3Rlc3QgbW9kZSkNCj4gPiAgew0K
PiA+ICsJLyogSW50ZWwgZGlzcGxheSA5IGFuZCBuZXdlciB3aWxsIGhhbmRsZSBjdXJzb3IgbW92
ZW1lbnQgYXMgZmFzdHNldHMgKi8NCj4gPiArCWlmIChpc19pOTE1X2RldmljZShkaXNwbGF5LT5k
cm1fZmQpICYmDQo+ID4gKwkgICAgaW50ZWxfZGlzcGxheV92ZXIoaW50ZWxfZ2V0X2RybV9kZXZp
ZChkaXNwbGF5LT5kcm1fZmQpKSA+PSA5KQ0KPiA+ICsJICAgIHJldHVybiB0cnVlOw0KPiANCj4g
DQo+IFdoYXQgaXMgdGhlIG1lYW5pbmcgb2YgdGhlIHJldHVybiB2YWx1ZSBvZiBjdXJzb3Jfc2xv
d3BhdGgoKT8gIlRoaXMNCj4gd2lsbCB0YWtlIHRoZSBzbG93IHBhdGgiPyBJZiBzbywgdGhlIGNv
bW1lbnQgYW5kIHRoZSBjb2RlIGFyZSBzYXlpbmcNCj4gb3Bwb3NpdGUgdGhpbmdzLi4uDQoNClRo
ZSBzbG93IHBhdGggaXMgYSBmYXN0c2V0LCB0aGUgJ2Zhc3QgcGF0aCcgd291bGQgYmUgZG8gYSBm
cm9udCBidWZmZXIgcmVuZGVyaW5nIGJ1dCB0aGUgc2Vjb25kIGlzIGJlaW5nIGRyb3BwZWQgZm9y
IFNLTCsuDQoNCj4gDQo+IA0KDQo=
