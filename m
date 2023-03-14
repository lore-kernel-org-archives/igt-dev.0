Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3838E10E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 21:54:10 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 14 Mar 2023 21:54:06 +0000
Message-ID: <82e7c0edc082a06cb96fab14eac07287ea12d4dd.camel@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
 <20221206085849.271505-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-4-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FEE1DA855112144A4B73D6CF2C003DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/11] tools/intel_guc_logger: Add
 GT-ID selection for intel_guc_logger
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

T24gVHVlLCAyMDIyLTEyLTA2IGF0IDAwOjU4IC0wODAwLCBBbGFuIFByZXZpbiB3cm90ZToNCj4g
V2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIE1UTCBhbmQgbXVsdGktdGlsZSBwcm9kdWN0cywgYWRk
IGEgbmV3DQo+IGNtZCBsaW5lIHBhcmFtIGZvciB1c2VycyB0byBzZWxlY3Qgd2hpY2ggR1QgdG8g
Y29sbGVjdCBHdUMgcmVsYXkNCj4gbG9ncyBmcm9tLg0KPiANCmFsYW46c25pcA0KPiBAQCAtNTM4
LDkgKzU2OSwxMCBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzX2NvbW1hbmRfbGluZShpbnQgYXJnYywg
Y2hhciAqKmFyZ3YsIHN0cnVjdCBnbG9iYWxfdCAqZGF0YSkNCj4gIAkJIiAgLXQgLS10ZXN0ZHVy
YXRpb249c2VjICBtYXggZHVyYXRpb24gaW4gc2Vjb25kcyBmb3Igd2hpY2ggdGhlIGxvZ2dlciBz
aG91bGQgcnVuXG4iDQo+ICAJCSIgIC1wIC0tcG9sbHRpbWVvdXQ9bXMgICAgcG9sbGluZyB0aW1l
b3V0IGluIG1zLCAtMSA9PSBpbmRlZmluaXRlIHdhaXQgZm9yIHRoZSBuZXcgZGF0YVxuIg0KPiAg
CQkiICAtcyAtLXNpemU9TUIgICAgICAgICAgIG1heCBzaXplIG9mIG91dHB1dCBmaWxlIGluIE1C
cyBhZnRlciB3aGljaCBsb2dnaW5nIHdpbGwgYmUgc3RvcHBlZFxuIg0KPiAtCQkiICAtZCAtLWRp
c2NhcmQgICAgICAgICAgIGRpc2NhcmQgdGhlIG9sZC9ib290LXRpbWUgbG9ncyBiZWZvcmUgZW50
ZXJpbmcgaW50byB0aGUgY2FwdHVyZSBsb29wXG4iOw0KPiArCQkiICAtZCAtLWRpc2NhcmQgICAg
ICAgICAgIGRpc2NhcmQgdGhlIG9sZC9ib290LXRpbWUgbG9ncyBiZWZvcmUgZW50ZXJpbmcgaW50
byB0aGUgY2FwdHVyZSBsb29wXG4iDQo+ICsJCSIgIC1pIC0tZ3RfaWQgICAgICAgICAgICAgR1Qt
SUQgb2YgR3VDIHRvIGNhcHR1cmUgZnJvbSwgZGVmYXVsdHMgdG8gY2FwdHVyZSBmcm9tIGd0MFxu
IjsNCj4gIA0KPiAtCWlndF9zaW1wbGVfaW5pdF9wYXJzZV9vcHRzKCZhcmdjLCBhcmd2LCAidjpv
OmI6dDpwOnM6ZCIsIGxvbmdfb3B0aW9ucywNCj4gKwlpZ3Rfc2ltcGxlX2luaXRfcGFyc2Vfb3B0
cygmYXJnYywgYXJndiwgInY6bzpiOnQ6cDpzOmQ6aSIsIGxvbmdfb3B0aW9ucywNCmFsYW46IHdo
ZW4gcmV0ZXN0aW5nIHdpdGggTVRMIHdpdGggYm90aCBndCdzLCBpIHJlYWxpemUgYWJvdmUgaXMg
YSB0eXBvIGJ1ZyAuLi4gc2hvdWxkIGhhdmUgYmVlbiAidjpvOmI6dDpwOnM6ZGk6IiAoJ2knIG5l
ZWRzIHRoZSBwYXJhbSkuDQoNCmFsYW46c25pcA0KDQo=
