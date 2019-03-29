Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1702C6E8CC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 12:05:51 +0000 (UTC)
Date: Fri, 29 Mar 2019 14:05:48 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190329120548.GB1167@intel.intel>
References: <20190328192206.1591-1-andi.shyti@intel.com>
 <20190328192206.1591-5-andi.shyti@intel.com>
 <4e44b45c-dc37-b4c2-0f13-b14b2fb5ccd9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e44b45c-dc37-b4c2-0f13-b14b2fb5ccd9@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v16 4/8] lib/i915: add gem_engine_topology
 library and for_each loop definition
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVHZydGtvLAoKPiA+ICsJbmVuZ2luZXMgPSBwYXJhbS5zaXplID4gc2l6ZW9mKHN0cnVjdCBp
OTE1X2NvbnRleHRfcGFyYW1fZW5naW5lcykgPwo+ID4gKwkJICAgKHBhcmFtLnNpemUgLSBzaXpl
b2Yoc3RydWN0IGk5MTVfY29udGV4dF9wYXJhbV9lbmdpbmVzKSkgLwo+ID4gKwkJICAgc2l6ZW9m
KGVuZ2luZXMuY2xhc3NfaW5zdGFuY2VbMF0pIDoKPiA+ICsJCSAgIDA7Cj4gPiArCj4gPiArCWln
dF9hc3NlcnRfZihuZW5naW5lcyA8IEdFTV9NQVhfRU5HSU5FUywgInVuc3VwcG9ydGVkIGVuZ2lu
ZSBjb3VudFxuIik7Cj4gCj4gU2hvdWxkIHRoaXMgYmUgPD0gPwoKeWVzCgo+ID4gK3N0cnVjdCBp
bnRlbF9lbmdpbmVfZGF0YSB7Cj4gPiArCXVpbnQzMl90IG5lbmdpbmVzOwo+ID4gKwl1aW50MzJf
dCBuOwo+ID4gKwlpbnQgZXJyb3I7Cj4gPiArCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5l
MiAqY3VycmVudF9lbmdpbmU7Cj4gPiArCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAq
Y3VycmVudF9waHlzX2VuZ2luZTsKPiAKPiBUaGlzIGZpZWxkIHNlZW0gb25seSBldmVyIGFzc2ln
bmVkLCBuZXZlciBvdGhlcndpc2UgdXNlZC4gRG8geW91IG5lZWQgaXQgZm9yCj4gc29tZXRoaW5n
IGxhdGVyPwoKSSB0b29rIHRoZSBjb21tZW50IGZyb20gQ2hyaXMgdGhhdCB3YW50ZWQgdG8gaGF2
ZSB0d28gc2VwYXJhdGUKbGlzdHMsIGJ1dCBpbmRlZWQgdGhpcyBkb2VuJ3QgbG9vayBmdWxseSBy
aWdodCAob3IgbWF5YmUgSSBkaWRuJ3QKZnVsbHkgZ2V0IHdoYXQgaGUgbWVhbnQgZXhhY3RseSkK
Cj4gPiArI2RlZmluZSBmb3JfZWFjaF9jb250ZXh0X2VuZ2luZShmZF9fLCBjdHhfXywgZV9fKSBc
Cj4gPiArCWZvciAoc3RydWN0IGludGVsX2VuZ2luZV9kYXRhIGlfXyA9IGludGVsX2luaXRfZW5n
aW5lX2xpc3QoZmRfXywgY3R4X18pOyBcCj4gPiArCSAgICAgKChlX18pID0gaW50ZWxfZ2V0X2N1
cnJlbnRfZW5naW5lKCZpX18pKTsgXAo+ID4gKwkgICAgIGludGVsX25leHRfZW5naW5lKCZpX18p
KQo+ID4gKwo+IAo+IEkgd291bGQgcHJvYmFibHkgaGF2ZSB0aGUgcGh5c2ljYWwgdnMgdmlydHVh
bCBsb2dpYyBpbiB0aGUgIm5leHQiIGhlbHBlciBhbmQKPiBqdXN0IG9uZSBpbnRlbF9nZXRfY3Vy
cmVudF9lbmdpbmUgYnV0IGl0IGlzIG5vdCB2ZXJ5IHJlbGV2YW50LgoKU3VyZSEgSXQncyBzaW1w
bGVyLgoKPiBMb29rcyBtb3N0bHkgYXMgZXhwZWN0ZWQuIEkgdHJ1c3QgeW91IHRlc3RlZCBpdCB3
b3Jrcy4gOikgV2l0aCB0aGUgYXNzZXJ0Cj4gZml4ZWQgYW5kIHVudXNlZCBzdHJ1Y3QgbWVtYmVy
IHJlbW92ZWQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxp
bkBpbnRlbC5jb20+CgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3cyEKCkFuZGkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
