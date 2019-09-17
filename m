Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98486EAA9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2019 04:14:24 +0000 (UTC)
From: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Sep 2019 04:14:20 +0000
Message-ID: <4e223dabd4bfbf403106cbfc5895d180a2b61f13.camel@intel.com>
References: <20190913124903.3643-1-katarzyna.dec@intel.com>
 <20190913124903.3643-2-katarzyna.dec@intel.com>
 <20190916154435.vpyjzvs5o6fkgnfz@ahiler-desk1.fi.intel.com>
In-Reply-To: <20190916154435.vpyjzvs5o6fkgnfz@ahiler-desk1.fi.intel.com>
Content-Language: en-US
Content-ID: <641D8B5496EB3C4788B840926FC9784D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/gpgpu_fill/tgl: Implement
 gpgpu_fillfunc for TGL
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>, "Dec, Katarzyna" <katarzyna.dec@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTE2IGF0IDE4OjQ0ICswMzAwLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6
DQo+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDAyOjQ5OjAyUE0gKzAyMDAsIEthdGFyenluYSBE
ZWMgd3JvdGU6DQo+ID4gDQo+ID4gKwllbHNlIGlmIChJU19USUdFUkxBS0UoZGV2aWQpKQ0KPiA+
ICsJCWZpbGwgPSBnZW4xMnAxX2dwZ3B1X2ZpbGxmdW5jOw0KPiANCj4gSSBmaW5kIHRoaXMgbmFt
aW5nIGEgYml0IG9kZC4NCj4gDQo+IElmIHlvdSBkb24ndCB3YW50IHRvIG92ZXJlbmFibGUgaXQg
Zm9yIGFsbCBHRU4xMiBiZWNhdXNlIHlvdSBkb24ndCBrbm93DQo+IHdoYXQgdGhlIGZ1dHVyZSBi
cmluZ3MgSSB0aGluayB3ZSBzaG91bGQgZ28gd2l0aCB0Z2xfKl9maWxsZnVuYywgc28gaXQncw0K
PiBjbG9zZXIgdG8gd2hhdCB3ZSBkbyBpbiBrZXJuZWwgKHVzaW5nIHBsYXRmb3JtIGNvZGVuYW1l
cyBhcyBmdW5jdGlvbg0KPiBwcmVmaXhlcykuIFRoaXMgd2F5IGl0IGlzYWxzbyAgZGlyZWNseSBy
ZWxhdGVkIHRvIGNoZWNrDQo+IChJU19USUdFUkxBS0UoKSkuDQo+IA0KPiBJZiBpdCBwcm92ZXMg
dG8gYmUgZ2VuZXJpYyB0aGVuIHdlIGNhbiBhbHdheSBjaGFuZ2UgdGhlIGNoZWNrIHRvDQo+IElT
X0dFTjEyKCkgb3Igd2hhdGV2ZXIgYW5kIHJlbmFtZSB0aGUgZnVuY3Rpb24gYWNjb3JkaW5nbHku
DQo+IA0KPiBUaGlzIGFwcGxpZXMgdG8gdGhlIG1lZGlhIHZhcmlhbnQgdG9vLg0KPiANCj4gT3Ro
ZXIgdGhhbiB0aGF0IGxvb2tzIGdvb2QsIGxldCdzIHNlZSB3aGF0IHRoZSBDSSBzYXlzLg0KPiAN
Cg0KRmlyc3QgcGF0Y2ggdmVyc2lvbiBoYWQgdGhpcyBuYW1pbmcgY29udmVudGlvbiwgdGdsXyBh
cyBwcmVmaXgsDQpidXQgd2UgZ290IG5lZ2F0aXZlIGZlZWRiYWNrIGFuZCBzdWdnZXN0aW9uIHRo
YXQgZnVuY3Rpb24gc2hvdWxkDQpjb250YWluIGdlblggaW4gdGhlIG5hbWUgYW5kIHNlbGVjdGlv
biBzaG91bGQgYmUgdXNpbmcgSVNfVElHRVJMQUtFKCkNCm1hY3JvLiBEdWUgdG8gbWFueSByZWFz
b25zIG5hbWluZyBpbiBnZW4xMiBpcyBub3QgZWFzeSwgc28gaW1vIA0Kd2UndmUgY2hvc2VuIGJl
c3Qgb3B0aW9uLg0KDQpaYmlnbmlldw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
