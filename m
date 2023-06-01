Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4EC10E22F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:11:47 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 10:11:43 +0000
Message-ID: <c4c378943e9e1196ab5a9a8548a8af6e3e3b602b.camel@intel.com>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
 <20230601050928.2487611-3-kunal1.joshi@intel.com>
In-Reply-To: <20230601050928.2487611-3-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1AEF37BB62B1E4E9882ED2B7B93514F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] RFC Added is_xe to check if xe
 device
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

SGVsbG8gS3VuYWwsDQoNClBsZWFzZSBjaGVjayBteSBjb21tZW50IGJlbG93Lg0KDQpPbiBUaHUs
IDIwMjMtMDYtMDEgYXQgMTA6MzkgKzA1MzAsIEt1bmFsIEpvc2hpIHdyb3RlOg0KPiBBZGRlZCBp
c194ZSBmb3IgdGVzdCB0byBoYXZlIFhFIGNoZWNrcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3Vu
YWwgSm9zaGkgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoHRlc3RzL2k5MTUv
a21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCA4ICsrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUva21zX2Zy
b250YnVmZmVyX3RyYWNraW5nLmMNCj4gYi90ZXN0cy9pOTE1L2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jDQo+IGluZGV4IGMyYjk5NjcwLi4zYmVmNDZiNiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMv
aTkxNS9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiArKysgYi90ZXN0cy9pOTE1L2ttc19m
cm9udGJ1ZmZlcl90cmFja2luZy5jDQo+IEBAIC0zMDksNiArMzA5LDggQEAgc3RydWN0IHsNCj4g
wqDCoMKgwqDCoMKgwqDCoC5zdG9wID0gdHJ1ZSwNCj4gwqB9Ow0KPiDCoA0KPiArc3RhdGljIGJv
b2wgaXNfeGU7DQoNCk1heWJlIHlvdSBjb3VsZCBqdXN0IGRyb3AgdGhpcyBhbmQgdXNlIGlzX3hl
X2RldmljZSgpIHdoZXJlIHlvdSBuZWVkIHRvDQpkaWZmZXJlbnRpYXRlPw0KDQo+ICsNCj4gwqBz
dGF0aWMgZHJtTW9kZU1vZGVJbmZvICpnZXRfY29ubmVjdG9yX3NtYWxsZXN0X21vZGUoaWd0X291
dHB1dF90DQo+ICpvdXRwdXQpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgZHJtTW9kZUNvbm5l
Y3RvciAqYyA9IG91dHB1dC0+Y29uZmlnLmNvbm5lY3RvcjsNCj4gQEAgLTEzNDEsNiArMTM0Mywx
MiBAQCBzdGF0aWMgdm9pZCBzZXR1cF9kcm0odm9pZCkNCj4gwqDCoMKgwqDCoMKgwqDCoGRybS5m
ZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVMIHwgRFJJVkVSX1hFKTsNCj4g
wqDCoMKgwqDCoMKgwqDCoGRybS5kZWJ1Z2ZzID0gaWd0X2RlYnVnZnNfZGlyKGRybS5mZCk7DQo+
IMKgDQo+ICvCoMKgwqDCoMKgwqDCoC8qDQo+ICvCoMKgwqDCoMKgwqDCoCAqIFRlc3QgaGFzIFhF
IGNoZWNrcyBhcyB3ZSBkb24ndCBoYXZlIGdlbSBJT0NUTFMNCj4gK8KgwqDCoMKgwqDCoMKgICog
b24gWEUgdXNlZCBpbiB0aGlzIHRlc3QsIGZvciBub3cgaWdub3JlIGl0IGlmIFhFDQo+ICvCoMKg
wqDCoMKgwqDCoCAqLw0KPiArwqDCoMKgwqDCoMKgwqBpc194ZSA9IGlzX3hlX2RldmljZShkcm0u
ZmQpOw0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqBrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2Rl
KCk7DQo+IMKgwqDCoMKgwqDCoMKgwqBpZ3RfZGlzcGxheV9yZXF1aXJlKCZkcm0uZGlzcGxheSwg
ZHJtLmZkKTsNCj4gwqANCg0K
