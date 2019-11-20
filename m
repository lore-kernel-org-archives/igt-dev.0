Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5B6E157
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 09:35:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
 <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
 <4275c85e-0eb9-63f7-bb0f-a8e29c2c4372@linux.intel.com>
In-Reply-To: <4275c85e-0eb9-63f7-bb0f-a8e29c2c4372@linux.intel.com>
Message-ID: <157424251926.13839.7955157468403454344@skylake-alporthouse-com>
Date: Wed, 20 Nov 2019 09:35:19 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0xMS0yMCAwOToxMzo0OCkKPiAKPiBPbiAxOS8x
MS8yMDE5IDExOjM2LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE5LTExLTE5IDExOjIyOjMwKQo+ID4+Cj4gPj4gT24gMTkvMTEvMjAxOSAxMToxMSwg
Q2hyaXMgV2lsc29uIHdyb3RlOgo+ID4+PiBRdW90aW5nIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxh
a290YSAoMjAxOS0xMS0xOSAxMTowMToxNykKPiA+Pj4+IFNpbmNlIGVuZ2luZXMgYXJlIG5vdyBs
b29rZWQgdXAgYmFzZWQgb24gY29udGV4dCBlbmdpbmUgbWFwLAo+ID4+Pj4gY29udGV4dCBzaG91
bGQgYmUgc2V0dXAgd2l0aCBlbmdpbmVzIGJlZm9yZSB1c2luZyBpbiBleGVjYnVmLgo+ID4+Pgo+
ID4+PiBTdG9wIGNoYW5naW5nIGZ1bmRhbWVudGFsIHRlc3RzIG9mIGxlZ2FjeSBiZWhhdmlvdXIu
IElmIHlvdSB3YW50IHRvCj4gPj4+IGV4ZXJjaXNlIG5ldyBBUEksIGRvIHNvIGluIHBhcmFsbGVs
Lgo+ID4+Cj4gPj4gVGhlIHRlc3QgaXMgYWxyZWFkeSB1c2luZyB0aGUgbmV3IGFwaSBzbyBhcyBp
dCBzdGFuZHMgdGhlcmUncyBhIG1pc21hdGNoCj4gPj4gb24gZW5naW5lIGZsYWdzIGFuZCBjb250
ZXh0IC0gc2luY2UgaXQgcGFzc2VzIHRoZSBlbmdpbmUgZmxhZ3MgdG8gdGhlCj4gPj4gdGhyZWFk
LCBkZXJpdmVkIGZyb20gYSBjb250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJlYWQg
dXNlcyBhCj4gPj4gbGVnYWN5IGNvbnRleHQuIEl0IGhhcyB0byBiZSBhbGlnbmVkIGZvciB0aGUg
aW50ZW5kZWQgZW5naW5lIHRvIGdldAo+ID4+IGV4ZXJjaXNlZC4KPiA+IAo+ID4gVGhlbiBjb25z
aWRlciBpdCBhIHJldHJvc3BlY3RpdmUgY29tcGxhaW50IGZvciBtdWNraW5nIHVwIGEgYmFzaWMg
dGVzdCA6LXAKPiAKPiBIZSB3aG8gd29ya3MgbWFrZXMgbWlzdGFrZXMsIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuIDopCj4gCj4gQWNrIHRoZW4gdG8gbWVyZ2UgdGhpcyBvbmU/Cj4gCj4gQW5kIGVu
Z2luZSBkcm9wcGluZyBmbGF2b3VyIG9mIGdlbV9jdHhfZXhlYy9pbnZhbGlkLWNvbnRleHQgdG8g
YmUgc2VudCAKPiBsYXRlci4KCkFjay4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
