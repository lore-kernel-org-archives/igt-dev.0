Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B297D89209
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2019 08:36:06 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Wed, 7 Aug 2019 08:36:04 +0000
Message-ID: <39be9626d8b3cdbd65713ffd55894831f72a4302.camel@intel.com>
References: <20190729141511.9360-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20190729141511.9360-1-stanislav.lisovskiy@intel.com>
Content-Language: en-US
Content-ID: <91CB42971BE2654DA1F936836A24CF55@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1] igt/lib: Start using x and y params
 for gpu walk
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA3LTI5IGF0IDE3OjE1ICswMzAwLCBTdGFuaXNsYXYgTGlzb3Zza2l5IHdy
b3RlOg0KPiBXaGlsZSBkb2luZyBzb21lIGdwdSBmaWxsIGJhc2VkIHRlc3RzLCBub3RpY2VkIHRo
YXQNCj4gYWN0dWFsbHkgdGhlIHggYW5kIHkgcGFyYW1ldGVycyBkbyBub3QgYWZmZWN0IHRoZQ0K
PiBmaWxsZWQgYXJlYSBhdCBhbGwuDQo+IEFmdGVyIHNob3J0IHN0dWR5IGxvb2tzIGxpa2UgZ2Vu
OF9ncGdwdV93YWxrIHdhcyBub3QNCj4gdXNpbmcgdGhvc2UgYXQgYWxsLg0KPiBTdGFydGVkIHVz
aW5nIHRob3NlIGFjY29yZGluZyB0byBic3BlYywgc28gbm93IGl0IGlzDQo+IGFjdHVhbGx5IHBv
c3NpYmxlIHRvIHVzZSBpbml0aWFsIHggYW5kIHkgdmFsdWVzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU3RhbmlzbGF2IExpc292c2tpeSA8c3RhbmlzbGF2Lmxpc292c2tpeUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgbGliL2dwdV9jbWRzLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2dwdV9j
bWRzLmMgYi9saWIvZ3B1X2NtZHMuYw0KPiBpbmRleCA4ZDI3MGVlOC4uNDhkZGZhMGMgMTAwNjQ0
DQo+IC0tLSBhL2xpYi9ncHVfY21kcy5jDQo+ICsrKyBiL2xpYi9ncHVfY21kcy5jDQo+IEBAIC02
ODEsMTIgKzY4MSwxMiBAQCBnZW44X2VtaXRfZ3BncHVfd2FsayhzdHJ1Y3QgaW50ZWxfYmF0Y2hi
dWZmZXINCj4gKmJhdGNoLA0KPiAgCQkgIDApOyAvKiB3aWR0aDoxICovDQo+ICANCj4gIAkvKiB0
aHJlYWQgZ3JvdXAgWCAqLw0KPiAtCU9VVF9CQVRDSCgwKTsNCj4gKwlPVVRfQkFUQ0goeCk7DQo+
ICAJT1VUX0JBVENIKDApOw0KPiAgCU9VVF9CQVRDSCh4X2RpbSk7DQo+ICANCj4gIAkvKiB0aHJl
YWQgZ3JvdXAgWSAqLw0KPiAtCU9VVF9CQVRDSCgwKTsNCj4gKwlPVVRfQkFUQ0goeSk7DQo+ICAJ
T1VUX0JBVENIKDApOw0KPiAgCU9VVF9CQVRDSCh5X2RpbSk7DQo+ICANCg0KQ2hyaXMsIGNvdWxk
IHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sgaWYgdGhpcyBpcyBjb3JyZWN0Pw0KDQpQcm9iYWJseSB3
ZSBhbHNvIG5lZWQgdG8gYWRkIHRoaXMgZm9yIG90aGVyIHBsYXRmb3JtcywgDQpJIHdhcyBqdXN0
IGltcGxlbWVudGluZyBhIHN0cmVzcyB0ZXN0IGNhc2Ugd2hlcmUgSSB3YW50ZWQgdG8gdXNlDQpz
aGFkZXIgdG8gZmlsbCBzb21lIHNwZWNpZmljIHBhcnQgb2YgZnJhbWUgYnVmZmVyIGFuZCB0aGVu
IGZpZ3VyZWQNCm91dCB0aGF0IHggYW5kIHkgcGFyYW1ldGVycyBhcmUgbm90IHVzZWQuDQoNCkJl
c3QgUmVnYXJkcywNCg0KTGlzb3Zza2l5IFN0YW5pc2xhdg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
