Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190610125550.20870-1-chris@chris-wilson.co.uk>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <5e1a5c92-3342-16f8-b72e-7f1cf9c366f4@linux.intel.com>
Date: Mon, 10 Jun 2019 15:59:56 +0300
MIME-Version: 1.0
In-Reply-To: <20190610125550.20870-1-chris@chris-wilson.co.uk>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap_gtt: Disregard forked
 subtests on ICL for reasons
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTAvMDYvMjAxOSAxNTo1NSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IE5vdGhpbmcgdG8gc2Vl
IGhlcmUsIHBsZWFzZSBtb3ZlIGFsb25nLgo+IAo+IFhYWDogVXBkYXRlIHdpdGggYmV0dGVyIGJ1
Z3ppbGxhCgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTA4
ODIKCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTEwNzcxMyNjMTI1Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRl
bC5jb20+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMgfCAzICsrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUv
Z2VtX21tYXBfZ3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jCj4gaW5kZXggMDM0NjU4
ZTY0Li5jM2NiNWRiMmQgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYwo+
ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX21tYXBfZ3R0LmMKPiBAQCAtNjU2LDYgKzY1Niw5IEBAIHRl
c3RfaHVnZV9jb3B5KGludCBmZCwgaW50IGh1Z2UsIGludCB0aWxpbmdfYSwgaW50IHRpbGluZ19i
LCBpbnQgbmNwdXMpCj4gIAl1aW50NjRfdCBodWdlX29iamVjdF9zaXplLCBpOwo+ICAJdW5zaWdu
ZWQgbW9kZSA9IENIRUNLX1JBTTsKPiAgCj4gKwlpZ3RfZmFpbF9vbl9mKGludGVsX2dlbihkZXZp
ZCkgPj0gMTEgJiYgbmNwdXMgPiAxLAo+ICsJCSAgICAgICJQbGVhc2UgYWRqdXN0IHlvdXIgZXhw
ZWN0YXRpb25zLCBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MDc3MTMjYzEyNVxuIik7Cj4gKwo+ICAJc3dpdGNoIChodWdlKSB7Cj4gIAljYXNlIC0yOgo+ICAJ
CWh1Z2Vfb2JqZWN0X3NpemUgPSBnZW1fbWFwcGFibGVfYXBlcnR1cmVfc2l6ZSgpIC8gNDsKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
