Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680044.outbound.protection.outlook.com [40.107.68.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668986E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Feb 2019 19:49:21 +0000 (UTC)
From: "Wentland, Harry" <Harry.Wentland@amd.com>
Date: Wed, 27 Feb 2019 19:49:19 +0000
Message-ID: <dcee29cd-790f-1bdc-e676-ba984c877770@amd.com>
References: <20190222170846.6326-1-nicholas.kazlauskas@amd.com>
 <20190222173952.GV20097@intel.com>
 <60477ad6-8d5c-65ec-5fd0-d51bee586cb7@amd.com>
 <20190222185714.GX20097@intel.com>
 <22ecbaf2-de10-d2e2-86e5-9d93200b2ea8@amd.com>
In-Reply-To: <22ecbaf2-de10-d2e2-86e5-9d93200b2ea8@amd.com>
Content-Language: en-US
Content-ID: <426F0647559573439497A211319F65F7@namprd12.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Paint FBs
 with cairo source operator
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
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

c25pcA0KDQo+Pg0KPj4+DQo+Pj4gSG93ZXZlciwgdGhpcyBwYXRjaCB3b3VsZCBzdGlsbCBiZSBu
ZWVkZWQgc2luY2UgdGhlIGZpbGwgd2lsbCBzdGlsbCBiZQ0KPj4+IGJsZW5kZWQgYnkgZGVmYXVs
dC4gV2hlbiBjcmVhdGluZyB0cmFuc3BhcmVudCBvciBzZW1pLXRyYW5zcGFyZW50DQo+Pj4gYnVm
ZmVycyB0aGV5IHNob3VsZCBiZSBmaWxsZWQgaW4gd2l0aCB0aGUgY2Fpcm8gc291cmNlIG9wZXJh
dG9yIG9yIHRoZQ0KPj4+IGFscGhhIGNoYW5uZWwgd29uJ3QgYmUgc2V0IHRvIHRoZSBjb3JyZWN0
IHZhbHVlLg0KPj4NCj4+IEFGQUlDUyBpZiB0aGUgZGVzdCBhbHBoYSBhbmQgY29sb3IgYXJlIGJv
dGggMC4wIHRoZSBvbmx5IGZiIHRoYXQgaXMNCj4+IHdyb25nIGlzIGFyZ2JfZmJfMCBzaW5jZSB0
aGUgY3VycmVudCBjb2RlIHdpbGwgaW4gZmFjdCBnaXZlIHVzDQo+PiBhbHBoYSBvZiAxLjAuIGRy
YXdfc3F1YXJlcygpIHdpdGggT1ZFUiBzaG91bGQgc3RpbGwgZ2l2ZSB1cyB0aGUNCj4+IHNhbWUg
cmVzdWx0cyBhcyB3ZSdkIGdldCB3aXRoIFNPVVJDRS4NCj4+DQo+PiBJIGd1ZXNzIHRoaXMgbWVh
bnMgYW55IHRlc3Qgd2hpY2ggaXMgY3VycmVudGx5IHVzaW5nIGFyZ2JfZmJfMA0KPj4gaXMgZGVm
aW5pdGVseSBub3QgdGVzdGluZyBwZXItcGl4ZWwgYWxwaGEuDQo+Pg0KPj4gU28gYXJnYl90cmFu
c3BhcmFudCgpIGFuZCBiYXNpY19hbHBoYSgpIGFyZSBzaW1wbHkgdXNlbGVzcyBhdG0/DQo+Pg0K
Pj4gY29uc3RhbnRfYWxwaGFfbWluKCkgc2V0cyBwaXhlbF9ibGVuZF9tb2RlIHRvIE5vbmUgYW55
d2F5IHNvDQo+PiBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgd2hhdCB3ZSBoYXZlIGluIHRoZSBhbHBo
YSBjaGFubmVsLg0KPj4NCj4+IE5vdCBzdXJlIHdoeSB0aG9zZSB0ZXN0cyBhcmVuJ3QgZG9pbmcg
dGhlIGdyYXlfZmIgdGhpbmcgdGhlIG90aGVyIHRlc3RzDQo+PiBhcmUgdXNpbmcuLi4NCj4+DQo+
PiBBbnl3YXlzLCBubyBwb2ludCBpbiBibGVuZGluZyB3aGVuIHlvdSBkb24ndCBoYXZlIHRvIHNv
DQo+PiB0aGUgcGF0Y2ggc2VlbXMgdG8gbWFrZSBzZW5zZSB0byBtZSBlaXRoZXIgd2F5Og0KPj4g
UmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIExpa2UgeW91IHNhaWQsIHRoZSBtYWlu
IHByb2JsZW0gaXMgd2l0aCBhcmdiX2ZiXzAgDQo+IGFuZCBhcmdiX3RyYW5zcGFyZW50IGFuZCBi
YXNpY19hbHBoYSBidXQgaXQncyBiZXR0ZXIgdG8gYmUgZXhwbGljaXQgDQo+IGFib3V0IGludGVu
dCB3aXRoIHRoZSBzcXVhcmUgZmlsbGluZyB0b28gSU1PLg0KPiANCg0KTWVyZ2VkLg0KDQo+IE5p
Y2hvbGFzIEthemxhdXNrYXMNCj4gDQoNCnNuaXANCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
