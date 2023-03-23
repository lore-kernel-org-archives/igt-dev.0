Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D52B10E46D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 07:47:14 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Date: Thu, 23 Mar 2023 07:46:49 +0000
Message-ID: <9d27a515b6f8616c8843022b677190fabc92085f.camel@intel.com>
References: <20230323073739.553919-1-jouni.hogander@intel.com>
 <DM4PR11MB6312C198ECD11440E90784FC90879@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312C198ECD11440E90784FC90879@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <84857E2735850B48ABCC3195F54272B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_psr2_sf: Fix cleanup
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

T24gVGh1LCAyMDIzLTAzLTIzIGF0IDA3OjQzICswMDAwLCBCLCBKZWV2YW4gd3JvdGU6DQo+IENh
biB3ZSBzZXQgZGlzcGxheV9yZXNldCBiZWZvcmUgc2V0dGluZyBwaXBlID8/IA0KDQpJIGRvbid0
IGtub3cgYWJvdXQgdGhhdCwgYnV0IGxvZ2ljYWxseSBhcyBwcmVwYXJlIGlzIHNldHRpbmcgcGlw
ZSBmb3INCm91dHB1dCBJIHdvdWxkIGV4cGVjdCBjbGVhbnVwIHRvIHJlbGVhc2UgaXQuDQogDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSG9nYW5kZXIsIEpv
dW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDIzLCAyMDIzIDE6MDggUE0NCj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gPiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBCLCBK
ZWV2YW4NCj4gPiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCBpLWct
dF0gdGVzdHMvaTkxNS9rbXNfcHNyMl9zZjogRml4IGNsZWFudXANCj4gPiANCj4gPiBDbGVhbnVw
IGlzIGxlYXZpbmcgcGlwZSByZXNlcnZlZC4gVGhpcyBpcyBjYXVzaW5nIGZhaWx1cmVzIGxpa2U6
DQo+ID4gDQo+ID4gaWd0X2ttcy1DUklUSUNBTDogRFAtMSBhbmQgZURQLTEgYXJlIGJvdGggdHJ5
aW5nIHRvIHVzZSBwaXBlIEENCj4gPiANCj4gPiBGaXggYnkgc2V0dGluZyBwaXBlIG9mIG91dHB1
dCBhcyBQSVBFX05PTkUuDQo+ID4gDQo+ID4gQ2M6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5j
b20+DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqB0ZXN0cy9pOTE1L2ttc19wc3IyX3NmLmMg
fCA2ICsrKy0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5j
IGIvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5jDQo+ID4gaW5kZXgNCj4gPiAyZDc2MWQzMS4uNGE4
NjA4YzEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5jDQo+ID4gKysr
IGIvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5jDQo+ID4gQEAgLTg0NiwxMCArODQ2LDEwIEBAIHN0
YXRpYyB2b2lkIGNsZWFudXAoZGF0YV90ICpkYXRhKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWd0X3BsYW5lX3NldF9mYihzcHJpdGUsIE5VTEwpOw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqB9DQo+ID4gDQo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKGRhdGEtPmNvZXhpc3RfZmVh
dHVyZSAmIEZFQVRVUkVfRFNDKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGRhdGEtPmNvZXhp
c3RfZmVhdHVyZSAmDQo+ID4gRkVBVFVSRV9EU0MpaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xMTU1MzIvwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJlc3RvcmVfZm9yY2VfZHNjX2VuKCk7DQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBQSVBFX05PTkUpOw0KPiA+IC3CoMKg
wqDCoMKgwqDCoH0NCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWd0X291dHB1dF9zZXRfcGlw
ZShvdXRwdXQsIFBJUEVfTk9ORSk7DQo+ID4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlndF9kaXNw
bGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIENPTU1JVF9BVE9NSUMpOw0KPiA+IA0KPiA+IC0t
DQo+ID4gMi4zNC4xDQo+IA0KDQo=
