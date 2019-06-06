Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9D9891CC
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2019 16:04:49 +0000 (UTC)
References: <20190530154222.16804-1-ramalingam.c@intel.com>
 <20190530154222.16804-6-ramalingam.c@intel.com>
 <20190606141701.GE1330@intel.intel>
 <3d9d21b8-1679-433d-1c6e-5a0abc2bbcd2@linux.intel.com>
 <20190606153126.GA5646@intel.com>
 <466b62a9-dace-21df-d69d-b01dc4706cf3@linux.intel.com>
 <20190606154848.GB5646@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <54b6d840-0e20-3390-fabd-039a0efe0cec@linux.intel.com>
Date: Thu, 6 Jun 2019 16:57:45 +0100
MIME-Version: 1.0
In-Reply-To: <20190606154848.GB5646@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] test/prime_vgem: use the
 gem_engine_topology library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA2LzA2LzIwMTkgMTY6NDgsIFJhbWFsaW5nYW0gQyB3cm90ZToKPiBPbiAyMDE5LTA2LTA2
IGF0IDE2OjM0OjAzICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4KPj4gT24gMDYvMDYv
MjAxOSAxNjozMSwgUmFtYWxpbmdhbSBDIHdyb3RlOgo+Pj4gT24gMjAxOS0wNi0wNiBhdCAxNToz
ODozNiArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiAwNi8wNi8yMDE5
IDE1OjE3LCBBbmRpIFNoeXRpIHdyb3RlOgo+Pj4+PiBIaSBSYW0sCj4+Pj4+Cj4+Pj4+IGp1c3Qg
YSBuaXRwaWNrCj4+Pj4+Cj4+Pj4+PiAtCWV4ZWNidWYuZmxhZ3MgPSByaW5nIHwgZmxhZ3M7Cj4+
Pj4+PiArCWV4ZWNidWYuZmxhZ3MgPSBlID8gZS0+ZmxhZ3MgOiBJOTE1X0VYRUNfREVGQVVMVDsK
Pj4+Pj4KPj4+Pj4gQmVjYXVzZSB3ZSBhcmUgbW92aW5nIHRvIHRoZSBuZXcgZW5naW5lIG5hbWlu
ZywgdGhlCj4+Pj4+ICJJOTE1X0VYRUNfREVGQVVMVCIgZW5naW5lLCBjb25jZXB0dWFsbHksIHNo
b3VsZCBub3QgYmUgdXNlZC4KPj4+Pj4KPj4+Pj4gUG9saXRpY2FsbHksIHdpdGggVHZydGtvLCB3
ZSBhZ3JlZWQgdGhhdCBoZSBkZWZhdWx0IGVuZ2luZSBub3cKPj4+Pj4gaXMgIkk5MTVfRU5HSU5F
X0NMQVNTX1JFTkRFUiIsIGl0J3Mgbm90IHRoZSBiZXN0IGFzIHNvbHV0aW9uLCBidXQKPj4+Pj4g
d29ya3MuCj4+Pj4KPj4+PiBJIHRvdGFsbHkgZG9uJ3QgcmVtZW1iZXIgSSBldmVyIHN1Z2dlc3Rl
ZCB0byB1c2UgY2xhc3Mgb3IgZXZlbiBpdCB3YXMKPj4+PiBkaXNjdXNzZWQuICA6KSBEaWRuJ3Qg
d2Ugc2F5IHRvIGp1c3QgdXNlIHplcm8/Cj4+PiBDYW4ndCB1c2UgSTkxNV9FWEVDX1JFTkRFUiBp
bnN0ZWFkIG9mIERFRkFVTFQhPyBiZWNhdXNlIHRoYXQgd2lsbCBiZQo+Pj4gZXhlY19mbGFnIGZv
ciByZW5kZXIgY2xhc3MgcmlnaHQ/Cj4+Cj4+IE5vLCBJOTE1X0VYRUNfUkVOREVSIGlzIDEgc28g
aWYgdGhlIGNvbnRleHQgaGFzIGVuZ2luZSBtYXAgY29uZmlndXJlZCB0aGF0Cj4+IHdpbGwgbWFw
IHRvIDJuZCBlbmdpbmUgaW4gdGhlIG1hcCAtIHdoaWNoIGlzIG5vdCByY3MwLgo+Pgo+PiBXZSBh
cmUgcmVseWluZyBoZXJlIG9uIHJjczAgYmVpbmcgZmlyc3QgKGluZGV4IDApLiBCdXQgdGhhdCBp
cyBhbHNvIG5vdAo+PiByZWxpYWJsZS4gV2UgbmVlZCBhIGxvb2t1cCBoZWxwZXIgdG8gYmUgbW9y
ZSByb2J1c3QgZ29pbmcgZm9yd2FyZC4KPiBzb21ldGhpbmcgbGlrZSBiZWxvdz8KPiAKPiBnZXRf
ZW5naW5lX2V4ZWNfZmxhZ19mb3JfY2xhc3MoZmQsIGUsIGNsYXNzKSBfX2Zvcl9lYWNoX3BoeXNp
Y2FsX2VuZ2luZShmZCwgZSkgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoZS0+Y2xhc3MgPT0gY2xhc3MpIHsgXAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGUtPmZsYWdzOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOyBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH0gXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
OwoKSSB0aGluayBpdCBuZWVkcyBhIGNvbnRleHQgYW5kIHN0cnVjdCBpOTE1X2VuZ2luZV9jbGFz
c19pbnN0YW5jZSBhcyAKaW5wdXQgYW5kIHJldHVybnMgZmxhZ3MsIHllcy4KCihmZCwgY3R4LCBj
aSkgLT4gZmxhZ3MKClJlZ2FyZHMsCgpUdnJ0a28KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
