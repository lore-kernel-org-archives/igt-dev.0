Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870710E076
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 10:09:57 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 28 Jul 2023 10:09:48 +0000
Message-ID: <BYAPR11MB3413CB306E629AE9F7460869D006A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230622054543.3360732-1-jouni.hogander@intel.com>
 <20230622054543.3360732-4-jouni.hogander@intel.com>
In-Reply-To: <20230622054543.3360732-4-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 3/4] lib/xe/xe_spin: Handle spinner
 timer for Xe as well
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDIyLCAy
MDIzIDExOjE2IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
SG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBDaCwgU2FpIEdvd3Ro
YW0NCj4gPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10
IHY2IDMvNF0gbGliL3hlL3hlX3NwaW46IEhhbmRsZSBzcGlubmVyIHRpbWVyIGZvciBYZSBhcyB3
ZWxsDQo+IA0KPiBDdXJyZW50IHNwaW5uZXIgaW1wbGVtZW50YXRpb24gZm9yIFhlIGRvZXNuJ3Qg
c3VwcG9ydCBzZXR0aW5nIHRpbWVvdXQuIEZpeCB0aGlzDQo+IGJ5IGhhbmRsaW5nIHRpbWVycyBz
YW1lIHdheSBhcyBmb3IgaTkxNSBhcyB3ZWxsLg0KPiANCj4gQ2M6IFNhaSBHb3d0aGFtIENoIDxz
YWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7Zn
YW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUveGVfc3Bp
bi5jIHwgOCArKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9zcGluLmMgYi9saWIveGUveGVfc3Bpbi5jIGluZGV4
IDlmNTExZTE0Zi4uZDhjNjY1ZjM5DQo+IDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfc3Bpbi5j
DQo+ICsrKyBiL2xpYi94ZS94ZV9zcGluLmMNCj4gQEAgLTExNSw2ICsxMTUsNyBAQCB4ZV9zcGlu
X2NyZWF0ZShpbnQgZmQsIGNvbnN0IHN0cnVjdCBpZ3Rfc3Bpbl9mYWN0b3J5DQo+ICpvcHQpDQo+
ICAJc3Bpbi0+c3luY29iaiA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsNCj4gIAlzcGluLT52bSA9
IG9wdC0+dm07DQo+ICAJc3Bpbi0+ZW5naW5lID0gb3B0LT5lbmdpbmU7DQo+ICsJc3Bpbi0+dGlt
ZXJmZCA9IC0xOw0KPiANCj4gIAlpZiAoIXNwaW4tPnZtKQ0KPiAgCQlzcGluLT52bSA9IHhlX3Zt
X2NyZWF0ZShmZCwgMCwgMCk7DQo+IEBAIC0xNjMsNiArMTY0LDEzIEBAIHZvaWQgeGVfc3Bpbl9z
eW5jX3dhaXQoaW50IGZkLCBzdHJ1Y3QgaWd0X3NwaW4gKnNwaW4pDQo+IHZvaWQgeGVfc3Bpbl9m
cmVlKGludCBmZCwgc3RydWN0IGlndF9zcGluICpzcGluKSAgew0KPiAgCWlndF9hc3NlcnQoc3Bp
bi0+ZHJpdmVyID09IElOVEVMX0RSSVZFUl9YRSk7DQo+ICsNCj4gKwlpZiAoc3Bpbi0+dGltZXJm
ZCA+PSAwKSB7DQo+ICsJCXB0aHJlYWRfY2FuY2VsKHNwaW4tPnRpbWVyX3RocmVhZCk7DQo+ICsJ
CWlndF9hc3NlcnQocHRocmVhZF9qb2luKHNwaW4tPnRpbWVyX3RocmVhZCwgTlVMTCkgPT0gMCk7
DQo+ICsJCWNsb3NlKHNwaW4tPnRpbWVyZmQpOw0KPiArCX0NCj4gKw0KTEdUTQ0KUmV2aWV3ZWQt
Ynk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQoNCj4gIAl4ZV9z
cGluX2VuZChzcGluLT54ZV9zcGluKTsNCj4gIAl4ZV9zcGluX3N5bmNfd2FpdChmZCwgc3Bpbik7
DQo+ICAJeGVfdm1fdW5iaW5kX3N5bmMoZmQsIHNwaW4tPnZtLCAwLCBzcGluLT5hZGRyZXNzLCBz
cGluLT5ib19zaXplKTsNCj4gLS0NCj4gMi4zNC4xDQoNCg==
