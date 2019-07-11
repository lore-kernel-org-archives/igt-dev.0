Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48006E172
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 10:39:53 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Thu, 11 Jul 2019 10:39:51 +0000
Message-ID: <70b267817cf2f2a7bb1a6dba795026e31ad3893f.camel@intel.com>
References: <20190711083958.6935-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20190711083958.6935-1-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
Content-ID: <3D1DBBD2128F83459C571B0584935C95@intel.com>
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA3LTExIGF0IDEwOjM5ICswMjAwLCBKYW51c3ogS3J6eXN6dG9maWsgd3Jv
dGU6DQo+IElmIGEgY2hpbGQgcHJvY2VzcyBkaWVzIGZvciBhbnkgcmVhc29uIHdoaWxlIGJhc2lj
LWZlbmNlLXJlYWQgb3INCj4gYmFzaWMtZmVuY2UtbW1hcCBzdWJ0ZXN0IGlzIHJ1biwgdGhlIHN1
YnRlc3QgbWF5IGhhbmcgaW5kZWZpbml0ZWx5IG9uDQo+IHJlYWQoKSBmcm9tIGEgcGlwZSB3aGlj
aCBpcyBzdXBwb3NlZCB0byBiZSB3cml0dGVuIHRvIGJ5IHRoYXQgY2hpbGQNCj4gKGNhbg0KPiBi
ZSBpbnRlcnJ1cHRlZCB0aG91Z2gpLiAgRml4IGl0IGJ5IGZpcnN0IGNsb3NpbmcgdW51c2VkIHBp
cGUgZW5kcyBvbg0KPiBib3RoDQo+IHBhcmVudCBhbmQgY2hpbGQgc2lkZSBiZWZvcmUgdXNpbmcg
dGhlIHBpcGUsIGFzIHJlY29tbWVuZGVkIGJ5DQo+IHBpcGUoMikNCj4gbWFudWFsIHBhZ2UuDQo+
IA0KPiBQbGVhc2Ugbm90ZSB0aGF0IGR1ZSB0byB0aGUgSUdUIGxpYnJhcnkgd2F5IG9mIGhhbmRs
aW5nIHNpZ25hbHMsIG5vdw0KPiB0aGUNCj4gc3VidGVzdHMgbWF5IGZhaWwgd2l0aCBlcnJvciBj
b2RlIDE0MSAoMTI4ICsgU0lHUElQRSkgYW5kIG5vIHVzdWFsDQo+IERFQlVHDQo+IG1lc3NhZ2Ug
YmxvY2sgb24gc3RkZXJyIG5vciBGQUlMIG1lc3NhZ2UgbGluZSBvbiBzdGRvdXQsIGhvd2V2ZXIg
c29tZQ0KPiBtZWFuaW5nZnVsIGVycm9yIG1lc3NhZ2VzIHdpbGwgc3RpbGwgYmUgcHJpbnRlZCBv
biBzdGRlcnIgYnkgdGhlDQo+IGZhaWxpbmcNCj4gY2hpbGQgcHJvY2Vzc2VzLg0KPiANCj4gdjI6
IHJlc2VuZCB3aXRoIFJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4NCj4gICAgIGFkZGVkDQoNCllvdSBnZW5lcmFsbHkgZG9uJ3QgbmVlZCB0byByZXNl
bmQgYSBwYXRjaCBqdXN0IHRvIGFkZCBhIFItYiB0YWcuDQoNCkRvIHlvdSBoYXZlIElHVCBjb21t
aXQgcmlnaHRzPw0KDQo+IEphbnVzeiBLcnp5c3p0b2ZpayAoMSk6DQo+ICAgdGVzdHMvcHJpbWVf
dmdlbTogRml4IGJyb2tlbiBoYW5kbGluZyBvZiBpbnRlcnByb2Nlc3MgcGlwZXMNCj4gDQo+ICB0
ZXN0cy9wcmltZV92Z2VtLmMgfCAxMiArKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
