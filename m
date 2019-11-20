Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4199F6E18F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 10:18:16 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
 <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
 <4275c85e-0eb9-63f7-bb0f-a8e29c2c4372@linux.intel.com>
 <157424251926.13839.7955157468403454344@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <58d5aec1-c55e-5675-6453-59b4e60b7b24@linux.intel.com>
Date: Wed, 20 Nov 2019 10:18:09 +0000
MIME-Version: 1.0
In-Reply-To: <157424251926.13839.7955157468403454344@skylake-alporthouse-com>
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

Ck9uIDIwLzExLzIwMTkgMDk6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTExLTIwIDA5OjEzOjQ4KQo+Pgo+PiBPbiAxOS8xMS8yMDE5IDExOjM2
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBRdW90aW5nIFR2cnRrbyBVcnN1bGluICgyMDE5LTEx
LTE5IDExOjIyOjMwKQo+Pj4+Cj4+Pj4gT24gMTkvMTEvMjAxOSAxMToxMSwgQ2hyaXMgV2lsc29u
IHdyb3RlOgo+Pj4+PiBRdW90aW5nIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxha290YSAoMjAxOS0x
MS0xOSAxMTowMToxNykKPj4+Pj4+IFNpbmNlIGVuZ2luZXMgYXJlIG5vdyBsb29rZWQgdXAgYmFz
ZWQgb24gY29udGV4dCBlbmdpbmUgbWFwLAo+Pj4+Pj4gY29udGV4dCBzaG91bGQgYmUgc2V0dXAg
d2l0aCBlbmdpbmVzIGJlZm9yZSB1c2luZyBpbiBleGVjYnVmLgo+Pj4+Pgo+Pj4+PiBTdG9wIGNo
YW5naW5nIGZ1bmRhbWVudGFsIHRlc3RzIG9mIGxlZ2FjeSBiZWhhdmlvdXIuIElmIHlvdSB3YW50
IHRvCj4+Pj4+IGV4ZXJjaXNlIG5ldyBBUEksIGRvIHNvIGluIHBhcmFsbGVsLgo+Pj4+Cj4+Pj4g
VGhlIHRlc3QgaXMgYWxyZWFkeSB1c2luZyB0aGUgbmV3IGFwaSBzbyBhcyBpdCBzdGFuZHMgdGhl
cmUncyBhIG1pc21hdGNoCj4+Pj4gb24gZW5naW5lIGZsYWdzIGFuZCBjb250ZXh0IC0gc2luY2Ug
aXQgcGFzc2VzIHRoZSBlbmdpbmUgZmxhZ3MgdG8gdGhlCj4+Pj4gdGhyZWFkLCBkZXJpdmVkIGZy
b20gYSBjb250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJlYWQgdXNlcyBhCj4+Pj4g
bGVnYWN5IGNvbnRleHQuIEl0IGhhcyB0byBiZSBhbGlnbmVkIGZvciB0aGUgaW50ZW5kZWQgZW5n
aW5lIHRvIGdldAo+Pj4+IGV4ZXJjaXNlZC4KPj4+Cj4+PiBUaGVuIGNvbnNpZGVyIGl0IGEgcmV0
cm9zcGVjdGl2ZSBjb21wbGFpbnQgZm9yIG11Y2tpbmcgdXAgYSBiYXNpYyB0ZXN0IDotcAo+Pgo+
PiBIZSB3aG8gd29ya3MgbWFrZXMgbWlzdGFrZXMsIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuIDop
Cj4+Cj4+IEFjayB0aGVuIHRvIG1lcmdlIHRoaXMgb25lPwo+Pgo+PiBBbmQgZW5naW5lIGRyb3Bw
aW5nIGZsYXZvdXIgb2YgZ2VtX2N0eF9leGVjL2ludmFsaWQtY29udGV4dCB0byBiZSBzZW50Cj4+
IGxhdGVyLgo+IAo+IEFjay4KClRoYW5rcywgcHVzaGVkIQoKU2FuZGVlcCB5b3UgY2FuIG5vdyBy
ZXdvcmsgZ2VtX2N0eF9leGVjL2ludmFsaWQtY29udGV4dCBzZXBhcmF0ZWx5LgoKUmVnYXJkcywK
ClR2cnRrbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
