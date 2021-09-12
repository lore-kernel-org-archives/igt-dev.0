Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3486E02A
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Sep 2021 15:30:25 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Sun, 12 Sep 2021 15:30:23 +0000
Message-ID: <DM8PR11MB57198943DA86AEBDD36CAFA88DD89@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
 <20210903162743.29851-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903162743.29851-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/7] tests/kms_color_chamelium:
 Remove invalid LUT size tests
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

PiBGcm9tOiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4g
U2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMywgMjAyMSA5OjU4IFBNDQo+IFRvOiBpZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTW9kZW0sIEJoYW51cHJha2FzaCA8YmhhbnVwcmFr
YXNoLm1vZGVtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDEvN10gdGVz
dHMva21zX2NvbG9yX2NoYW1lbGl1bTogUmVtb3ZlIGludmFsaWQgTFVUDQo+IHNpemUgdGVzdHMN
Cj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+DQo+IA0KPiBUaGVyZSBpcyB6ZXJvIHBvaW50IGluIGR1cGxpY2F0aW5nIHRoZSBpbnZhbGlk
IExVVCBzaXplIHRlc3RzDQo+IGluIHRoZSBjaGFtZWxpdW0gdGVzdC4gR2V0IHJpZCBvZiB0aGVt
Lg0KPiANCj4gQ2M6IEJoYW51cHJha2FzaCBNb2RlbSA8QmhhbnVwcmFrYXNoLm1vZGVtQGludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4NCg0KTEdUTSANClJldmlld2VkLWJ5OiBCaGFudXByYWthc2ggTW9kZW0g
PGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQoNCi1CaGFudQ0KDQo+IC0tLQ0KPiAgdGVz
dHMva21zX2NvbG9yX2NoYW1lbGl1bS5jIHwgMTEgLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29sb3Jf
Y2hhbWVsaXVtLmMgYi90ZXN0cy9rbXNfY29sb3JfY2hhbWVsaXVtLmMNCj4gaW5kZXggYmM0MzU2
YmZhYjZhLi45Nzc0MWI5Yzk2OGUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19jb2xvcl9jaGFt
ZWxpdW0uYw0KPiArKysgYi90ZXN0cy9rbXNfY29sb3JfY2hhbWVsaXVtLmMNCj4gQEAgLTc1Miwx
NyArNzUyLDYgQEAgaWd0X21haW4NCj4gIAlmb3JfZWFjaF9waXBlX3N0YXRpYyhwaXBlKQ0KPiAg
CQlpZ3Rfc3VidGVzdF9ncm91cA0KPiAgCQkJcnVuX3Rlc3RzX2Zvcl9waXBlKCZkYXRhLCBwaXBl
KTsNCj4gLQlpZ3RfZGVzY3JpYmUoIk5lZ2F0aXZlIHRlc3QgY2FzZSBnYW1tYSBsdXQgc2l6ZSIp
Ow0KPiAtCWlndF9zdWJ0ZXN0X2YoInBpcGUtaW52YWxpZC1nYW1tYS1sdXQtc2l6ZXMiKQ0KPiAt
CQlpbnZhbGlkX2dhbW1hX2x1dF9zaXplcygmZGF0YSk7DQo+IC0NCj4gLQlpZ3RfZGVzY3JpYmUo
Ik5lZ2F0aXZlIHRlc3QgY2FzZSBkZWdhbW1hIGx1dCBzaXplIik7DQo+IC0JaWd0X3N1YnRlc3Rf
ZigicGlwZS1pbnZhbGlkLWRlZ2FtbWEtbHV0LXNpemVzIikNCj4gLQkJaW52YWxpZF9kZWdhbW1h
X2x1dF9zaXplcygmZGF0YSk7DQo+IC0NCj4gLQlpZ3RfZGVzY3JpYmUoIk5lZ2F0aXZlIHRlc3Qg
Y2FzZSBjdG0gbWF0cml4IHNpemUiKTsNCj4gLQlpZ3Rfc3VidGVzdF9mKCJwaXBlLWludmFsaWQt
Y3RtLW1hdHJpeC1zaXplcyIpDQo+IC0JCWludmFsaWRfY3RtX21hdHJpeF9zaXplcygmZGF0YSk7
DQo+IA0KPiAgCWlndF9maXh0dXJlIHsNCj4gIAkJaWd0X2Rpc3BsYXlfZmluaSgmZGF0YS5kaXNw
bGF5KTsNCj4gLS0NCj4gMi4zMS4xDQoNCg==
