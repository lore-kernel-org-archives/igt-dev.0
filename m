Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E666E175
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 15:01:40 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 13 Aug 2019 15:01:37 +0000
Message-ID: <2e0f007541d11c2f37c69f7c2bb605761a632ecc.camel@intel.com>
References: <20190813080010.22902-1-ramalingam.c@intel.com>
In-Reply-To: <20190813080010.22902-1-ramalingam.c@intel.com>
Content-Language: en-US
Content-ID: <E8CA8F17D6ED294F8896A78A205EB3A2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/display_require: reset hdcp on
 all connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTEzIGF0IDEzOjMwICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+
IEF0IHRoZSBzdGFydCBvZiBldmVyeSB0ZXN0LCByZXNldCBIRENQIHN0YXRlIHRvIFVOREVTSVJF
RCBvbiBhbGwNCj4gY29ubmVjdG9ycywgc28gdGhhdCB3ZSB3aWxsIG5vdCBoYXZlIGFueSBoZGNw
IHJlbGF0ZWQgbm9pc2VzIGluDQo+IHRoZSBzdWJzZXF1ZW50IHRlc3RzLg0KPiANCj4gdjI6DQo+
ICAgaWd0X291dHB1dF9zZXRfcHJvcF9lbnVtIGlzIHVzZWQuDQo+ICAgRG9jdW1lbnRhdGlvbiBv
ZiBkaXNwbGF5X3Jlc2V0IGlzIHVwZGF0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGlu
Z2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+DQo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTEzOTANCg0KUmV2aWV3ZWQtYnk6IFNp
bW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGxpYi9pZ3Rfa21zLmMg
fCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMNCj4gaW5kZXggYjAxNjlmNzNi
NzUyLi45NjRhNTc0N2U0OWUgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3Rfa21zLmMNCj4gKysrIGIv
bGliL2lndF9rbXMuYw0KPiBAQCAtMTg1OSw2ICsxODU5LDEwIEBAIHN0YXRpYyB2b2lkIGlndF9v
dXRwdXRfcmVzZXQoaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ICAJaWYgKGlndF9vdXRwdXRfaGFz
X3Byb3Aob3V0cHV0LCBJR1RfQ09OTkVDVE9SX0JST0FEQ0FTVF9SR0IpKQ0KPiAgCQlpZ3Rfb3V0
cHV0X3NldF9wcm9wX3ZhbHVlKG91dHB1dCwgSUdUX0NPTk5FQ1RPUl9CUk9BRENBU1RfUkdCLA0K
PiAgCQkJCQkgIEJST0FEQ0FTVF9SR0JfRlVMTCk7DQo+ICsNCj4gKwlpZiAoaWd0X291dHB1dF9o
YXNfcHJvcChvdXRwdXQsIElHVF9DT05ORUNUT1JfQ09OVEVOVF9QUk9URUNUSU9OKSkNCj4gKwkJ
aWd0X291dHB1dF9zZXRfcHJvcF9lbnVtKG91dHB1dCwgSUdUX0NPTk5FQ1RPUl9DT05URU5UX1BS
T1RFQ1RJT04sDQo+ICsJCQkJCSAiVW5kZXNpcmVkIik7DQo+ICB9DQo+ICANCj4gIC8qKg0KPiBA
QCAtMTg3MSw2ICsxODc1LDcgQEAgc3RhdGljIHZvaWQgaWd0X291dHB1dF9yZXNldChpZ3Rfb3V0
cHV0X3QgKm91dHB1dCkNCj4gICAqIEZvciBvdXRwdXRzOg0KPiAgICogLSAlSUdUX0NPTk5FQ1RP
Ul9DUlRDX0lEDQo+ICAgKiAtICVJR1RfQ09OTkVDVE9SX0JST0FEQ0FTVF9SR0IgKGlmIGFwcGxp
Y2FibGUpDQo+ICsgKiAgICVJR1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTiAoaWYgYXBw
bGljYWJsZSkNCj4gICAqIC0gaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKCkgdG8gZGVmYXVsdC4N
Cj4gICAqDQo+ICAgKiBGb3IgcGlwZXM6DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
