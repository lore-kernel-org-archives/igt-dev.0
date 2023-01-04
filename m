Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359BF10E440
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 13:02:04 +0000 (UTC)
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
Date: Wed, 4 Jan 2023 13:01:58 +0000
Message-ID: <5cd9b440f8c14392b968581a8f48992289a4654d.camel@intel.com>
References: <20230103133049.30169-1-petri.latvala@intel.com>
In-Reply-To: <20230103133049.30169-1-petri.latvala@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <90256DEF69E5D84AAAB51E902DADA8EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] chamelium: Ignore errors when fetching
 AdapterAllowed
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

T24gVHVlLCAyMDIzLTAxLTAzIGF0IDE1OjMwICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBOb3Qgc2V0dGluZyBBZGFwdGVyQWxsb3dlZCBpbiAuaWd0cmMgc2hvdWxkIGJlIGNvbnNpZGVy
ZWQgYSB2YWxpZA0KPiBjb25maWd1cmF0aW9uLiBUaGUgZGVmYXVsdCB2YWx1ZSBvZiAnZmFsc2Un
IGZyb20NCj4gZ19rZXlfZmlsZV9nZXRfYm9vbGVhbiB3aGVuIHRoZSBmaWVsZCBpcyBtaXNzaW5n
IGlzIGV4YWN0bHkgd2hhdCB3ZQ0KPiB3YW50IHRvIHVzZSwgYW5kIHN0b3JpbmcgdGhlIG1pc3Np
bmcgZmllbGQgZXJyb3IgaW4gdGhlICdlcnJvcicNCj4gdmFyaWFibGUgbGVhZHMgdG8gYW4gZXJy
b3Igc3VjaCBhcw0KPiANCj4gKGttc19jaGFtZWxpdW06MTcxMykgaWd0X2NoYW1lbGl1bS1XQVJO
SU5HOiBGYWlsZWQgdG8gcmVhZCBjaGFtZWxpdW0gcG9ydCBJRCBmb3IgRFAtMzogS2V5IGZpbGUg
ZG9lcyBub3QgaGF2ZSBrZXkg4oCcQWRhcHRlckFsbG93ZWTigJ0gaW4gZ3JvdXAg4oCcQ2hhbWVs
aXVtOkhETUktQS0y4oCdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4NCj4gQ2M6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2NoYW1lbGl1bS5jIHwgMiArLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbGliL2lndF9jaGFtZWxpdW0uYyBiL2xpYi9pZ3RfY2hhbWVsaXVtLmMNCj4gaW5kZXggNzk5
MjBkZTEuLjY1MDYzMzBlIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2NoYW1lbGl1bS5jDQo+ICsr
KyBiL2xpYi9pZ3RfY2hhbWVsaXVtLmMNCj4gQEAgLTI0NzcsNyArMjQ3Nyw3IEBAIHN0YXRpYyBi
b29sIGNoYW1lbGl1bV9yZWFkX3BvcnRfbWFwcGluZ3Moc3RydWN0IGNoYW1lbGl1bSAqY2hhbWVs
aXVtLA0KPiAgCQl9DQo+ICANCj4gIAkJcG9ydC0+YWRhcHRlcl9hbGxvd2VkID0gZ19rZXlfZmls
ZV9nZXRfYm9vbGVhbihpZ3Rfa2V5X2ZpbGUsIGdyb3VwLA0KPiAtCQkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJBZGFwdGVyQWxsb3dlZCIsICZlcnJvcik7
DQo+ICsJCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFk
YXB0ZXJBbGxvd2VkIiwgTlVMTCk7DQoNCk1heWJlIGl0J2QgYmUgbmljZXIgaWYgaXQgY2hlY2tl
ZCBpZiB0aGUga2V5IGlzIHRoZXJlIGluIHRoZSBmaXJzdA0KcGxhY2UsIHNvIHRoYXQgc29tZXRo
aW5nIGxpa2UgIkFkYXB0ZXJBbGxvd2VkPXllcyIgc3RpbGwgZmFpbHMgbG91ZGx5Lg0KTGlrZToN
Cg0KaWYgKGdfa2V5X2ZpbGVfaGFzX2tleShpZ3Rfa2V5X2ZpbGUsIGdyb3VwLCAiQWRhcHRlckFs
bG93ZWQiLCBOVUxMKSkgew0KICAgIHBvcnQtPmFkYXB0ZXJfYWxsb3dlZCA9IC4uLjsNCn0NCg0K
PiAgDQo+ICAJCWZvciAoaiA9IDA7DQo+ICAJCSAgICAgaiA8IHJlcy0+Y291bnRfY29ubmVjdG9y
cyAmJiAhcG9ydC0+Y29ubmVjdG9yX2lkOw0KDQpUaGFua3MsIFJ5c3phcmQNCg0K
