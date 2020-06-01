Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B964089ABA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2020 16:46:49 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 1 Jun 2020 16:46:48 +0000
Message-ID: <f055b75fa91f79c66af624a0f0ba5bc5f71406cc.camel@intel.com>
References: <20200530011613.45991-1-jose.souza@intel.com>
 <20200530011613.45991-2-jose.souza@intel.com>
 <20200601081826.GF9497@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200601081826.GF9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <CF0FE0BBB477CF4CBD1207017F64DBB4@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Print debugfs
 when skipping test
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTA2LTAxIGF0IDExOjE4ICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBPbiBGcmksIE1heSAyOSwgMjAyMCBhdCAwNjoxNjoxM1BNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IFRoaXMgdGVzdHMgaXMgYmVpbmcgc3BvcmFkaWNhbGx5IHNr
aXBwZWQgaW4gQ0kgYXMgaXQgaXMgbm90IGR1ZQ0KPiA+ICJQU1Igc2luayBub3QgcmVsaWFibGU6
IHllcyIgbGV0cyBwcmludCB0aGUgaTkxNV9lZHBfcHNyX3N0YXR1cyB0bw0KPiA+IGZpbmQgb3V0
IHRoZSByZWFzb24uDQo+ID4gVGhpcyBjYW4gYmUgcmV2ZXJ0ZWQgYWZ0ZXJ3YXJkcy4NCj4gPiAN
Cj4gPiBSZWZlcmVuY2U6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50ZWwv
LS9pc3N1ZXMvMTkxMQ0KPiA+IENjOiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBp
bnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi9pZ3RfcHNyLmMgICAgICAgfCAx
MyArKysrKysrKysrKysrDQo+ID4gIGxpYi9pZ3RfcHNyLmggICAgICAgfCAgMSArDQo+ID4gIHRl
c3RzL2ttc19wc3IyX3N1LmMgfCAgMiArKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3Rf
cHNyLmMNCj4gPiBpbmRleCA5NTZmNjIxOWMuLjhjMmY0Y2U2YyAxMDA2NDQNCj4gPiAtLS0gYS9s
aWIvaWd0X3Bzci5jDQo+ID4gKysrIGIvbGliL2lndF9wc3IuYw0KPiA+IEBAIC0yMjksMyArMjI5
LDE2IEBAIGJvb2wgcHNyMl93YWl0X3N1KGludCBkZWJ1Z2ZzX2ZkLCB1aW50MTZfdCAqbnVtX3N1
X2Jsb2NrcykNCj4gPiAgew0KPiA+ICAJcmV0dXJuIGlndF93YWl0KHBzcjJfcmVhZF9sYXN0X251
bV9zdV9ibG9ja3NfdmFsKGRlYnVnZnNfZmQsIG51bV9zdV9ibG9ja3MpLCA0MCwgMSk7DQo+ID4g
IH0NCj4gPiArDQo+ID4gK3ZvaWQgcHNyX3ByaW50X2RlYnVnZnMoaW50IGRlYnVnZnNfZmQpDQo+
ID4gK3sNCj4gPiArCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07DQo+ID4gKwlpbnQgcmV0
Ow0KPiA+ICsNCj4gPiArCXJldCA9IGlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQs
ICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwgYnVmLA0KPiA+ICsJCQkJICAgICAgc2l6ZW9mKGJ1Zikp
Ow0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWlndF9k
ZWJ1ZygiJXMiLCBidWYpOw0KPiANCj4gRG9lcyB0aGUgYnVmIGFsd2F5cyBoYXZlIGEgbmV3bGlu
ZSBoZXJlPyBFdmVuIHdoZW4gdGhlIGZpbGUgaGFzDQo+IGV4YWN0bHkgUFNSX1NUQVRVU19NQVhf
TEVOIGJ5dGVzPw0KDQppOTE1X2VkcF9wc3Jfc3RhdHVzIGlzIGFsd2F5cyBzbWFsbGVyIHRoYW4g
UFNSX1NUQVRVU19NQVhfTEVOIG90aGVyd2lzZSBpdCB3b3VsZCBicmVhayB0ZXN0cyBhbmQgaXQg
ZW5kcyB3aXRoICJcbiIgYnV0IEkgY2FuIGFkZCBpdCB0b28uDQoNCj4gDQo+IA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
