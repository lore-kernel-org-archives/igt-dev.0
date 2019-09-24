Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FF76E283
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2019 14:23:19 +0000 (UTC)
From: "Hong, Brandon" <brandon.hong@intel.com>
Date: Tue, 24 Sep 2019 14:22:02 +0000
Message-ID: <AB142004-E740-4450-807D-5ADEA95D565B@intel.com>
References: <20190924080207.1165-1-brandon.hong@intel.com>
 <156931357819.29243.12854292800894160440@skylake-alporthouse-com>
In-Reply-To: <156931357819.29243.12854292800894160440@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <6E1C0B83744B1548A6D707DD3C848650@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Fix global symbol loading failure in
 resolve function
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VW5mb3J0dW5hdGVseSwgSSBkbyBub3QgaGF2ZSBhIGNsZWFyIGFuc3dlciB3aHkgaXQncyBub3Qg
Ym91bmQuDQpJIGd1ZXNzIGl0J3MgcmVsYXRlZCB0byBJRlVOQyBsYXp5IGJpbmRpbmcgYmVjYXVz
ZSBJIG9ic2VydmVkIGNyYXNoIGNhbGwgc3RhY2sgcmVsYXRlZCB0byBnbGliYyBlbGZfbWFjaGlu
ZV9yZWxhKCkgYW5kIHRoZSBjcmFzaCBkaWRu4oCZdCBoYXBwZW4gd2hlbiBJIGNhbGwgdGhlIHNh
bWUgZ2xvYmFsIGZ1bmN0aW9uIGlndF94ODZfZmVhdHVyZXMoKSBpbiByZXdyaXR0ZW4gZ2VuZXJp
YyBGVU5DIGlndF9oYWxmX3RvX2Zsb2F0KCkgZm9yIHRlc3RpbmcuDQotIEJyYW5kb24NCg0KPiBP
biAyNCBTZXAgMjAxOSwgYXQgNToyNiBQTSwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+IHdyb3RlOg0KPiANCj4gUXVvdGluZyBicmFuZG9uLmhvbmdAaW50ZWwuY29tICgy
MDE5LTA5LTI0IDA5OjAyOjA3KQ0KPj4gRnJvbTogQnJhbmRvbiBIb25nIDxicmFuZG9uLmhvbmdA
aW50ZWwuY29tPg0KPj4gDQo+PiAyNzAgb3V0IG9mIDI4NCB0ZXN0cyBnZXQgZmFpbGVkIHdpdGgg
U0lHU0VHViBvbiBDbGVhckxpbnV4IGJlY2F1c2UgdGhlIGlmdW5jDQo+PiByZXNvbHZlciByZXNv
bHZlX2hhbGZfdG9fZmxvYXQoKSB0cmllcyB0byBjYWxsIHVuYm91bmQgZ2xvYmFsIGZ1bmN0aW9u
DQo+PiBpZ3RfeDg2X2ZlYXR1cmVzKCkuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IGFk
ZGluZyBhIEYxNkMgY2hlY2tpbmcNCj4+IGxvY2FsIGZ1bmN0aW9uLg0KPiANCj4gU28sIG91dCBv
ZiBjdXJpb3NpdHksIHdoeSBpcyB0aGUgZ2xvYmFsIGZ1bmN0aW9uIG5vdCBib3VuZD8NCj4gLUNo
cmlzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
