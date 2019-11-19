Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AD76E900
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:36:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
 <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
In-Reply-To: <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
Message-ID: <157416338013.10169.9033467622461448226@skylake-alporthouse-com>
Date: Tue, 19 Nov 2019 11:36:20 +0000
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0xMS0xOSAxMToyMjozMCkKPiAKPiBPbiAxOS8x
MS8yMDE5IDExOjExLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFZlbmthdGEgU2Fu
ZGVlcCBEaGFuYWxha290YSAoMjAxOS0xMS0xOSAxMTowMToxNykKPiA+PiBTaW5jZSBlbmdpbmVz
IGFyZSBub3cgbG9va2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5lIG1hcCwKPiA+PiBjb250
ZXh0IHNob3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5nIGluIGV4ZWNidWYu
Cj4gPiAKPiA+IFN0b3AgY2hhbmdpbmcgZnVuZGFtZW50YWwgdGVzdHMgb2YgbGVnYWN5IGJlaGF2
aW91ci4gSWYgeW91IHdhbnQgdG8KPiA+IGV4ZXJjaXNlIG5ldyBBUEksIGRvIHNvIGluIHBhcmFs
bGVsLgo+IAo+IFRoZSB0ZXN0IGlzIGFscmVhZHkgdXNpbmcgdGhlIG5ldyBhcGkgc28gYXMgaXQg
c3RhbmRzIHRoZXJlJ3MgYSBtaXNtYXRjaCAKPiBvbiBlbmdpbmUgZmxhZ3MgYW5kIGNvbnRleHQg
LSBzaW5jZSBpdCBwYXNzZXMgdGhlIGVuZ2luZSBmbGFncyB0byB0aGUgCj4gdGhyZWFkLCBkZXJp
dmVkIGZyb20gYSBjb250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJlYWQgdXNlcyBh
IAo+IGxlZ2FjeSBjb250ZXh0LiBJdCBoYXMgdG8gYmUgYWxpZ25lZCBmb3IgdGhlIGludGVuZGVk
IGVuZ2luZSB0byBnZXQgCj4gZXhlcmNpc2VkLgoKVGhlbiBjb25zaWRlciBpdCBhIHJldHJvc3Bl
Y3RpdmUgY29tcGxhaW50IGZvciBtdWNraW5nIHVwIGEgYmFzaWMgdGVzdCA6LXAKLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
