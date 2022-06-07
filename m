Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073AD112BF3
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 09:46:36 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 7 Jun 2022 09:46:34 +0000
Message-ID: <MWHPR1101MB2157224D9A12A262C7AD5564EFA59@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
 <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_chipset: restore usage of
 has_flatccs flag
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
aS1nLXQgMi8yXSBsaWIvaW50ZWxfY2hpcHNldDogcmVzdG9yZSB1c2FnZSBvZg0KPiBoYXNfZmxh
dGNjcyBmbGFnDQo+IA0KPiBXaGVuIG9sZGVyIHBhdGNoZXMgaGFkIGJlZW4gbWVyZ2VkIG9uIHRv
cCBvZiBuZXdlciBwYXRjaGVzIGhhc19mbGF0Y2NzIGZsYWcNCj4gdXNhZ2UgaGFkIGdvdHRlbiBs
b3N0LCBwdXQgaXQgYmFjayBoZXJlLg0KPiBXaGlsZSBhdCBpdCBhbHNvIHNldCBoYXNfZmxhdGNj
cyBmbGFnIHRvIHRha2Ugb25seSBvbmUgYml0IHNpbmNlIGl0IGlzIG9mIGJvb2xlYW4NCj4gdHlw
ZS4NCj4gDQo+IENDOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRl
bC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2th
LmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaW50ZWxfY2hpcHNldC5oIHwgNSAr
Ky0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfY2hpcHNldC5oIGIvbGliL2ludGVsX2NoaXBz
ZXQuaCBpbmRleCA4MTU0NzQwODYuLmRlNDc0OWUxNA0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL2lu
dGVsX2NoaXBzZXQuaA0KPiArKysgYi9saWIvaW50ZWxfY2hpcHNldC5oDQo+IEBAIC00MSw3ICs0
MSw3IEBAIHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyB7DQo+ICAJdW5zaWduZWQgZGlzcGxheV92
ZXI7DQo+ICAJdW5zaWduZWQgZ3Q7IC8qIDAgaWYgdW5rbm93biAqLw0KPiAgCWJvb2wgaGFzXzR0
aWxlIDogMTsNCj4gLQlib29sIGhhc19mbGF0Y2NzOw0KPiArCWJvb2wgaGFzX2ZsYXRjY3MgOiAx
Ow0KPiAgCWJvb2wgaXNfbW9iaWxlIDogMTsNCj4gIAlib29sIGlzX3doaXRuZXkgOiAxOw0KPiAg
CWJvb2wgaXNfYWxtYWRvciA6IDE7DQo+IEBAIC0yMjEsNyArMjIxLDYgQEAgdm9pZCBpbnRlbF9j
aGVja19wY2godm9pZCk7DQo+IA0KPiAgI2RlZmluZSBIQVNfNFRJTEUoZGV2aWQpCShpbnRlbF9n
ZXRfZGV2aWNlX2luZm8oZGV2aWQpLT5oYXNfNHRpbGUpDQo+IA0KPiAtLyogdXNlIEhBU180VElM
RSBoZXJlIGFzIGFsbCBkZXZpY2VzIHdpdGggNC10aWxlIGhhdmUgZmxhdCBjY3MuICovDQo+IC0j
ZGVmaW5lIEhBU19GTEFUQ0NTKGRldmlkKQlIQVNfNFRJTEUoZGV2aWQpDQo+ICsjZGVmaW5lIEhB
U19GTEFUQ0NTKGRldmlkKQkoaW50ZWxfZ2V0X2RldmljZV9pbmZvKGRldmlkKS0+aGFzX2ZsYXRj
Y3MpDQo+IA0KPiAgI2VuZGlmIC8qIF9JTlRFTF9DSElQU0VUX0ggKi8NCj4gLS0NCj4gMi4yOC4w
DQoNCg==
