Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8416E0B7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 09:13:53 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
 <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <4275c85e-0eb9-63f7-bb0f-a8e29c2c4372@linux.intel.com>
Date: Wed, 20 Nov 2019 09:13:48 +0000
MIME-Version: 1.0
In-Reply-To: <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE5LzExLzIwMTkgMTE6MzYsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTExLTE5IDExOjIyOjMwKQo+Pgo+PiBPbiAxOS8xMS8yMDE5IDExOjEx
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBRdW90aW5nIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxh
a290YSAoMjAxOS0xMS0xOSAxMTowMToxNykKPj4+PiBTaW5jZSBlbmdpbmVzIGFyZSBub3cgbG9v
a2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5lIG1hcCwKPj4+PiBjb250ZXh0IHNob3VsZCBi
ZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5nIGluIGV4ZWNidWYuCj4+Pgo+Pj4gU3Rv
cCBjaGFuZ2luZyBmdW5kYW1lbnRhbCB0ZXN0cyBvZiBsZWdhY3kgYmVoYXZpb3VyLiBJZiB5b3Ug
d2FudCB0bwo+Pj4gZXhlcmNpc2UgbmV3IEFQSSwgZG8gc28gaW4gcGFyYWxsZWwuCj4+Cj4+IFRo
ZSB0ZXN0IGlzIGFscmVhZHkgdXNpbmcgdGhlIG5ldyBhcGkgc28gYXMgaXQgc3RhbmRzIHRoZXJl
J3MgYSBtaXNtYXRjaAo+PiBvbiBlbmdpbmUgZmxhZ3MgYW5kIGNvbnRleHQgLSBzaW5jZSBpdCBw
YXNzZXMgdGhlIGVuZ2luZSBmbGFncyB0byB0aGUKPj4gdGhyZWFkLCBkZXJpdmVkIGZyb20gYSBj
b250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJlYWQgdXNlcyBhCj4+IGxlZ2FjeSBj
b250ZXh0LiBJdCBoYXMgdG8gYmUgYWxpZ25lZCBmb3IgdGhlIGludGVuZGVkIGVuZ2luZSB0byBn
ZXQKPj4gZXhlcmNpc2VkLgo+IAo+IFRoZW4gY29uc2lkZXIgaXQgYSByZXRyb3NwZWN0aXZlIGNv
bXBsYWludCBmb3IgbXVja2luZyB1cCBhIGJhc2ljIHRlc3QgOi1wCgpIZSB3aG8gd29ya3MgbWFr
ZXMgbWlzdGFrZXMsIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIDopCgpBY2sgdGhlbiB0byBtZXJn
ZSB0aGlzIG9uZT8KCkFuZCBlbmdpbmUgZHJvcHBpbmcgZmxhdm91ciBvZiBnZW1fY3R4X2V4ZWMv
aW52YWxpZC1jb250ZXh0IHRvIGJlIHNlbnQgCmxhdGVyLgoKUmVnYXJkcywKClR2cnRrbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
