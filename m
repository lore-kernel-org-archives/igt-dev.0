Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9703910E7A3
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 05:41:11 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 26 May 2023 05:41:01 +0000
Message-ID: <DM6PR11MB4492D8F9A6CCA5707EC0A0078D479@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
 <20230525193411.174802-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230525193411.174802-3-zbigniew.kempczynski@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe_intel_bb: Skip on
 platforms without render engine
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFpiaWduaWV3
IEtlbXBjenluc2tpDQo+IFNlbnQ6IDI2IE1heSAyMDIzIDAxOjA0IEFNDQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbaWd0LWRldl0gW1BBVENIIGktZy10
IDIvMl0gdGVzdHMveGVfaW50ZWxfYmI6IFNraXAgb24gcGxhdGZvcm1zDQo+IHdpdGhvdXQgcmVu
ZGVyIGVuZ2luZQ0KPiANCj4gUnVubmluZyByZW5kZXIgdGVzdCBvbiBwbGF0Zm9ybXMgd2l0aG91
dCAzZCBlbmdpbmUgZG9lc24ndCBtYWtlIHNlbnNlLg0KPiBVc2UgYWRkZWQgY2hlY2sgYW5kIHNr
aXAgb24gc3VjaCBwbGF0Zm9ybXMgdG8gYXZvaWQgdGhlIG5vaXNlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+DQo+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5j
b20+DQo+IC0tLQ0KPiAgdGVzdHMveGUveGVfaW50ZWxfYmIuYyB8IDIgKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy94ZS94ZV9p
bnRlbF9iYi5jIGIvdGVzdHMveGUveGVfaW50ZWxfYmIuYyBpbmRleA0KPiAzNWQ2MTYwOGUxLi40
Y2RjMDQzNDVhIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy94ZS94ZV9pbnRlbF9iYi5jDQo+ICsrKyBi
L3Rlc3RzL3hlL3hlX2ludGVsX2JiLmMNCj4gQEAgLTExNjgsNiArMTE2OCw4IEBAIGlndF9tYWlu
X2FyZ3MoImRwaWIiLCBOVUxMLCBoZWxwX3N0ciwNCj4gb3B0X2hhbmRsZXIsIE5VTEwpDQo+ICAJ
CWZ1bGxfYmF0Y2goYm9wcyk7DQo+IA0KPiAgCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pYygicmVu
ZGVyIikgew0KPiArCQlpZ3RfcmVxdWlyZSh4ZV9oYXNfZW5naW5lX2NsYXNzKHhlLA0KPiBEUk1f
WEVfRU5HSU5FX0NMQVNTX1JFTkRFUikpOw0KPiArDQo+ICAJCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKHRlc3RzKTsgaSsrKSB7DQo+ICAJCQljb25zdCBzdHJ1Y3QgdGVzdCAqdCA9ICZ0ZXN0
c1tpXTsNCj4gDQo+IC0tDQpMR1RNDQpSZXZpZXdlZC1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxQ
cml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiAyLjM0LjENCg0K
