Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAD510E1DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 08:15:38 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Stolarek, Karolina" <karolina.stolarek@intel.com>
Date: Thu, 9 Nov 2023 08:15:29 +0000
Message-ID: <MW3PR11MB4748E38F10BEB1A953B8E277AEAFA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231107083023.751059-1-janga.rahul.kumar@intel.com>
 <4ab2f4da-7c0c-4e08-b44e-f25845052e37@intel.com>
In-Reply-To: <4ab2f4da-7c0c-4e08-b44e-f25845052e37@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm: Correct stride to
 avoid address range collision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RvbGFyZWssIEthcm9s
aW5hIDxrYXJvbGluYS5zdG9sYXJla0BpbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVt
YmVyIDcsIDIwMjMgNDowMSBQTQ0KPiBUbzogS3VtYXIsIEphbmdhIFJhaHVsIDxqYW5nYS5yYWh1
bC5rdW1hckBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
R2FuZGksIFJhbWFkZXZpDQo+IDxyYW1hZGV2aS5nYW5kaUBpbnRlbC5jb20+OyBEZSBNYXJjaGks
IEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbaWd0LWRl
dl0gW1BBVENIIGktZy10XSB0ZXN0cy9pbnRlbC94ZV92bTogQ29ycmVjdCBzdHJpZGUgdG8gYXZv
aWQNCj4gYWRkcmVzcyByYW5nZSBjb2xsaXNpb24NCj4gDQo+IE9uIDcuMTEuMjAyMyAwOTozMCwg
amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IEphbmdhIFJhaHVs
IEt1bWFyIDxqYW5nYS5yYWh1bC5rdW1hckBpbnRlbC5jb20+DQo+ID4NCj4gPiBGb3IgWEUyLCB0
aGUgbWluaW11bSBwYWdlIHNpemUgZm9yIGJvdGggVlJBTSBhbmQgc3lzdGVtIG1lbW9yeSBpcyBv
bmx5DQo+IDRLLg0KPiA+DQo+ID4gTWluaW11bSBwYWdlIHNpemUgd2FzIHVzZWQgYXMgdGhlIGFk
ZHJlc3Mgc3RyaWRlLCB3aGljaCBpcyA0Sy4NCj4gPiBXaGVuIGF0dGVtcHRpbmcgdG8gYmluZCBh
IDRLIHJhbmdlLCBjb25zZWN1dGl2ZSBWTSBCSU5EIElPQ1RMIGNhbGxzDQo+ID4gcmVzdWx0ZWQg
aW4gYSByYW5nZSBjb2xsaXNpb24uIFVwZGF0ZSBzdHJpZGUgYmFzZWQgb24gYm8gc2l6ZS4NCj4g
Pg0KPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYW5nYSBSYWh1bCBLdW1hciA8amFuZ2EucmFodWwua3VtYXJAaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfdm0uYyB8IDQgKysrKw0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL3hlX3ZtLmMgYi90ZXN0cy9pbnRlbC94ZV92bS5jIGluZGV4DQo+ID4gZGQz
MzAyMzM3Li4yYWVhZDk0MjcgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfdm0uYw0K
PiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMNCj4gPiBAQCAtMzc3LDYgKzM3NywxMCBAQCBz
aGFyZWRfcHRlX3BhZ2UoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0
YW5jZSAqZWNpLCBpbnQgbl9ibywNCj4gPiAgIAlib19zaXplID0gQUxJR04oYm9fc2l6ZSArIHhl
X2NzX3ByZWZldGNoX3NpemUoZmQpLA0KPiA+ICAgCQkJeGVfZ2V0X2RlZmF1bHRfYWxpZ25tZW50
KGZkKSk7DQo+ID4NCj4gPiArCWlmIChhZGRyX3N0cmlkZSA8PSBib19zaXplKSB7DQo+ID4gKwkJ
YWRkcl9zdHJpZGUgPSBhZGRyX3N0cmlkZSArIGJvX3NpemU7DQo+ID4gKwl9DQo+ID4gKw0KPiAN
Cj4gSXQncyBqdXN0IG9uZSBsaW5lIGhlcmUsIHlvdSBjYW4gZHJvcCB0aGUgYnJhY2VzIChpdCB3
aWxsIGFsc28gbWFrZSBjaGVja3BhdGNoDQo+IGhhcHB5KS4gRG8gd2UgbmVlZCB0byBhbGlnbiB0
aGUgYWRkcmVzcyBzdHJpZGUsIG9yIGlzIGFscmVhZHkgYWxpZ25lZD8NCkl0IGlzIGFscmVhZHkg
YWxpZ25lZC4NCg0KLVJhaHVsDQo+IA0KPiBBbGwgdGhlIGJlc3QsDQo+IEthcm9saW5hDQo+IA0K
PiA+ICAgCWZvciAoaSA9IDA7IGkgPCBuX2JvOyArK2kpIHsNCj4gPiAgIAkJYm9baV0gPSB4ZV9i
b19jcmVhdGVfZmxhZ3MoZmQsIHZtLCBib19zaXplLA0KPiA+ICAgCQkJCQkgICB2aXNpYmxlX3Zy
YW1faWZfcG9zc2libGUoZmQsIGVjaS0NCj4gPmd0X2lkKSk7DQo=
