Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D68910F425
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 12:51:44 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Wed, 27 Apr 2022 12:51:42 +0000
Message-ID: <240f3034311550e750089204c380864346f1056b.camel@intel.com>
References: <20220427120406.1485871-1-jouni.hogander@intel.com>
In-Reply-To: <20220427120406.1485871-1-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0008A08CCE3A244A951C39734269FD66@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] kms_psr2_su: Use FB_DAMAGE_CLIPS only
 when supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTA0LTI3IGF0IDE1OjA0ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEN1cnJlbnRseSB3ZSBhcmUgc2VlaW5nIGZhaWx1cmVzIGluIElDTCBwbGF0Zm9ybXMgZHVl
IHRvDQo+IG1pc3Npbmcgc3VwcG9ydCBmb3IgSUdUX1BMQU5FX0ZCX0RBTUFHRV9DTElQUy4gVXNl
DQo+IElHVF9QTEFORV9GQl9EQU1BR0VfQ0xJUFMgb25seSBpZiBpdCBpcyBzdXBwb3J0ZWQNCj4g
DQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lz
c3Vlcy80MTQ4DQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2
YWxhQGludGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2k5MTUva21zX3BzcjJfc3UuYyB8IDE2ICsrKysr
KysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUva21zX3BzcjJfc3UuYyBiL3Rl
c3RzL2k5MTUva21zX3BzcjJfc3UuYw0KPiBpbmRleCA0NzRiMWRmZC4uY2FjY2Y3MTMgMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2k5MTUva21zX3BzcjJfc3UuYw0KPiArKysgYi90ZXN0cy9pOTE1L2tt
c19wc3IyX3N1LmMNCj4gQEAgLTE2OCwxNyArMTY4LDIxIEBAIHN0YXRpYyBib29sIHVwZGF0ZV9z
Y3JlZW5fYW5kX3Rlc3QoZGF0YV90ICpkYXRhKQ0KPiAgDQo+ICAJc3dpdGNoIChkYXRhLT5vcCkg
ew0KPiAgCWNhc2UgUEFHRV9GTElQOiB7DQo+IC0JCXN0cnVjdCBkcm1fbW9kZV9yZWN0IGNsaXA7
DQo+ICAJCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KPiAgDQo+IC0JCWNsaXAueDEgPSBjbGlwLnkx
ID0gU1FVQVJFX09GRlNFVDsNCj4gLQkJY2xpcC54MiA9IGNsaXAueTIgPSBTUVVBUkVfT0ZGU0VU
ICsgU1FVQVJFX1NJWkU7DQo+IC0NCj4gIAkJcHJpbWFyeSA9IGlndF9vdXRwdXRfZ2V0X3BsYW5l
X3R5cGUoZGF0YS0+b3V0cHV0LA0KPiAgCQkJCQkJICAgIERSTV9QTEFORV9UWVBFX1BSSU1BUlkp
Ow0KPiAgDQo+IC0JCWlndF9wbGFuZV9yZXBsYWNlX3Byb3BfYmxvYihwcmltYXJ5LCBJR1RfUExB
TkVfRkJfREFNQUdFX0NMSVBTLA0KPiAtCQkJCQkgICAgJmNsaXAsIHNpemVvZihjbGlwKSk7DQo+
ICsJCWlmIChpZ3RfcGxhbmVfaGFzX3Byb3AocHJpbWFyeSwgSUdUX1BMQU5FX0ZCX0RBTUFHRV9D
TElQUykpIHsNCj4gKwkJCXN0cnVjdCBkcm1fbW9kZV9yZWN0IGNsaXA7DQo+ICsNCj4gKwkJCWNs
aXAueDEgPSBjbGlwLnkxID0gU1FVQVJFX09GRlNFVDsNCj4gKwkJCWNsaXAueDIgPSBjbGlwLnky
ID0gU1FVQVJFX09GRlNFVCArIFNRVUFSRV9TSVpFOw0KPiArDQo+ICsJCQlpZ3RfcGxhbmVfcmVw
bGFjZV9wcm9wX2Jsb2IocHJpbWFyeSwgSUdUX1BMQU5FX0ZCX0RBTUFHRV9DTElQUywNCj4gKwkJ
CQkJCSAgICAmY2xpcCwgc2l6ZW9mKGNsaXApKTsNCj4gKwkJfQ0KPiArDQo+ICAJCWlndF9wbGFu
ZV9zZXRfZmIocHJpbWFyeSwgJmRhdGEtPmZiW2RhdGEtPnNjcmVlbl9jaGFuZ2VzICYgMV0pOw0K
PiAgCQlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBDT01NSVRfQVRPTUlDKTsN
Cj4gIAkJYnJlYWs7DQoNCg==
