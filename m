Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC701127F8
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 09:45:59 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 7 Jun 2022 09:45:55 +0000
Message-ID: <MWHPR1101MB2157115ADE492D90CD765235EFA59@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_ccs: Fix 4tiled rc
 ccs and color clear tests
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
SGVpa2tpbGENCj4gU2VudDogTW9uZGF5LCBKdW5lIDYsIDIwMjIgMTI6MDUgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFUQ0gg
aS1nLXQgMS8yXSB0ZXN0cy9pOTE1L2ttc19jY3M6IEZpeCA0dGlsZWQgcmMgY2NzIGFuZA0KPiBj
b2xvciBjbGVhciB0ZXN0cw0KPiANCj4gNHRpbGVkIHJjIGNjcyBhbmQgY29sb3IgY2xlYXIgdGVz
dHMgd2VyZSB0ZXN0aW5nIHdyb25nIHRoaW5ncyBiZWNhdXNlIHdyb25nDQo+IG1vZGlmaWVyIHdh
cyB1c2VkIGZvciBjaG9vc2luZyB0ZXN0IHBhdGguDQo+IA0KDQpSZXZpZXdlZC1ieTogTWlrYSBL
YWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBl
a2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiAtLS0NCj4gIHRl
c3RzL2k5MTUva21zX2Njcy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9rbXNfY2Nz
LmMgYi90ZXN0cy9pOTE1L2ttc19jY3MuYyBpbmRleA0KPiAzOWJmNmQ1OGIuLjRkZjYxMWY3NyAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaTkxNS9rbXNfY2NzLmMNCj4gKysrIGIvdGVzdHMvaTkxNS9r
bXNfY2NzLmMNCj4gQEAgLTE2MSw3ICsxNjEsNyBAQCBjcmVhdGVfZmJfcHJlcGFyZV9hZGQoaW50
IGRybV9mZCwgaW50IHdpZHRoLCBpbnQgaGVpZ2h0LA0KPiBzdGF0aWMgYm9vbCBpc19jY3NfY2Nf
bW9kaWZpZXIodWludDY0X3QgbW9kaWZpZXIpICB7DQo+ICAJcmV0dXJuIG1vZGlmaWVyID09IEk5
MTVfRk9STUFUX01PRF9ZX1RJTEVEX0dFTjEyX1JDX0NDU19DQw0KPiB8fA0KPiAtCQltb2RpZmll
ciA9PSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9ERzJfUkNfQ0NTOw0KPiArCQltb2RpZmllciA9
PSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRF9ERzJfUkNfQ0NTX0NDOw0KPiAgfQ0KPiANCj4gIC8q
DQo+IC0tDQo+IDIuMjguMA0KDQo=
