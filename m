Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B43896BF
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2019 10:00:12 +0000 (UTC)
Date: Tue, 19 Mar 2019 12:00:03 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190319100003.GA1135@intel.intel>
References: <20190318232812.1307-1-andi.shyti@intel.com>
 <20190318232812.1307-6-andi.shyti@intel.com>
 <155298860922.4168.17028662959715453239@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155298860922.4168.17028662959715453239@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH v12 5/7] lib/i915: add gem_engine_topology
 library
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
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiA+IDEuIGdlbV90b3BvbG9neV9oYXNfZW5naW5lKCk6IGNoZWNrcyBpZiB0aGUgZW5naW5lIGlz
IHByZXNlbnQgYnkKPiA+ICAgIHF1ZXJ5aW5nIHRoZSBkcml2ZXIgaW4gYSB3YXkgdGhhdCB0aGUg
Y2FsbGVyIGZ1bmN0aW9uIHdvdWxkbid0Cj4gPiAgICBrbm93IGlmIHRoZSBhYm92ZSBpb2N0bHMg
YXJlIGltcGxlbWVudGVkLgo+ID4gCj4gPiAyLiBnZW1fc2V0X2ViX2ZsYWdzKCk6IHNldHMgdGhl
IGV4ZWN1dGlvbiBidWZmZXIgZmxhZyBkZXBlbmRpbmcKPiA+ICAgIHdoZXRoZXIgaXQgcmVmZXJz
IHRvIGNvbnRleHQtZW5naW5lIG1hcHBpbmcgb3Igbm90Lgo+ID4gCj4gPiAzLiBnZW1fY29udGV4
dF9leGVjYnVmKCk6IGlzIGEgd3JhcHBlciB0aGF0IGV4ZWN1dGVzIHRoZSBidWZmZXIKPiA+ICAg
IGluIGEgd2F5IHRoYXQgdGhlIGNhbGxpbmcgZnVuY3Rpb24gZG9lc24ndCBrbm93IGFib3V0IHRo
ZQo+ID4gICAgaW9jdGxzIGluIHRoZSBkcml2ZXIuCj4gCj4gWW91IGFyZSBub3QgZ29pbmcgdG8g
Z2V0IG1lIHRvIHVzZSBnZW1fY29udGV4dF9leGVjYnVmLCBvcgo+IGdlbV9zZXRfZWJfZmxhZ3Mo
KS4gSSBqdXN0IHdhbnQgYSBmdW5jdGlvbiB0aGF0IHJldHVybnMgdGhlIGZsYWdzIGZvciBhCj4g
Z2l2ZW4gZW5naW5lIGluIHRoaXMgY29udGV4dCwgYXMgOTklIG9mIHRoZSB0aW1lIEkgYWxyZWFk
eSBleHBlY3QgdG8KPiBoYXZlIHRoZSByaWdodCBmbGFncy4KClRoYXQncyBmaW5lLCBJIHRob3Vn
aHQgaXQgbWlnaHQgYmUgY2xlYW5lciB0byBoYXZlIHdyYXBwZXJzCmFyb3VuZCB0aGF0IGFic3Ry
YWN0cyB3aGF0ZXZlciBpcyBiZWxvdy4gQnV0IGFueXdheSB0aGF0J3MgYW4KZWFzeSBmaXgganVz
dCBtYWtlIGEgZ2VtX2dldF9lYl9mbGFncyBpbnN0ZWFkIG9mIGEKZ2VtX3NldF9lYl9mbGFncy4K
ClRoZSB0aGluZyB0aGF0IEkgbGlrZSBsZXNzIGlzIHRoYXQgdGhlIGNoYWluIG9mIGNhbGxzIHN0
YXJ0cwpnZXR0aW5nIHRvbyBsb25nIGFuZCBoYXJkIHRvIGZvbGxvdy4KCk9uIHRoZSBvdGhlciBo
YW5kLCB0aGUgYW1vdW50IG9mIHRobmdzIHRvIGJlIGRvbmUgYmVmb3JlIGNhbGxpbmcKYW4gZXhl
Y2J1ZiB3b3VsZCBzdGFydHMgYmVpbmcgdG9vIGRlbWFuZGluZyAodGhlcmVmb3JlIGhhcmQgdG8K
Zm9sbG93KS4KCkkgdGhpbmsgdGhpcyBjaGVjayBzaG91bGQgYmUgZG9uZSBkaXJlY3RseSBieSBl
eGVjYnVmLCBzbyB0aGF0CnRoZSBjYWxsZXIgZnVuY3Rpb24gd291bGQgYmUgY29tcGxldGVseSBh
Z25vc3RpYy4gQnV0IHRoaXMKcmVxdWlyZXMgcXVpdGUgc29tZSByZS13b3JrIGFyb3VuZCwgd2hp
Y2ggZGVmaW5pdGVseSBnb2VzIGZhciAKYmV5b25kIHRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2hz
ZXQuCgpBbmRpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
