Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D076E84F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2019 10:51:50 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 23 Sep 2019 10:51:47 +0000
Message-ID: <dd07c870b64ae8c0bc43ed799647fbeaa50f366f.camel@intel.com>
References: <20190918095919.12423-1-mika.kahola@intel.com>
 <20190918103526.GV4019@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20190918103526.GV4019@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <45A761F620B61843A07C24D2541A08E2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_prime: Fix compiler warning
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UHVzaGVkLiBUaGFua3MgZm9yIHRoZSByZXZpZXchDQoNCk9uIFdlZCwgMjAxOS0wOS0xOCBhdCAx
MzozNSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3cm90ZToNCj4gT24gV2VkLCBTZXAgMTgsIDIwMTkg
YXQgMTI6NTk6MTlQTSArMDMwMCwgTWlrYSBLYWhvbGEgd3JvdGU6DQo+ID4gRml4IGNvbXBpbGVy
IHdhcm5pbmcgYWJvdXQNCj4gPiANCj4gPiAuLi90ZXN0cy9rbXNfcHJpbWUuYzogSW4gZnVuY3Rp
b24g4oCYc2V0dXBfZGlzcGxheeKAmToNCj4gPiAuLi90ZXN0cy9rbXNfcHJpbWUuYzo3NDoyOiB3
YXJuaW5nOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQNCj4gPiBkZWNsYXJhdGlvbnMgYW5kIGNvZGUg
Wy1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50XQ0KPiA+ICAgaWd0X291dHB1dF90ICpvdXRw
dXQgPSBpZ3RfZ2V0X3NpbmdsZV9vdXRwdXRfZm9yX3BpcGUoZGlzcGxheSwNCj4gPiBwaXBlKTsN
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPg0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ttc19wcmltZS5jIHwgNCArKyst
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3ByaW1lLmMgYi90ZXN0cy9rbXNfcHJpbWUu
Yw0KPiA+IGluZGV4IDE3NTk5NTczLi4zMjQxYzUxNCAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9r
bXNfcHJpbWUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19wcmltZS5jDQo+ID4gQEAgLTY5LDkgKzY5
LDExIEBAIHN0YXRpYyBib29sIGhhc19wcmltZV9leHBvcnQoaW50IGZkKQ0KPiA+ICBzdGF0aWMg
aWd0X291dHB1dF90ICpzZXR1cF9kaXNwbGF5KGludCBpbXBvcnRlcl9mZCwgaWd0X2Rpc3BsYXlf
dA0KPiA+ICpkaXNwbGF5LA0KPiA+ICAJCQkJICAgZW51bSBwaXBlIHBpcGUpDQo+ID4gIHsNCj4g
PiArCWlndF9vdXRwdXRfdCAqb3V0cHV0Ow0KPiA+ICsNCj4gPiAgCWlndF9kaXNwbGF5X3JlcXVp
cmUoZGlzcGxheSwgaW1wb3J0ZXJfZmQpOw0KPiA+ICAJaWd0X3NraXBfb24ocGlwZSA+PSBkaXNw
bGF5LT5uX3BpcGVzKTsNCj4gPiAtCWlndF9vdXRwdXRfdCAqb3V0cHV0ID0gaWd0X2dldF9zaW5n
bGVfb3V0cHV0X2Zvcl9waXBlKGRpc3BsYXksDQo+ID4gcGlwZSk7DQo+ID4gKwlvdXRwdXQgPSBp
Z3RfZ2V0X3NpbmdsZV9vdXRwdXRfZm9yX3BpcGUoZGlzcGxheSwgcGlwZSk7DQo+ID4gIA0KPiA+
ICAJaWd0X3JlcXVpcmVfZihvdXRwdXQsICJObyBjb25uZWN0b3IgZm91bmQgZm9yIHBpcGUgJXNc
biIsDQo+ID4gIAkJICAgICAga21zdGVzdF9waXBlX25hbWUocGlwZSkpOw0KPiA+IC0tIA0KPiA+
IDIuMTcuMQ0KPiA+IA0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+ID4gaWd0LWRldiBtYWlsaW5nIGxpc3QNCj4gPiBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
