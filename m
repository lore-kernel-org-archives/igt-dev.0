Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117106E554
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 05:03:59 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 18 Oct 2021 05:03:56 +0000
Message-ID: <DM8PR11MB5719E66BAF31A1C82AB621498DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
 <20211013125949.19373-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tests/kms_concurrent: Use preferred
 modes's vrefresh
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgVmlsbGUNCj4gU3lyamFsYQ0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIg
MTMsIDIwMjEgNjozMCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpLWctdCA3LzddIHRlc3RzL2ttc19jb25jdXJyZW50
OiBVc2UgcHJlZmVycmVkDQo+IG1vZGVzJ3MgdnJlZnJlc2gNCj4gDQo+IEZyb206IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBpOTE1IHdpbGwg
cmVqZWN0IGN1c3RvbSBtb2RlcyB0aGF0IGRvbid0IG1hdGNoIHRoZSBsYXB0b3ANCj4gcGFuZWwn
cyBmaXhlZCBtb2RlIHJlZnJlc2ggcmF0ZS4gVGh1cyB3ZSBtdXN0IGdlbmVyYXRlDQo+IG91ciBv
dmVycmlkZSBtb2RlcyB3aXRoIGEgbWF0Y2hpbmcgcmVmcmVzaCByYXRlLg0KPiANCj4gQ2xvc2Vz
OiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzQyODQN
Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4NCiANCkxHVE0NClJldmlld2VkLWJ5OiBCaGFudXByYWthc2ggTW9kZW0gPGJoYW51
cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQoNCi0gQmhhbnUNCg0KPiAtLS0NCj4gIHRlc3RzL2tt
c19jb25jdXJyZW50LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29uY3VycmVudC5j
IGIvdGVzdHMva21zX2NvbmN1cnJlbnQuYw0KPiBpbmRleCAwODVlYWEwYTYzMGQuLjFiOGY0YjA0
MzU2YiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2NvbmN1cnJlbnQuYw0KPiArKysgYi90ZXN0
cy9rbXNfY29uY3VycmVudC5jDQo+IEBAIC0yNDAsNyArMjQwLDcgQEAgZ2V0X2xvd3Jlc19tb2Rl
KGRhdGFfdCAqZGF0YSwgY29uc3QgZHJtTW9kZU1vZGVJbmZvDQo+ICptb2RlX2RlZmF1bHQsDQo+
ICAJCQlyZXR1cm4gaWd0X21lbWR1cChtb2RlLCBzaXplb2YoKm1vZGUpKTsNCj4gIAl9DQo+IA0K
PiAtCXJldHVybiBpZ3Rfc3RkXzEwMjRfbW9kZV9nZXQoNjApOw0KPiArCXJldHVybiBpZ3Rfc3Rk
XzEwMjRfbW9kZV9nZXQoaWd0X291dHB1dF9wcmVmZXJyZWRfdnJlZnJlc2gob3V0cHV0KSk7DQo+
ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQNCj4gLS0NCj4gMi4zMi4wDQoNCg==
