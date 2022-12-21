Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378210E118
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Dec 2022 06:51:57 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Date: Wed, 21 Dec 2022 06:51:52 +0000
Message-ID: <BYAPR11MB34793FDD350680C04C8AD513D9EB9@BYAPR11MB3479.namprd11.prod.outlook.com>
References: <20221220070717.4757-1-dominik.karol.piatkowski@intel.com>
 <20221220070717.4757-3-dominik.karol.piatkowski@intel.com>
 <20221220204013.o6iiykwxrwzf5dxg@zkempczy-mobl2>
In-Reply-To: <20221220204013.o6iiykwxrwzf5dxg@zkempczy-mobl2>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/api_intel_allocator:
 Fixed start offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2VtcGN6eW5za2ksIFpi
aWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDIwLCAyMDIyIDIxOjQwDQo+IFRvOiBQaWF0a293c2tpLCBEb21pbmlrIEthcm9s
IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAyLzJdIHRlc3Rz
L2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvcjogRml4ZWQgc3RhcnQNCj4gb2Zmc2V0DQo+IA0KPiBP
biBUdWUsIERlYyAyMCwgMjAyMiBhdCAwODowNzoxN0FNICswMTAwLCBEb21pbmlrIEthcm9sIFBp
YXRrb3dza2kgd3JvdGU6DQo+ID4gSXQgaXMgc2FmZXIgdG8gdXNlIGludGVsX2FsbG9jYXRvcl9n
ZXRfYWRkcmVzc19yYW5nZSB0aGFuIGFyYml0cmFyeQ0KPiA+IGhhcmRjb2RlZCBzdGFydCBvZmZz
ZXQgdGhhdCBtYXkgYmUgdG9vIGxvdy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsg
S2Fyb2wgUGlhdGtvd3NraQ0KPiA+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29t
Pg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICstLS0tLSB3aHkgdGhlcmUncyBtaXNzaW5nIMSFPw0KSSBkaWRu
J3Qgbm90aWNlIHRoYXQgdW50aWwgbm93OyBpdCBjYW4gYmUgY2hhbmdlZCwgdGhvdWdoLg0KRG9t
aW5payBLYXJvbA0KDQo+IA0KPiAtLQ0KPiBaYmlnbmlldw0KPiANCj4gPiBDYzogWmJpZ25pZXcg
S2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gIHRlc3RzL2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jIHwgMyArKy0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jDQo+ID4gYi90ZXN0cy9pOTE1
L2FwaV9pbnRlbF9hbGxvY2F0b3IuYw0KPiA+IGluZGV4IDg3YWJkOTAwLi5lOTAzOWEyMSAxMDA2
NDQNCj4gPiAtLS0gYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9hbGxvY2F0b3IuYw0KPiA+ICsrKyBi
L3Rlc3RzL2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jDQo+ID4gQEAgLTk2LDkgKzk2LDEwIEBA
IHN0YXRpYyB2b2lkIHJlc2VydmVfc2ltcGxlKGludCBmZCkgIHN0YXRpYyB2b2lkDQo+ID4gcmVz
ZXJ2ZShpbnQgZmQsIHVpbnQ4X3QgdHlwZSkgIHsNCj4gPiAgCXN0cnVjdCB0ZXN0X29iaiBvYmo7
DQo+ID4gLQl1aW50NjRfdCBhaG5kLCBvZmZzZXQgPSAweDQwMDAwLCBzaXplID0gMHgxMDAwOw0K
PiA+ICsJdWludDY0X3QgYWhuZCwgb2Zmc2V0LCBzaXplID0gMHgxMDAwOw0KPiA+DQo+ID4gIAlh
aG5kID0gaW50ZWxfYWxsb2NhdG9yX29wZW4oZmQsIDAsIHR5cGUpOw0KPiA+ICsJaW50ZWxfYWxs
b2NhdG9yX2dldF9hZGRyZXNzX3JhbmdlKGFobmQsICZvZmZzZXQsIE5VTEwpOw0KPiA+DQo+ID4g
IAlpZ3RfYXNzZXJ0X2VxKGludGVsX2FsbG9jYXRvcl9yZXNlcnZlKGFobmQsIDAsIHNpemUsIG9m
ZnNldCksIHRydWUpOw0KPiA+ICAJLyogdHJ5IG92ZXJsYXBwaW5nIHdvbid0IHN1Y2NlZWQgKi8N
Cj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
