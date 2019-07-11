Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1406898EA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 11:17:48 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Thu, 11 Jul 2019 11:17:45 +0000
Message-ID: <dc86de773a80684476c2fc93ecf7d731302295fa.camel@intel.com>
References: <20190711083958.6935-1-janusz.krzysztofik@linux.intel.com>
 <70b267817cf2f2a7bb1a6dba795026e31ad3893f.camel@intel.com>
 <1922643.DgTLQ80WSp@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <1922643.DgTLQ80WSp@jkrzyszt-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <BF464E4E0CF598459585872AB7296038@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/1] tests/prime_vgem: Fix broken
 handling of interprocess pipes
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
To: "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTExIGF0IDEyOjQ5ICswMjAwLCBKYW51c3ogS3J6eXN6dG9maWsgd3Jv
dGU6DQo+IEhpIFNpbW9uLA0KPiANCj4gT24gVGh1cnNkYXksIEp1bHkgMTEsIDIwMTkgMTI6Mzk6
NTEgUE0gQ0VTVCBTZXIsIFNpbW9uIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAxOS0wNy0xMSBhdCAx
MDozOSArMDIwMCwgSmFudXN6IEtyenlzenRvZmlrIHdyb3RlOg0KPiA+ID4gSWYgYSBjaGlsZCBw
cm9jZXNzIGRpZXMgZm9yIGFueSByZWFzb24gd2hpbGUgYmFzaWMtZmVuY2UtcmVhZCBvcg0KPiA+
ID4gYmFzaWMtZmVuY2UtbW1hcCBzdWJ0ZXN0IGlzIHJ1biwgdGhlIHN1YnRlc3QgbWF5IGhhbmcg
aW5kZWZpbml0ZWx5IG9uDQo+ID4gPiByZWFkKCkgZnJvbSBhIHBpcGUgd2hpY2ggaXMgc3VwcG9z
ZWQgdG8gYmUgd3JpdHRlbiB0byBieSB0aGF0IGNoaWxkDQo+ID4gPiAoY2FuDQo+ID4gPiBiZSBp
bnRlcnJ1cHRlZCB0aG91Z2gpLiAgRml4IGl0IGJ5IGZpcnN0IGNsb3NpbmcgdW51c2VkIHBpcGUg
ZW5kcyBvbg0KPiA+ID4gYm90aA0KPiA+ID4gcGFyZW50IGFuZCBjaGlsZCBzaWRlIGJlZm9yZSB1
c2luZyB0aGUgcGlwZSwgYXMgcmVjb21tZW5kZWQgYnkNCj4gPiA+IHBpcGUoMikNCj4gPiA+IG1h
bnVhbCBwYWdlLg0KPiA+ID4gDQo+ID4gPiBQbGVhc2Ugbm90ZSB0aGF0IGR1ZSB0byB0aGUgSUdU
IGxpYnJhcnkgd2F5IG9mIGhhbmRsaW5nIHNpZ25hbHMsIG5vdw0KPiA+ID4gdGhlDQo+ID4gPiBz
dWJ0ZXN0cyBtYXkgZmFpbCB3aXRoIGVycm9yIGNvZGUgMTQxICgxMjggKyBTSUdQSVBFKSBhbmQg
bm8gdXN1YWwNCj4gPiA+IERFQlVHDQo+ID4gPiBtZXNzYWdlIGJsb2NrIG9uIHN0ZGVyciBub3Ig
RkFJTCBtZXNzYWdlIGxpbmUgb24gc3Rkb3V0LCBob3dldmVyIHNvbWUNCj4gPiA+IG1lYW5pbmdm
dWwgZXJyb3IgbWVzc2FnZXMgd2lsbCBzdGlsbCBiZSBwcmludGVkIG9uIHN0ZGVyciBieSB0aGUN
Cj4gPiA+IGZhaWxpbmcNCj4gPiA+IGNoaWxkIHByb2Nlc3Nlcy4NCj4gPiA+IA0KPiA+ID4gdjI6
IHJlc2VuZCB3aXRoIFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4NCj4gPiA+ICAgICBhZGRlZA0KPiA+IA0KPiA+IFlvdSBnZW5lcmFsbHkgZG9uJ3Qg
bmVlZCB0byByZXNlbmQgYSBwYXRjaCBqdXN0IHRvIGFkZCBhIFItYiB0YWcuDQo+ID4gDQo+ID4g
RG8geW91IGhhdmUgSUdUIGNvbW1pdCByaWdodHM/DQo+IA0KPiBJIGRvbid0IHRoaW5rIEkgaGF2
ZS4NCg0KT2theS4gSSBqdXN0IHB1c2hlZCB0aGlzIGNvbW1pdDoNCg0KVG8gZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZzpkcm0vaWd0LWdwdS10b29scy5naXQNCiAgIDg2ZGM0OGVkZTdjMy4uZDdmMTQw
YjViMDJkICBtYXN0ZXIgLT4gbWFzdGVyDQoNClRoYW5rcyENCg0KTmV4dCB0aW1lLCB5b3UgY2Fu
IGp1c3QgcmVwbHkgdG8gdGhlIFItYiBhc2tpbmcgZm9yIHRoZSByZXZpZXdlciB0bw0KcHVzaCB0
aGUgY2hhbmdlLg0KDQo+IFRoYW5rcywNCj4gSmFudXN6DQo+IA0KPiA+ID4gSmFudXN6IEtyenlz
enRvZmlrICgxKToNCj4gPiA+ICAgdGVzdHMvcHJpbWVfdmdlbTogRml4IGJyb2tlbiBoYW5kbGlu
ZyBvZiBpbnRlcnByb2Nlc3MgcGlwZXMNCj4gPiA+IA0KPiA+ID4gIHRlc3RzL3ByaW1lX3ZnZW0u
YyB8IDEyICsrKysrKysrLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gDQo+IA0KPiANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
