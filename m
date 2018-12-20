Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229B6E37C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Dec 2018 12:22:24 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Thu, 20 Dec 2018 12:22:21 +0000
Message-ID: <1437a2e82045a0a94d1f396c3c6ef58a5237b899.camel@intel.com>
References: <20181220121517.28078-1-petri.latvala@intel.com>
In-Reply-To: <20181220121517.28078-1-petri.latvala@intel.com>
Content-Language: en-US
Content-ID: <8F7F38371ED8004784B072AA7A0A8045@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/fb: Remove unused variables
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE4LTEyLTIwIGF0IDE0OjE1ICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiAuLi9saWIvaWd0X2ZiLmM6IEluIGZ1bmN0aW9uIOKAmGNvbnZlcnRfcmdiMjRfdG9feXV2NDQ0
4oCZOg0KPiAuLi9saWIvaWd0X2ZiLmM6MTcyMDoxNjogd2FybmluZzogdW51c2VkIHZhcmlhYmxl
IOKAmHbigJkgWy1XdW51c2VkLQ0KPiB2YXJpYWJsZV0NCj4gICAgIGZsb2F0IHksIHUsIHY7DQo+
ICAgICAgICAgICBeDQo+IC4uL2xpYi9pZ3RfZmIuYzoxNzIwOjEzOiB3YXJuaW5nOiB1bnVzZWQg
dmFyaWFibGUg4oCYdeKAmSBbLVd1bnVzZWQtDQo+IHZhcmlhYmxlXQ0KPiAgICAgZmxvYXQgeSwg
dSwgdjsNCj4gICAgICAgICAgICAgIF4NCj4gLi4vbGliL2lndF9mYi5jOjE3MjA6MTA6IHdhcm5p
bmc6IHVudXNlZCB2YXJpYWJsZSDigJh54oCZIFstV3VudXNlZC0NCj4gdmFyaWFibGVdDQo+ICAg
ICBmbG9hdCB5LCB1LCB2Ow0KPiAgICAgICAgICAgICAgICAgXg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQo+IENjOiBTdGFuaXNs
YXYgTGlzb3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4NCj4gQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0K
PiAgbGliL2lndF9mYi5jIHwgMSAtDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYw0KPiBpbmRleCA1
NzI2NDg0NC4uMmY1NTVjOTUgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZmIuYw0KPiArKysgYi9s
aWIvaWd0X2ZiLmMNCj4gQEAgLTE3MTcsNyArMTcxNyw2IEBAIHN0YXRpYyB2b2lkIGNvbnZlcnRf
cmdiMjRfdG9feXV2NDQ0KHN0cnVjdA0KPiBmYl9jb252ZXJ0ICpjdnQpDQo+ICAJCWZvciAoaiA9
IDA7IGogPCBjdnQtPmRzdC5mYi0+d2lkdGg7IGorKykgew0KPiAgCQkJc3RydWN0IGlndF92ZWM0
IHJnYjsNCj4gIAkJCXN0cnVjdCBpZ3RfdmVjNCB5dXY7DQo+IC0JCQlmbG9hdCB5LCB1LCB2Ow0K
PiAgDQo+ICAJCQlyZWFkX3JnYigmcmdiLCAmcmdiMjRbaSAqIHJnYjI0X3N0cmlkZSArIGogKg0K
PiA0XSk7DQo+ICANCg0KVGhhbmtzIGZvciBzcG90dGluZy4NCg0KUmV2aWV3ZWQtYnk6IFN0YW5p
c2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPg0KDQotLSANCkJl
c3QgUmVnYXJkcywNCg0KTGlzb3Zza2l5IFN0YW5pc2xhdgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
