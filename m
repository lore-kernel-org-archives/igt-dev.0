Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710070.outbound.protection.outlook.com [40.107.71.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDC56E8F8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2019 12:10:28 +0000 (UTC)
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Date: Fri, 28 Jun 2019 12:10:27 +0000
Message-ID: <86de55b2-f73f-2bce-eb7f-e4027e2701df@amd.com>
References: <20190627173440.7169-1-nicholas.kazlauskas@amd.com>
 <3ef17139-7a8b-676a-7e2b-8ebda3da7b02@amd.com>
 <20190628101857.wrh3xoe5ajeck3bb@ahiler-desk1.fi.intel.com>
In-Reply-To: <20190628101857.wrh3xoe5ajeck3bb@ahiler-desk1.fi.intel.com>
Content-Language: en-US
Content-ID: <2C07E56390471142B2B5F51DFF2116EF@namprd12.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] amdpgu/amd_bypass: Drop unneeded
 includes
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gNi8yOC8xOSA2OjE4IEFNLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6DQo+IE9uIFRodSwgSnVu
IDI3LCAyMDE5IGF0IDA2OjE5OjE0UE0gKzAwMDAsIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOg0KPj4g
T24gMjAxOS0wNi0yNyAxOjM0IHAubS4sIE5pY2hvbGFzIEthemxhdXNrYXMgd3JvdGU6DQo+Pj4g
VGhlc2UganVzdCBicmVhayB0aGUgYnVpbGQgb24gZGViaWFuLW1hc29uLWFybSBhbmQgZGViaWFu
LW1lc29uLW1pcHMNCj4+PiBhbmQgYXJlbid0IG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+
Pj4NCj4+PiBDYzogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5jb20+DQo+Pj4g
Q2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KPj4+IFNpZ25lZC1v
ZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4N
Cj4+DQo+PiBSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+DQo+Pg0KPj4gSGFycnkNCj4gDQo+IFRoYW5rcyBmb3Igc3dpZnQgZml4LiBTdGFydGluZyBu
ZXh0IHdlZWsgcHJlLW1lcmdlIGdpdGxhYiBwaXBlbGluZXMgYXJlDQo+IGdvaW5nIHRvIHNlbmQg
ZW1haWxzIG9uIGVycm9ycywgc28gaXQgc2hvdWxkIGJlIGVhc2llciB0byBjYXRjaCBzdWNoDQo+
IGJyZWFrYWdlcyBlYXJseS4NCj4gDQo+IE5vdyB5b3UgY2FuIGNoZWNrIHRoZW0gZnJvbSBwYXRj
aHdvcmsuDQo+IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2lndC1j
aS10YWdzLy0vam9icy8zODU1MTINCj4gDQo+IFRoaXMgc3RpbGwgZmFpbHMgdGhlIG1lc29uLWF1
dG90b29scyB0ZXN0bGlzdCBjb25zaXN0ZW5jeSBjaGVjay4gRXhwZWN0DQo+IHBhdGNoIGluIDUg
Oi0pDQo+IA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmb2xsb3cgdXAgcGF0Y2ghDQoNCkkganVzdCBu
b3RpY2VkIHRoZSBwcmUtbWVyZ2UgcGlwZWxpbmUgb24gdGhpcyBjaGFuZ2Ugb24gcGF0Y2h3b3Jr
LCBzbyBJIA0KZ3Vlc3MgdGhpcyBpcyBhIHJlY2VudCBhZGRpdGlvbi4gVGhlc2Ugd2lsbCBiZSBy
ZWFsbHkgdXNlZnVsIGZvciANCmNhdGNoaW5nIHRoZXNlIGVycm9ycyBkdXJpbmcgcmV2aWV3Lg0K
DQpOaWNob2xhcyBLYXpsYXVza2FzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
