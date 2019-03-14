Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42D789BBE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 23:56:31 +0000 (UTC)
References: <20190314232232.18226-1-antonio.argenziano@intel.com>
 <155260616014.30576.3110980035147255449@skylake-alporthouse-com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <71cb7b5d-b456-d4e1-4275-ee766104883c@intel.com>
Date: Thu, 14 Mar 2019 16:56:29 -0700
MIME-Version: 1.0
In-Reply-To: <155260616014.30576.3110980035147255449@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC] tests/i915/gem_exec_fence: Pre-fault objects
 with dependencies
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAzLzE0LzE5IDQ6MjkgUE0sIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIEFudG9u
aW8gQXJnZW56aWFubyAoMjAxOS0wMy0xNCAyMzoyMjozMikKPj4gSW4gdGhlIGZhdWx0IG1hbmFn
ZXIgY29kZSB3ZSB3YWl0IG9uIGFuIGFjdGl2ZSBvYmplY3QgdG8gY29tcGxldGUgYmVmb3JlCj4+
IHNlcnZpY2luZyB0aGUgZmF1bHQuIFRoaXMgbWVhbnQgdGhhdCB0aGUgb2JqZWN0ICdvdXQnIHVz
ZWQgaW4gdGhlIHRlc3QKPj4gY291bGQgbm90IGJlIHJlYWQgdW50aWwgaXQgYmVjYW1lIGluYWN0
aXZlIHdoaWNoIGNvdWxkIG5vdCBoYXBwZW4gc2luY2UKPj4gaXQgaXMga2VwdCBidXN5IGZyb20g
dGhlIHN0b3JlIHF1ZXVlZCBiZWhpbmQgdGhlIHNwaW5uZXIgKGF0IGxlYXN0KS4gVGhlCj4+IGJ1
ZyBiZWNhbWUgZXZpZGVudCBvbmx5IGFmdGVyIHVzaW5nIHRoZSBtbWFwX29mZnNldCBwYXRjaGVz
IHNpbmNlIHdlCj4+IHdlcmUgbm90IGZhdWx0aW5nIGJlZm9yZS4KPiAKPiBvdXQgaXMgdXNpbmcg
bW1hcF93YywgaXQgZG9lc24ndCBibG9jayBpbnNpZGUgdGhlIGZhdWx0IGhhbmRsZXIgdG9kYXku
Cj4gQW5kIGl0IGJldHRlciBoYWQgbm90IHN0YXJ0IGJsb2NraW5nIGluIHRoZSBmdXR1cmUuIE5v
dyBmb3IgdGhlIG9wcG9zaXRlCj4gcHJvYmxlbSBvZiByZW1vdmluZyB0aGUgZ3JhdHVpdG91cyBi
bG9ja2luZyBpbiB0aGUgZ3R0IGZhdWx0IGhhbmRsZXIsCj4gd2hpY2ggbWF5IHJlcXVpcmUgc29t
ZSByZW1pbmRlcnMgdG8gdXNlcnNwYWNlIHRoYXQgdGhleSBuZWVkZWQgdG8KPiBjb250cm9sIHN5
bmMgdGhlbXNlbHZlcy4KPiAtQ2hyaXMKPiAKClRoZSBjdXJyZW50IHBhdGNoZXMgZm9yIG1tYXBf
b2Zmc2V0IGRvIHdhaXQgb24gYWxsIHR5cGVzIG9mIG1hcHBpbmcsIHNvIApJIGd1ZXNzIHdlIG5l
ZWQgdG8gY2hhbmdlIHRoYXQuCgpATWF0dDogSSBzYXcgdGhhdCB0aGVyZSB3ZXJlIGxvdHMgb2Yg
Y29tbWVudHMgb24gdGhhdCBzZXJpZXMgc28gdGhpcyAKaXNzdWUgbWlnaHQgaGF2ZSBhbHJlYWR5
IGJlZW4gcG9pbnRlZCBvdXQsIGJ1dCBpZiBpdCBoYXNuJ3QgcGxlYXNlIGFkZCAKaXQgdG8gdGhl
IGxpc3QgOykKClRoYW5rcywKRGFuaWVsZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
