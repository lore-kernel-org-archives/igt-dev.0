Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F648914F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 16:26:33 +0000 (UTC)
Date: Wed, 20 Mar 2019 12:40:50 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
Message-ID: <20190320164050.GF30702@intel.com>
References: <20190319192320.10526-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190319192320.10526-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mocs_settings/mocs-isolation:
 Filter out missing rings
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6MjM6MjBQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IERvbid0IHRyeSB0byBldmFsdWF0ZSB3aGV0aGVyIHJlYWRzIGV4ZWN1dGVkIG9uIGFu
IGFic2VudCByaW5nIGRvCj4gYW55dGhpbmcuCgpDaHJpcywKCkkgYW0gdHJ5aW5nIHRvIHVuZGVy
c3RhbmQgdGhpcyBwYXRjaCBhbmQgaGFzIHRoaXMgcXVlc3Rpb24uCkFGQUlLIGV2ZXJ5IEdQVSBl
bmdpbmUgaGFzIGFuIGFzc29zaWF0ZWQgcmluZyBidWZmZXIgcGVyCmNvbnRleHQuIEFic2VudCBy
aW5nIGlzIGEgZXJyb3IgY2FzZT8KClRoYW5rcywKUHJhdGhhcAo+IAo+IFNpZ25lZC1vZmYtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9p
OTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9n
ZW1fbW9jc19zZXR0aW5ncy5jIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gaW5k
ZXggMjFmN2M2ZTEyLi4xYTMxMWI4YzAgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW9j
c19zZXR0aW5ncy5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbW9jc19zZXR0aW5ncy5jCj4gQEAg
LTU2NCw4ICs1NjQsOCBAQCBpZ3RfbWFpbgo+ICAJCQl9Cj4gIAkJfQo+ICAKPiAtCQlpZ3Rfc3Vi
dGVzdF9mKCJtb2NzLWlzb2xhdGlvbi0lcyIsCj4gLQkJCSAgICAgIGUtPm5hbWUpIHsKPiArCQlp
Z3Rfc3VidGVzdF9mKCJtb2NzLWlzb2xhdGlvbi0lcyIsIGUtPm5hbWUpIHsKPiArCQkJZ2VtX3Jl
cXVpcmVfcmluZyhmZCwgZS0+ZXhlY19pZCB8IGUtPmZsYWdzKTsKPiAgCQkJZ2VtX3JlcXVpcmVf
Y29udGV4dHMoZmQpOwo+ICAKPiAgCQkJaXNvbGF0aW9uX3Rlc3QoZmQsIGUtPmV4ZWNfaWQgfCBl
LT5mbGFncyk7Cj4gLS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
