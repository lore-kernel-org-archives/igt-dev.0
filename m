Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790088.outbound.protection.outlook.com [40.107.79.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5949989CD9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2019 15:15:35 +0000 (UTC)
From: "Wentland, Harry" <Harry.Wentland@amd.com>
Date: Wed, 27 Mar 2019 15:15:33 +0000
Message-ID: <535d9f19-8310-1d68-d4d8-2a1603c8053e@amd.com>
References: <20190315150442.10237-1-nicholas.kazlauskas@amd.com>
 <20190315150442.10237-3-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190315150442.10237-3-nicholas.kazlauskas@amd.com>
Content-Language: en-US
Content-ID: <16D9557BF95CD249ADF13F11B41EE1EC@namprd12.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] lib/igt_fb: Align min_stride to
 256 bytes for YUV buffers on amdgpu
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
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDMtMTUgMTE6MDQgYS5tLiwgTmljaG9sYXMgS2F6bGF1c2thcyB3cm90ZToN
Cj4gVGhlIGNocm9tYSBhZGRyZXNzIG5lZWRzIHRvIGJlIDI1NiBieXRlIGFsaWduZWQgb24gYW1k
Z3B1IGFuZCB0aGUNCj4gZWFzaWVzdCB3YXkgdG8gZG8gc28gaXMgdG8gYWxpZ24gdGhlIG1pbmlt
dW0gc3RyaWRlIGZvciB0aGUgbHVtYS4NCj4gDQo+IHYyOiBhZGRlZCB0aGlzIHBhdGNoDQo+IA0K
PiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IENjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1
c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieSBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIGxp
Yi9pZ3RfZmIuYyB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jDQo+IGluZGV4
IDZhOWE5MzQxLi5lODZiNWNiYyAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9mYi5jDQo+ICsrKyBi
L2xpYi9pZ3RfZmIuYw0KPiBAQCAtNDY3LDYgKzQ2NywxMiBAQCBzdGF0aWMgdWludDMyX3QgY2Fs
Y19wbGFuZV9zdHJpZGUoc3RydWN0IGlndF9mYiAqZmIsIGludCBwbGFuZSkNCj4gIAkJc3RyaWRl
ID0gcm91bmR1cF9wb3dlcl9vZl90d28oc3RyaWRlKTsNCj4gIA0KPiAgCQlyZXR1cm4gc3RyaWRl
Ow0KPiArCX0gZWxzZSBpZiAoaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3JtYXQpICYmIGlz
X2FtZGdwdV9kZXZpY2UoZmItPmZkKSkgew0KPiArCQkvKg0KPiArCQkgKiBDaHJvbWEgYWRkcmVz
cyBuZWVkcyB0byBiZSBhbGlnbmVkIHRvIDI1NiBieXRlcyBvbiBBTURHUFUNCj4gKwkJICogc28g
dGhlIGVhc2llc3Qgd2F5IGlzIHRvIGFsaWduIHRoZSBsdW1hIHN0cmlkZSB0byAyNTYuDQo+ICsJ
CSAqLw0KPiArCQlyZXR1cm4gQUxJR04obWluX3N0cmlkZSwgMjU2KTsNCj4gIAl9IGVsc2Ugew0K
PiAgCQl1bnNpZ25lZCBpbnQgdGlsZV93aWR0aCwgdGlsZV9oZWlnaHQ7DQo+ICANCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
