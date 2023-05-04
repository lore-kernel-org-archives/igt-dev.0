Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2538410E531
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 21:21:20 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 4 May 2023 21:21:17 +0000
Message-ID: <DM4PR11MB63603BB909F2D44DF13FCA83F46D9@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
 <20230411161555.10001-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/9] tests/kms_color: Use legacy LUT
 for chopping off the lsbs
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
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlIFN5cmph
bGENCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTEsIDIwMjMgOTo0NiBQTQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpLWct
dCB2MiAxLzldIHRlc3RzL2ttc19jb2xvcjogVXNlIGxlZ2FjeSBMVVQgZm9yIGNob3BwaW5nDQo+
IG9mZiB0aGUgbHNicw0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFRyeWluZyB0byB1c2UgYW4gaW50ZXJwb2xhdGVkIGdh
bW1hIG1vZGUgKGFzIGlzIHRoZSBjYXNlIGN1cnJlbnRseSBvbiBlZy4gaWNsL3RnbCkgZm9yDQo+
IGNob3BwaW5nIG9mZiB0aGUgbHNicyBkb2Vzbid0IHJlYWxseSB3b3JrLiBVc2UgdGhlIGxlZ2Fj
eSBMVVQgaW5zdGVhZC4gQWxzbyBnZXQgcmlkIG9mDQo+IHRoZSBkZWdhbW1hIExVVCBhcyB0aGF0
IGNhbid0IGV2ZW4gYmUgZW5hYmxlZCBhbG9nbnNpZGUgdGhlIGxlZ2FjeSBMVVQgb24gc3BsaXQN
Cj4gZ2FtbWEgaTkxNSBwbGF0Zm9ybXMgKGl2Yi1za2wpLg0KDQpMb29rcyBHb29kIHRvIG1lLg0K
UmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfY29sb3IuYyB8IDUgKy0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY29sb3IuYyBiL3Rlc3RzL2ttc19jb2xvci5jIGluZGV4DQo+IGNkMDNjMTM1NGMw
YS4uMzY5ZGM4MDU3ZDgzIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfY29sb3IuYw0KPiArKysg
Yi90ZXN0cy9rbXNfY29sb3IuYw0KPiBAQCAtNTA0LDEzICs1MDQsMTAgQEAgc3RhdGljIGJvb2wg
dGVzdF9waXBlX2N0bShkYXRhX3QgKmRhdGEsDQo+ICAJICogcm91bmRpbmcgaXNzdWVzIGFuZCBp
bmFjY3VyYWNpZXMgbGVhZGluZyB0byBjcmMgbWlzbWF0Y2guDQo+ICAJICovDQo+ICAJaWYgKGlz
X2k5MTVfZGV2aWNlKGRhdGEtPmRybV9mZCkgJiYgbWVtY21wKGJlZm9yZSwgYWZ0ZXIsDQo+IHNp
emVvZihjb2xvcl90KSkpIHsNCj4gLQkJaWd0X3JlcXVpcmUoaWd0X3BpcGVfb2JqX2hhc19wcm9w
KHByaW1hcnktPnBpcGUsDQo+IElHVF9DUlRDX0RFR0FNTUFfTFVUKSk7DQo+ICAJCWlndF9yZXF1
aXJlKGlndF9waXBlX29ial9oYXNfcHJvcChwcmltYXJ5LT5waXBlLA0KPiBJR1RfQ1JUQ19HQU1N
QV9MVVQpKTsNCj4gDQo+IC0JCWRlZ2FtbWFfbGluZWFyID0gZ2VuZXJhdGVfdGFibGUoZGF0YS0+
ZGVnYW1tYV9sdXRfc2l6ZSwgMS4wKTsNCj4gLQkJZ2FtbWFfbGluZWFyID0gZ2VuZXJhdGVfdGFi
bGUoZGF0YS0+Z2FtbWFfbHV0X3NpemUsIDEuMCk7DQo+ICsJCWdhbW1hX2xpbmVhciA9IGdlbmVy
YXRlX3RhYmxlKDI1NiwgMS4wKTsNCj4gDQo+IC0JCXNldF9kZWdhbW1hKGRhdGEsIHByaW1hcnkt
PnBpcGUsIGRlZ2FtbWFfbGluZWFyKTsNCj4gIAkJc2V0X2dhbW1hKGRhdGEsIHByaW1hcnktPnBp
cGUsIGdhbW1hX2xpbmVhcik7DQo+ICAJfQ0KPiANCj4gLS0NCj4gMi4zOS4yDQoNCg==
