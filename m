Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474EC10E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 11:44:07 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Apr 2022 11:44:05 +0000
Message-ID: <b9029f12efeb4bd9aa09fe6fd96acff4@intel.com>
References: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_big_fb: move start
 of crc calculation past first commit
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS0NCj4gUGVra2Eg
SGVpa2tpbGENCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDcsIDIwMjIgOTozOCBQTQ0KPiBUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW2lndC1kZXZdIFtQQVRD
SCBpLWctdCAxLzJdIHRlc3RzL2k5MTUva21zX2JpZ19mYjogbW92ZSBzdGFydCBvZiBjcmMNCj4g
Y2FsY3VsYXRpb24gcGFzdCBmaXJzdCBjb21taXQNCj4gDQo+IEZpcnN0IGNvbW1pdCBtYXkgY2F1
c2UgbW9kZXNldCBvbiB0d28gcGlwZXMgd2hpY2ggY2FuIG9uIHNvbWUgbWFjaGluZXMNCj4gdGFr
ZSBlbm91Z2ggdGltZSB0byBmaWxsIHVwIGNyYyBidWZmZXIgb24gb25lIHBpcGUgY2F1c2luZyBj
cmMgYnVmZmVyIG92ZXJmbG93DQo+IG1lc3NhZ2VzLiBNb3ZlZCBjcmMgY2FsY3VsYXRpb24gc3Rh
cnQgcGFzdCBmaXJzdCBjb21taXQgdG8gYXZvaWQgdGhlc2UNCj4gbWVzc2FnZXMuDQo+IA0KDQpS
ZXZpZXdlZC1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIHRlc3RzL2k5MTUva21zX2JpZ19mYi5jIHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaTkxNS9rbXNfYmlnX2ZiLmMgYi90ZXN0cy9pOTE1L2ttc19iaWdfZmIuYyBpbmRl
eA0KPiA4NzI0ZDYwNjkuLmI3YmNjMzQwMSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaTkxNS9rbXNf
YmlnX2ZiLmMNCj4gKysrIGIvdGVzdHMvaTkxNS9rbXNfYmlnX2ZiLmMNCj4gQEAgLTM3MCwxMiAr
MzcwLDEyIEBAIHN0YXRpYyBib29sIHRlc3RfcGxhbmUoZGF0YV90ICpkYXRhKQ0KPiAgCQkgKiBy
ZW5kZXJpbmcgcGlwZWxpbmUgaW50cm9kdWNlcyBzbGlnaHQgZGlmZmVyZW5jZXMgaW50bw0KPiAg
CQkgKiB0aGUgcmVzdWx0IGlmIHdlIHRyeSB0aGF0LCBhbmQgc28gdGhlIGNyYyB3aWxsIG5vdCBt
YXRjaC4NCj4gIAkJICovDQo+IC0JCWlndF9waXBlX2NyY19zdGFydChkYXRhLT5waXBlX2NyYyk7
DQo+ICAJCWNvcHlfcGF0dGVybihkYXRhLCBzbWFsbF9mYiwgMCwgMCwgYmlnX2ZiLCB4LCB5LA0K
PiAgCQkJICAgICBzbWFsbF9mYi0+d2lkdGgsIHNtYWxsX2ZiLT5oZWlnaHQpOw0KPiANCj4gIAkJ
aWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgZGF0YS0+ZGlzcGxheS5pc19hdG9t
aWMgPw0KPiAgCQkJCSAgICBDT01NSVRfQVRPTUlDIDogQ09NTUlUX1VOSVZFUlNBTCk7DQo+ICsJ
CWlndF9waXBlX2NyY19zdGFydChkYXRhLT5waXBlX2NyYyk7DQo+ICAJCWlndF9waXBlX2NyY19n
ZXRfY3VycmVudChkYXRhLT5kaXNwbGF5LmRybV9mZCwgZGF0YS0NCj4gPnBpcGVfY3JjLCAmc21h
bGxfY3JjKTsNCj4gDQo+ICAJCWlndF9wbGFuZV9zZXRfZmIocGxhbmUsIGJpZ19mYik7DQo+IC0t
DQo+IDIuMjguMA0KDQo=
