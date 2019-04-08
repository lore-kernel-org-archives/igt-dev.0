Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BBA89134
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 16:18:37 +0000 (UTC)
References: <20190408155038.2389-1-ramalingam.c@intel.com>
 <0af7234a-5e45-c0fb-3f27-6201ee7fa15b@linux.intel.com>
 <155473982972.26510.15407723830372754424@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <a102e4b7-4853-e0fc-fd9f-e5668a61c80e@linux.intel.com>
Date: Mon, 8 Apr 2019 17:18:34 +0100
MIME-Version: 1.0
In-Reply-To: <155473982972.26510.15407723830372754424@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap: test for non
 pagealingned mmaps
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Ramalingam C <ramalingam.c@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA4LzA0LzIwMTkgMTc6MTAsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTA0LTA4IDE3OjAxOjAwKQo+Pgo+PiBPbiAwOC8wNC8yMDE5IDE2OjUw
LCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4+PiBLZXJuZWwgc3VwcG9ydHMgdGhlIG5vbiBwYWdlIGFs
aWduZWQgbW1hcHMuIEhlbmNlIHRoaXMgbmV3IHN1YnRlc3QKPj4KPj4gcy9LZXJuZWwvaTkxNS8g
dG8gbWFrZSBDaHJpcyBoYXBweS4gTWF5YmUgYWxzbyBleHBhbmQgd2l0aCAiYnkgbWlzdGFrZSIK
Pj4gYW5kIGNsYXJpZnkgdGhpcyBhcHBsaWVzIG9ubHkgdG8gQ1BVIFdDIG1tYXAgZmxhdm91ci4K
CkkgbmVlZCB0byBjb3JyZWN0IG15c2VsZiwgaXQgYXBwbGllcyB0byBhbGwgQ1BVIG1tYXAgZmxh
dm91cnMuIFNvIHRoZSAKdGVzdCB3b3VsZCBuZWVkIHRvIHRlc3QgYm90aCBzdHJpY3RseSBzcGVh
a2luZy4KCj4+Cj4+IFVubGVzcyBDaHJpcyBpcyBvYmplY3RpbmcgdG8gdGVzdGluZyB0aGlzIHRv
IHN0YXJ0IHdpdGg/Cj4gCj4gQ29ycmVjdC4gVGhpcyBpcyBub3QgYmVoYXZpb3VyIHdlIGV4cGVj
dCB0byBiZSBlbnNocmluZWQgaW4gdGhlIEFCSSBmb3IKPiBmdXR1cmUgZ2VuZXJhdGlvbnMuCgpP
bmUgY291bGQgYXJndWUgdGhhdCBzaW5jZSB2bV9tbWFwIHNpbGVudGx5IGFsaWducyBpdCBpcyB0
aGUgTGludXggQUJJLiAKQW5kIHdlIGRpZCBoYXZlIGFuIHVzZXIgcmVwb3J0IGZvciB0aGUgcmVn
cmVzc2lvbi4KCkJ1dCBpZiB3ZSBoYXZlIHJlYWNoZWQgYW5vdGhlciBpbXBhc3NlLCBteSBzdWdn
ZXN0aW9uIGlzIHRoYXQgUmFtIGp1c3QgCmNsb3NlcyB0aGUgYXNzaWduZWQgdGlja2VkIHdpdGgg
UkVTT0xWRUQvV09OVEZJWCwgcmVmZXJlbmNlcyB0aGUgbWFpbGluZyAKbGlzdCBkaXNjdXNzaW9u
LCBhbmQgbW92ZXMgb24uIEl0J3Mgbm90IHdvcnRoIHRoZSBoYXNzbGUuCgpSZWdhcmRzLAoKVHZy
dGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
