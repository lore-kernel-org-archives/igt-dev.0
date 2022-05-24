Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA5C10E51A
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 15:48:44 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Date: Tue, 24 May 2022 15:48:41 +0000
Message-ID: <DM4PR11MB6213B0E56163D8E40318D87FECD79@DM4PR11MB6213.namprd11.prod.outlook.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
 <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
In-Reply-To: <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_async_flips: Expand
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SSBkb24ndCBzZWUgYW55IHJlZ3Jlc3Npb24gdW5kZXIgdGhpcyBwYXRjaC4gU28sIG5vIGFjdGlv
bnMgYXJlIHRha2VuLg0KDQpMYWtzaG1pLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogUm9kcmlnbyBTaXF1ZWlyYSBKb3JkYW8gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT4g
DQpTZW50OiBUdWVzZGF5LCBNYXkgMjQsIDIwMjIgNjoxNCBBTQ0KVG86IFZ1ZHVtLCBMYWtzaG1p
bmFyYXlhbmEgPGxha3NobWluYXJheWFuYS52dWR1bUBpbnRlbC5jb20+DQpDYzoga2VybmVsLWRl
dkBpZ2FsaWEuY29tOyBtYXJreWFjb3ViQGdvb2dsZS5jb207IExhdHZhbGEsIFBldHJpIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT47IEFya2FkaXVzeiBIaWxlciA8YXJla0BoaWxlci5ldT47IE1l
bGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+OyBBbGV4IEh1bmcgPGFsZXguaHVuZ0BhbWQuY29t
PjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEFuZHLDqSBBbG1laWRhIDxhbmRyZWFs
bWVpZEBpZ2FsaWEuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2MiAwLzJdIHRlc3Rz
L2ttc19hc3luY19mbGlwczogRXhwYW5kIHRlc3QNCg0KSGkgTGFrc2htaSwNCg0KSSBub3RpY2Vk
IGEgZ2l0bGFiIHdhcm5pbmcgaW4gdGhpcyBwYXRjaDoNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy8xMDQwMzcvDQoNCkkgdGhpbmsgaXQgaXMgYSBmYWxzZSBwb3Np
dGl2ZSwgYnV0IEkgd2FudCB0byBjaGVjayB3aXRoIHlvdSBiZWZvcmUgSSBtZXJnZSBpdC4gV2hh
dCBkbyB5b3UgdGhpbms/DQoNClRoYW5rcw0KU2lxdWVpcmENCg0KT24gMjAyMi0wNS0yMCAxNjoz
NSwgQW5kcsOpIEFsbWVpZGEgd3JvdGU6DQo+IEhpLA0KPiANCj4gVGhpcyBwYXRjaHNldCBlbmFi
bGVzIGttc19hc3luY19mbGlwcyB0byBydW4gaW4gbW9yZSB2ZW5kb3JzLiBJdCB3YXMgDQo+IHRl
c3RlZCBhdCBpOTE1LCBhbWRncHUgYW5kIHZjNC4NCj4gDQo+IFRoZSBmaXJzdCBwYXRjaCBhZGRz
IGEgaGVscGVyIHRvIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3Igb2YgdGhlIHRlc3QgDQo+IHdoaWxl
IGtlZXBpbmcgdGhpbmdzIHNpbXBsZSwgYW5kIHRoZSBzZWNvbmQgcGF0Y2ggbWFrZSB0aGUgdGVz
dCB3b3JrIA0KPiBvbiBtb3JlIHBsYXRmb3Jtcy4NCj4gDQo+IENoYW5nZXMgZnJvbSB2MToNCj4g
LSBGaXggZnVuY3Rpb24gY29tbWVudCB0eXBvDQo+IA0KPiBBbmRyw6kgQWxtZWlkYSAoMik6DQo+
ICAgIGxpYi9pZ3RfZmI6IEFkZCBzdXBwb3J0IGZvciBkcmF3aW5nIHJlY3RhbmdsZXMgd2l0aCBy
YW5kb20gY29sb3JzDQo+ICAgIHRlc3RzL2ttc19hc3luY19mbGlwczogU3VwcG9ydCBtb3JlIHZl
bmRvcnMNCj4gDQo+ICAgbGliL2lndF9mYi5jICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysr
KysrKysNCj4gICBsaWIvaWd0X2ZiLmggICAgICAgICAgICB8ICAxICsNCj4gICB0ZXN0cy9rbXNf
YXN5bmNfZmxpcHMuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkNCj4gDQoNCg==
