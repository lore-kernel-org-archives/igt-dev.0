Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86926E512
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 06:44:34 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Date: Thu, 26 Aug 2021 06:44:30 +0000
Message-ID: <PH0PR11MB5595B7EA82814461FC6157A8D0C79@PH0PR11MB5595.namprd11.prod.outlook.com>
References: <20210826062714.4885-1-arjun.melkaveri@intel.com>
In-Reply-To: <20210826062714.4885-1-arjun.melkaveri@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_nop: Resolve
 missing context id in sequential test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IE1lbGthdmVy
aSwgQXJqdW4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAyNiwgMjAyMSAxMTo1NyBBTQ0KPiBU
bzogTWVsa2F2ZXJpLCBBcmp1biA8YXJqdW4ubWVsa2F2ZXJpQGludGVsLmNvbT47IGlndC0NCj4g
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbaWd0LWRldl0gW1BBVENIIGkt
Zy10XSB0ZXN0cy9pOTE1L2dlbV9leGVjX25vcDogUmVzb2x2ZSBtaXNzaW5nDQo+IGNvbnRleHQg
aWQgaW4gc2VxdWVudGlhbCB0ZXN0DQo+IA0KPiBSZXNvbHZlZCBtaXNzaW5nIGNvbnRleHQgaWQg
aW4gZXhlYyBidWYsIGZvciBzZXF1ZW50aWFsIHRlc3QuDQo+IFRoaXMgd2FzIGR1ZSB0byBjb250
ZXh0IG11dGF0aW9uIGNoYW5nZXMgdGhhdCB3YXMgaW1wbGVtZXRlZCBpbg0KPiBnZW1fZXhlY19u
b3AuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcmp1biBNZWxrYXZlcmkgPGFyanVuLm1lbGthdmVy
aUBpbnRlbC5jb20+DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19ub3AuYyB8IDEgKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aTkxNS9nZW1fZXhlY19ub3AuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbm9wLmMgaW5kZXgNCj4g
MDlhMGMyOWUuLmM0MzUzMzViIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX25v
cC5jDQo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbm9wLmMNCj4gQEAgLTc0OSw2ICs3NDks
NyBAQCBzdGF0aWMgdm9pZCBzZXF1ZW50aWFsKGludCBmZCwgdWludDMyX3QgaGFuZGxlLA0KPiAg
CWV4ZWNidWYuYnVmZmVyX2NvdW50ID0gMjsNCj4gIAlleGVjYnVmLmZsYWdzIHw9IEk5MTVfRVhF
Q19IQU5ETEVfTFVUOw0KPiAgCWV4ZWNidWYuZmxhZ3MgfD0gSTkxNV9FWEVDX05PX1JFTE9DOw0K
PiArCWV4ZWNidWYucnN2ZDEgPSBjdHgtPmlkOyANCj4gIAlpZ3RfcmVxdWlyZShfX2dlbV9leGVj
YnVmKGZkLCAmZXhlY2J1ZikgPT0gMCk7DQo+IA0KPiAgCWlmIChmbGFncyAmIENPTlRFWFQpIHsg
DQo+IC0tDQo+IDIuMjUuMQ0KDQpBY2tlZC1ieTogQ2ggU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFt
LmNoQGludGVsLmNvbT4NCg0KDQo=
