Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360536E612
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2019 12:12:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <83ec90078fbaad813807773ef63f3ec193d5d95a.camel@intel.com>
References: <20190814102140.3275-1-lukasz.kalamarz@intel.com>
 <20190814102140.3275-2-lukasz.kalamarz@intel.com>
 <156577850123.2301.8058170876745324840@skylake-alporthouse-com>
 <83ec90078fbaad813807773ef63f3ec193d5d95a.camel@intel.com>
Message-ID: <157174631514.2684.16851495084789910777@skylake-alporthouse-com>
Date: Tue, 22 Oct 2019 13:11:55 +0100
Subject: Re: [igt-dev] [RFC PATCH 1/4] lib/i915/gem_mman: add mmap_offset
 support
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
To: "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Auld, Matthew" <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgKDIwMTktMTAtMjIgMDc6NDI6NTkpCj4gT24g
V2VkLCAyMDE5LTA4LTE0IGF0IDExOjI4ICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBR
dW90aW5nIEx1a2FzeiBLYWxhbWFyeiAoMjAxOS0wOC0xNCAxMToyMTozNykKPiA+ID4gKyNkZWZp
bmUgTE9DQUxfSTkxNV9QQVJBTV9NTUFQX09GRlNFVF9WRVJTSU9OIDU0Cj4gPiA+ICsKPiA+ID4g
K2Jvb2wgZ2VtX2hhc19tbWFwX29mZnNldChpbnQgZmQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAg
c3RhdGljIGludCBoYXNfbW1hcF9vZmZzZXQgPSAtMTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlm
IChoYXNfbW1hcF9vZmZzZXQgPT0gLTEpIHsKPiA+IAo+ID4gSG93IG1hbnkgdGltZXMgZG8gSSBo
YXZlIHRvIHNheSB0aGF0IEkgYW0gc29ycnkgZm9yIGludHJvZHVjaW5nIHN0YXRpYwo+ID4gaGVy
ZS4gSXQgd2FzIHRvIGN1dCBkb3duIG9uIHN0cmFjZSBzcGFtLCBidXQgbm8gb25lIHNob3VsZCBi
ZSByZXBlYXRlZGx5Cj4gPiBjaGVja2luZywgc28gcGxlYXNlIGRvbid0IGNhcmdvIGN1bHQgaXQu
IEl0IGRvZXNuJ3QgYm9kZSB3ZWxsLgo+ID4gLUNocmlzCj4gCj4gV2hhdCdzIHdyb25nIHdpdGgg
dGhpcyBvcHRpbWl6YXRpb24gdGVjaG5pcXVlPyBJcyB0aGF0IHBvc3NpYmxlIGZvciBzaW5nbGUK
PiBpOTE1IGRyaXZlciB3ZSBnb3QgZGlmZmVyZW50IHJlc3VsdHM/IE9ubHkgcmVhc29uIEkgc2Vl
IHdvdWxkIGJlIHRvIGhhdmUKPiB0d28gZGlmZmVyZW50IEdQVSdzIHdpdGggZGlmZmVyZW50IGdl
bmVyYXRpb25zLCBidXQgaXQgaXMgaW1wb3NzaWJsZT8KClRoZSB3b3JsZCBoYXMgY2hhbmdlZCBh
bmQgdGhhdCBpcyBub3cgdmVyeSBwb3NzaWJsZS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
