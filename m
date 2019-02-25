Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0789B95
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Feb 2019 22:46:40 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190225182804.28810-1-antonio.argenziano@intel.com>
References: <20190221192745.31178-3-antonio.argenziano@intel.com>
 <20190225182804.28810-1-antonio.argenziano@intel.com>
Message-ID: <155113478835.25084.16655203699535043204@skylake-alporthouse-com>
Date: Mon, 25 Feb 2019 22:46:28 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] lib/i915: add mmap_offset support
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Janulgue Abdiel <abdiel.janulgue@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjUgMTg6Mjg6MDMpCj4gQEAgLTgx
Miw3ICs4MjcsMTIgQEAgdm9pZCAqX19nZW1fbW1hcF9fd2MoaW50IGZkLCB1aW50MzJfdCBoYW5k
bGUsIHVpbnQ2NF90IG9mZnNldCwgdWludDY0X3Qgc2l6ZSwgdW4KPiAgICovCj4gIHZvaWQgKmdl
bV9tbWFwX193YyhpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdWludDY0X3Qgb2Zmc2V0LCB1aW50
NjRfdCBzaXplLCB1bnNpZ25lZCBwcm90KQo+ICB7Cj4gLSAgICAgICB2b2lkICpwdHIgPSBfX2dl
bV9tbWFwX193YyhmZCwgaGFuZGxlLCBvZmZzZXQsIHNpemUsIHByb3QpOwo+ICsgICAgICAgdm9p
ZCAqcHRyOwo+ICsKPiArICAgICAgIHB0ciA9IF9fZ2VtX21tYXBfb2Zmc2V0KGZkLCBoYW5kbGUs
IG9mZnNldCwgc2l6ZSwgcHJvdCwgTE9DQUxfSTkxNV9NTUFQX09GRlNFVF9XQyk7Cj4gKyAgICAg
ICBpZiAoIXB0cikKPiArICAgICAgICAgICAgICAgcHRyID0gX19nZW1fbW1hcF9fd2MoZmQsIGhh
bmRsZSwgb2Zmc2V0LCBzaXplLCBwcm90KTsKPiArCj4gICAgICAgICBpZ3RfYXNzZXJ0KHB0cik7
Cj4gICAgICAgICByZXR1cm4gcHRyOwo+ICB9Cj4gQEAgLTg0OSw3ICs4NjksMTIgQEAgdm9pZCAq
X19nZW1fbW1hcF9fY3B1KGludCBmZCwgdWludDMyX3QgaGFuZGxlLCB1aW50NjRfdCBvZmZzZXQs
IHVpbnQ2NF90IHNpemUsIHUKPiAgICovCj4gIHZvaWQgKmdlbV9tbWFwX19jcHUoaW50IGZkLCB1
aW50MzJfdCBoYW5kbGUsIHVpbnQ2NF90IG9mZnNldCwgdWludDY0X3Qgc2l6ZSwgdW5zaWduZWQg
cHJvdCkKPiAgewo+IC0gICAgICAgdm9pZCAqcHRyID0gX19nZW1fbW1hcF9fY3B1KGZkLCBoYW5k
bGUsIG9mZnNldCwgc2l6ZSwgcHJvdCk7Cj4gKyAgICAgICB2b2lkICpwdHI7Cj4gKwo+ICsgICAg
ICAgcHRyID0gX19nZW1fbW1hcF9vZmZzZXQoZmQsIGhhbmRsZSwgb2Zmc2V0LCBzaXplLCBwcm90
LCBMT0NBTF9JOTE1X01NQVBfT0ZGU0VUX1dCKTsKPiArICAgICAgIGlmICghcHRyKQo+ICsgICAg
ICAgICAgICAgICBwdHIgPSBfX2dlbV9tbWFwKGZkLCBoYW5kbGUsIG9mZnNldCwgc2l6ZSwgcHJv
dCwgMCk7Cj4gKwo+ICAgICAgICAgaWd0X2Fzc2VydChwdHIpOwo+ICAgICAgICAgcmV0dXJuIHB0
cjsKCkkgd291bGQgbWFrZSBtb3ZpbmcgZ2VtX21tbWFwX193YywgZ2VtX21tYXBfX2NwdSwgZ2Vt
X21tYXBfX2d0dCBhbmQKdGhlaXIgc3VwcG9ydCBvdmVyIHRvIGdlbV9tbWFuLmMgYXMgcGF0Y2gg
MC4gVGhlbiBpbnRyb2R1Y2UKbW1hcF9fb2Zmc2V0LgotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
