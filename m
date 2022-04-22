Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3866310E0FE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 11:44:30 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Apr 2022 11:44:28 +0000
Message-ID: <638d5a2c162d48a8805796667b744cd0@intel.com>
References: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
 <20220407183733.7329-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220407183733.7329-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_big_fb: Don't fill
 small fb during test setup
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
SCBpLWctdCAyLzJdIHRlc3RzL2k5MTUva21zX2JpZ19mYjogRG9uJ3QgZmlsbCBzbWFsbCBmYg0K
PiBkdXJpbmcgdGVzdCBzZXR1cA0KPiANCj4gQ2hhbmdlIHNtYWxsIGZiIG5vdCB0byBiZSBmaWxs
ZWQgd2l0aCBncmVlbiBjb2xvciwgdGhpcyB3aWxsIG5ldmVyIHNob3cgYW55d2hlcmUNCj4gYW5k
IGp1c3QgdGFrZSB0aW1lIHdoaWxlIHNldHRpbmcgdXAgdGVzdC4NCj4gDQoNClJldmlld2VkLWJ5
OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6
IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IC0t
LQ0KPiAgdGVzdHMvaTkxNS9rbXNfYmlnX2ZiLmMgfCA1ICsrLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUva21zX2JpZ19mYi5jIGIvdGVzdHMvaTkxNS9rbXNfYmlnX2ZiLmMgaW5kZXgNCj4g
YjdiY2MzNDAxLi43YTg1MDQwMTcgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2k5MTUva21zX2JpZ19m
Yi5jDQo+ICsrKyBiL3Rlc3RzL2k5MTUva21zX2JpZ19mYi5jDQo+IEBAIC00MjAsOSArNDIwLDgg
QEAgc3RhdGljIGJvb2wgdGVzdF9waXBlKGRhdGFfdCAqZGF0YSkNCj4gIAlpZiAoaWd0X3JvdGF0
aW9uXzkwX29yXzI3MChkYXRhLT5yb3RhdGlvbikpDQo+ICAJCWlndF9zd2FwKHdpZHRoLCBoZWln
aHQpOw0KPiANCj4gLQlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRhdGEtPmRybV9mZCwgd2lkdGgsIGhl
aWdodCwNCj4gLQkJCSAgICBkYXRhLT5mb3JtYXQsIGRhdGEtPm1vZGlmaWVyLA0KPiAtCQkJICAg
IDAsIDEsIDAsICZkYXRhLT5zbWFsbF9mYik7DQo+ICsJaWd0X2NyZWF0ZV9mYihkYXRhLT5kcm1f
ZmQsIHdpZHRoLCBoZWlnaHQsDQo+ICsJCSAgICAgIGRhdGEtPmZvcm1hdCwgZGF0YS0+bW9kaWZp
ZXIsICZkYXRhLT5zbWFsbF9mYik7DQo+IA0KPiAgCWlndF9vdXRwdXRfc2V0X3BpcGUoZGF0YS0+
b3V0cHV0LCBkYXRhLT5waXBlKTsNCj4gDQo+IC0tDQo+IDIuMjguMA0KDQo=
