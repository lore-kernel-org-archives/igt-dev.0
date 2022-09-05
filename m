Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C0D10E150
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 06:02:42 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 5 Sep 2022 06:02:35 +0000
Message-ID: <MWHPR1101MB2157F28D1EFF6B435DE9E99EEF7F9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220905044221.30116-1-karthik.b.s@intel.com>
In-Reply-To: <20220905044221.30116-1-karthik.b.s@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/mtl: Use same path for MTL as DG2
 for draw_rect_blt()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCIFMsIEthcnRoaWsgPGthcnRo
aWsuYi5zQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgNSwgMjAyMiA3OjQy
IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSGVpa2tpbGEs
IEp1aGEtcGVra2EgPGp1aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPjsgS2Fob2xhLCBNaWth
DQo+IDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gbGli
L210bDogVXNlIHNhbWUgcGF0aCBmb3IgTVRMIGFzIERHMiBmb3IgZHJhd19yZWN0X2JsdCgpDQo+
IA0KPiBGcm9tOiBKdWhhLVBla2thIEhlaWtraWzDpCA8anVoYS1wZWtrYS5oZWlra2lsYUBpbnRl
bC5jb20+DQo+IA0KPiBUaGlzIGlzIGR1ZSB0byBsZWdhY3kgY29tbWFuZHMgYXJlIG5vIGxvbmdl
ciBTdXBwb3J0ZWQgaW4gTVRMKw0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWth
LmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2ls
w6QgPGp1aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfZHJh
dy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kcmF3LmMgYi9saWIvaWd0X2RyYXcuYyBp
bmRleCAwNTYxMDFiOS4uMTEyNGNhZGMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZHJhdy5jDQo+
ICsrKyBiL2xpYi9pZ3RfZHJhdy5jDQo+IEBAIC02NjYsNyArNjY2LDcgQEAgc3RhdGljIHZvaWQg
ZHJhd19yZWN0X2JsdChpbnQgZmQsIHN0cnVjdCBjbWRfZGF0YQ0KPiAqY21kX2RhdGEsDQo+ICAJ
aWJiID0gaW50ZWxfYmJfY3JlYXRlKGZkLCBQQUdFX1NJWkUpOw0KPiAgCWludGVsX2JiX2FkZF9p
bnRlbF9idWYoaWJiLCBkc3QsIHRydWUpOw0KPiANCj4gLQlpZiAoSVNfREcyKGludGVsX2dldF9k
cm1fZGV2aWQoZmQpKSkgew0KPiArCWlmIChIQVNfNFRJTEUoaW50ZWxfZ2V0X2RybV9kZXZpZChm
ZCkpKSB7DQo+ICAJCWludCBidWZfaGVpZ2h0ID0gYnVmLT5zaXplIC8gYnVmLT5zdHJpZGU7DQo+
IA0KPiAgCQlzd2l0Y2ggKGJ1Zi0+YnBwKSB7DQo+IC0tDQo+IDIuMjIuMA0KDQo=
