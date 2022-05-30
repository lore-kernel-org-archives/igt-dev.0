Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7B10E242
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 08:35:23 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 30 May 2022 08:35:01 +0000
Message-ID: <MWHPR1101MB2157D1B73A5FC735284E0155EFDD9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220530060701.406219-1-jouni.hogander@intel.com>
 <20220530060701.406219-5-jouni.hogander@intel.com>
In-Reply-To: <20220530060701.406219-5-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/i915/kms_psr2_sf: Fix setting
 wrong fb size
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
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkNCj4gSMO2Z2Fu
ZGVyDQo+IFNlbnQ6IE1vbmRheSwgTWF5IDMwLCAyMDIyIDk6MDcgQU0NCj4gVG86IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFUQ0ggaS1nLXQg
NC80XSB0ZXN0cy9pOTE1L2ttc19wc3IyX3NmOiBGaXggc2V0dGluZyB3cm9uZyBmYg0KPiBzaXpl
DQo+IA0KPiBDdXJyZW50IGNvZGUgaXMgaW1wcm9wZXJseSBzZXR0aW5nIG92ZXIgZnJhbWVidWZm
ZXIgc2l6ZS4gRml4IHRoaXMgYnkgc2V0dGluZw0KPiBwcmltYXJ5IGZyYW1lYnVmZmVyIHNpemUg
aW5zdGVhZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xh
QGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIHRlc3RzL2k5MTUva21zX3BzcjJfc2YuYyB8IDIgKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUva21zX3BzcjJfc2YuYyBiL3Rlc3RzL2k5MTUva21zX3Bz
cjJfc2YuYyBpbmRleA0KPiA0N2E0MzFiNi4uNjYxMjU4N2MgMTAwNjQ0DQo+IC0tLSBhL3Rlc3Rz
L2k5MTUva21zX3BzcjJfc2YuYw0KPiArKysgYi90ZXN0cy9pOTE1L2ttc19wc3IyX3NmLmMNCj4g
QEAgLTM2Nyw3ICszNjcsNyBAQCBzdGF0aWMgdm9pZCBwcmVwYXJlKGRhdGFfdCAqZGF0YSkNCj4g
DQo+ICAJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmZGF0YS0+ZmJfcHJpbWFyeSk7DQo+ICAJ
aWd0X2ZiX3NldF9wb3NpdGlvbigmZGF0YS0+ZmJfcHJpbWFyeSwgcHJpbWFyeSwgeCwgeSk7DQo+
IC0JaWd0X2ZiX3NldF9zaXplKCZkYXRhLT5mYl9vdmVybGF5LCBwcmltYXJ5LCB2aWV3X3csDQo+
ICsJaWd0X2ZiX3NldF9zaXplKCZkYXRhLT5mYl9wcmltYXJ5LCBwcmltYXJ5LCB2aWV3X3csDQo+
ICAJCQl2aWV3X2gpOw0KPiAgCWlndF9wbGFuZV9zZXRfc2l6ZShwcmltYXJ5LCB2aWV3X3csIHZp
ZXdfaCk7DQo+ICAJaWd0X3BsYW5lX3NldF9wb3NpdGlvbihwcmltYXJ5LCAwLCAwKTsNCj4gLS0N
Cj4gMi4yNS4xDQoNCg==
