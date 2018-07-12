Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3A06E27B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 13:00:34 +0000 (UTC)
Date: Thu, 12 Jul 2018 16:00:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180712130031.GA5565@intel.com>
References: <20180712101245.20683-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180712101245.20683-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] igt/kms_flip_tiling: Check GEM
 availability before use
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

T24gVGh1LCBKdWwgMTIsIDIwMTggYXQgMTE6MTI6NDVBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFdlIHVzZSB0aGUgR1BVIHRvIGNvbnZlcnQgYmV0d2VlbiB0aWxpbmcgZm9ybWF0cywg
aW5kaXJlY3RseSB2aWEgdGhlCj4gY2FsbCB0byBpZ3RfY3JlYXRlX3BhdHRlcm5fZmIuIFNvIGJl
Zm9yZSB3ZSB0cnkgYW5kIGV4ZWN1dGUgY29tbWFuZHMgb24KPiB0aGUgR1BVLCB3ZSBzaG91bGQg
Y2hlY2sgdGhhdCB0aGUgR1BVIGlzIGF2YWlsYWJsZS4KClNob3VsZCB0aGlzIG9uZSBiZSBpbiB0
aGUgYWN0dWFseSBzcG90IGluIGlndF9mYi5jIHdoZXJlIHdlIGRvCnRoZSBnZW0gc3R1ZmY/IEkg
Y291bGQgaW1hZ2luZSBvdGhlciBkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gYWRkCnRoZWlyIG93biBt
ZWNoYW5pc21zIHRoZXJlLgoKT3Igd2UgYWRkIHNvbWUga2luZCBvZiBpZ3RfcmVxdWlyZV9mYigp
IHRvIGluZGljYXRlIGlndF9mYgp3aWxsIGJlIHVzZWQ/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9rbXNf
ZmxpcF90aWxpbmcuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZsaXBfdGlsaW5nLmMgYi90ZXN0cy9rbXNfZmxpcF90
aWxpbmcuYwo+IGluZGV4IGJlZWIxMTFiZS4uNzdlZDhhNjhmIDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2ttc19mbGlwX3RpbGluZy5jCj4gKysrIGIvdGVzdHMva21zX2ZsaXBfdGlsaW5nLmMKPiBAQCAt
MTQ3LDYgKzE0Nyw3IEBAIGlndF9tYWluCj4gIAlpZ3RfZml4dHVyZSB7Cj4gIAkJZGF0YS5kcm1f
ZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRFTCk7Cj4gIAkJZGF0YS5nZW4g
PSBpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCkpOwo+ICsJCWlndF9y
ZXF1aXJlX2dlbShkYXRhLmRybV9mZCk7Cj4gIAo+ICAJCWttc3Rlc3Rfc2V0X3Z0X2dyYXBoaWNz
X21vZGUoKTsKPiAgCj4gLS0gCj4gMi4xOC4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
