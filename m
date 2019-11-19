Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D566E195
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:22:34 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
 <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <9d2b9921-d26f-4416-af34-1bb9b7d1bfa1@linux.intel.com>
Date: Tue, 19 Nov 2019 11:22:30 +0000
MIME-Version: 1.0
In-Reply-To: <157416186350.10169.17147049716181579154@skylake-alporthouse-com>
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

Ck9uIDE5LzExLzIwMTkgMTE6MTEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFZlbmth
dGEgU2FuZGVlcCBEaGFuYWxha290YSAoMjAxOS0xMS0xOSAxMTowMToxNykKPj4gU2luY2UgZW5n
aW5lcyBhcmUgbm93IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2luZSBtYXAsCj4+IGNv
bnRleHQgc2hvdWxkIGJlIHNldHVwIHdpdGggZW5naW5lcyBiZWZvcmUgdXNpbmcgaW4gZXhlY2J1
Zi4KPiAKPiBTdG9wIGNoYW5naW5nIGZ1bmRhbWVudGFsIHRlc3RzIG9mIGxlZ2FjeSBiZWhhdmlv
dXIuIElmIHlvdSB3YW50IHRvCj4gZXhlcmNpc2UgbmV3IEFQSSwgZG8gc28gaW4gcGFyYWxsZWwu
CgpUaGUgdGVzdCBpcyBhbHJlYWR5IHVzaW5nIHRoZSBuZXcgYXBpIHNvIGFzIGl0IHN0YW5kcyB0
aGVyZSdzIGEgbWlzbWF0Y2ggCm9uIGVuZ2luZSBmbGFncyBhbmQgY29udGV4dCAtIHNpbmNlIGl0
IHBhc3NlcyB0aGUgZW5naW5lIGZsYWdzIHRvIHRoZSAKdGhyZWFkLCBkZXJpdmVkIGZyb20gYSBj
b250ZXh0IHdpdGggZW5naW5lIG1hcCwgYnV0IHRoZSB0aHJlYWQgdXNlcyBhIApsZWdhY3kgY29u
dGV4dC4gSXQgaGFzIHRvIGJlIGFsaWduZWQgZm9yIHRoZSBpbnRlbmRlZCBlbmdpbmUgdG8gZ2V0
IApleGVyY2lzZWQuCgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
