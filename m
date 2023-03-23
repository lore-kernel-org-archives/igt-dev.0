Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303E410E463
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 07:43:31 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 07:43:27 +0000
Message-ID: <DM4PR11MB6312C198ECD11440E90784FC90879@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230323073739.553919-1-jouni.hogander@intel.com>
In-Reply-To: <20230323073739.553919-1-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
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

Q2FuIHdlIHNldCBkaXNwbGF5X3Jlc2V0IGJlZm9yZSBzZXR0aW5nIHBpcGUgPz8gDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMywgMjAyMyAxOjA4
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSG9nYW5kZXIs
IEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+OyBCLCBKZWV2YW4NCj4gPGplZXZhbi5i
QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10XSB0ZXN0cy9pOTE1L2ttc19wc3Iy
X3NmOiBGaXggY2xlYW51cA0KPiANCj4gQ2xlYW51cCBpcyBsZWF2aW5nIHBpcGUgcmVzZXJ2ZWQu
IFRoaXMgaXMgY2F1c2luZyBmYWlsdXJlcyBsaWtlOg0KPiANCj4gaWd0X2ttcy1DUklUSUNBTDog
RFAtMSBhbmQgZURQLTEgYXJlIGJvdGggdHJ5aW5nIHRvIHVzZSBwaXBlIEENCj4gDQo+IEZpeCBi
eSBzZXR0aW5nIHBpcGUgb2Ygb3V0cHV0IGFzIFBJUEVfTk9ORS4NCj4gDQo+IENjOiBKZWV2YW4g
QiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2Fu
ZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaTkxNS9rbXNf
cHNyMl9zZi5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9rbXNfcHNyMl9z
Zi5jIGIvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5jIGluZGV4DQo+IDJkNzYxZDMxLi40YTg2MDhj
MSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaTkxNS9rbXNfcHNyMl9zZi5jDQo+ICsrKyBiL3Rlc3Rz
L2k5MTUva21zX3BzcjJfc2YuYw0KPiBAQCAtODQ2LDEwICs4NDYsMTAgQEAgc3RhdGljIHZvaWQg
Y2xlYW51cChkYXRhX3QgKmRhdGEpDQo+ICAJCWlndF9wbGFuZV9zZXRfZmIoc3ByaXRlLCBOVUxM
KTsNCj4gIAl9DQo+IA0KPiAtCWlmIChkYXRhLT5jb2V4aXN0X2ZlYXR1cmUgJiBGRUFUVVJFX0RT
Qykgew0KPiArCWlmIChkYXRhLT5jb2V4aXN0X2ZlYXR1cmUgJiBGRUFUVVJFX0RTQykNCj4gIAkJ
cmVzdG9yZV9mb3JjZV9kc2NfZW4oKTsNCj4gLQkJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQs
IFBJUEVfTk9ORSk7DQo+IC0JfQ0KPiArDQo+ICsJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQs
IFBJUEVfTk9ORSk7DQo+IA0KPiAgCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXks
IENPTU1JVF9BVE9NSUMpOw0KPiANCj4gLS0NCj4gMi4zNC4xDQoNCg==
