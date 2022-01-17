Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168A210E1F0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jan 2022 13:37:54 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 17 Jan 2022 13:37:42 +0000
Message-ID: <214d3f980835274b5a2993793a0f24cbe7f447fa.camel@intel.com>
References: <20220117133246.33810-1-jouni.hogander@intel.com>
In-Reply-To: <20220117133246.33810-1-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E534B31DB156A4F9C3A8DFFA6F71F6B@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] kms_psr2_su: Fix igt_fixture handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAxLTE3IGF0IDE1OjMyICswMjAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IElndF9maXh0dXJlIGlzIGluIGEgbG9vcCBmb3IgZGlmZmVyZW50IG9wZXJhdGlvbnMuIFRo
aXMgaXMgY2F1c2luZw0KPiBkaXNwbGF5X2ZpbmkgYmVpbmcgY2FsbGVkIGF0IHRoZSBlbmQgb2Yg
ZWFjaCBpdGVyYXRpb24gYW5kDQo+IHRyaWdnZXJpbmcgU0lHU0VHVi4gRml4IHRoaXMgYnkgcmVt
b3ZpbmcgaWd0X2ZpeHR1cmUgb3V0IGZyb20NCj4gdGhlIGxvb3AuDQo+IA0KPiBGaXhlczogNmJl
OGZlZWIxNDhlICh0ZXN0cy9rbXNfcHNyMl9zdTogYWRkIGJpcGxhbmFyIHNlbGVjdGl2ZSB1cGRh
dGUgdGVzdHMpDQoNClNob3VsZCBiZToNCg0KRml4ZXM6IDZiZThmZWViMTQ4ZSAoInRlc3RzL2tt
c19wc3IyX3N1OiBhZGQgYmlwbGFuYXIgc2VsZWN0aXZlIHVwZGF0ZSB0ZXN0cyIpDQoNCkFuZCBp
ZiB5b3Ugd2FudCB0byBDQyBwZW9wbGUgeW91IHNob3VsZCBhZGQ6DQoNCkNjOiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4NCkNjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KT3RoZXIgdGhhbiBhYm92ZSB0aGUgcGF0Y2ggbGd0
bS4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2k5MTUva21zX3BzcjJfc3UuYyB8IDkgKysr
Ky0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUva21zX3BzcjJfc3UuYyBiL3Rlc3RzL2k5
MTUva21zX3BzcjJfc3UuYw0KPiBpbmRleCBkNzlhMWU1OC4uNDc0YjFkZmQgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2k5MTUva21zX3BzcjJfc3UuYw0KPiArKysgYi90ZXN0cy9pOTE1L2ttc19wc3Iy
X3N1LmMNCj4gQEAgLTMyNywxMCArMzI3LDkgQEAgaWd0X21haW4NCj4gIAkJCQljbGVhbnVwKCZk
YXRhKTsNCj4gIAkJCX0NCj4gIAkJfQ0KPiAtDQo+IC0JCWlndF9maXh0dXJlIHsNCj4gLQkJCWNs
b3NlKGRhdGEuZGVidWdmc19mZCk7DQo+IC0JCQlkaXNwbGF5X2ZpbmkoJmRhdGEpOw0KPiAtCQl9
DQo+ICsJfQ0KPiArCWlndF9maXh0dXJlIHsNCj4gKwkJY2xvc2UoZGF0YS5kZWJ1Z2ZzX2ZkKTsN
Cj4gKwkJZGlzcGxheV9maW5pKCZkYXRhKTsNCj4gIAl9DQo+ICB9DQoNCg==
