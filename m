Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF336EA7B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2019 12:34:52 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:34:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191023123447.GT1208@intel.com>
References: <31c7d25acd11432c66ccf4fa8fb2e9122c702306.1571799578.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31c7d25acd11432c66ccf4fa8fb2e9122c702306.1571799578.git.ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_eio: Attempt to fix
 reset-stress/unwedge-stress failures on SNB
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDg6MDQ6MjZQTSAtMDcwMCwgQXNodXRvc2ggRGl4aXQg
d3JvdGU6Cj4gZ2VtX2VpbyByZXNldC1zdHJlc3MgYW5kIHVud2VkZ2Utc3RyZXNzIHN1YnRlc3Rz
IGFyZSBub3cgcGFzc2luZyBvbgo+IGFsbCBwbGF0Zm9ybXMgZXhjZXB0IFNOQi4gQXR0ZW1wdCB0
byBmaXggZmFpbHVyZXMgaW4gU05CIGJ5IGdpdmluZwo+IGEgbGl0dGxlIG1vcmUgdGltZSB0byBj
b21wbGV0ZSB0aGUgd2VkZ2UuCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3Rv
cC5vcmcvc2hvd19idWcuY2dpP2lkPTEwOTY2MQo+IFNpZ25lZC1vZmYtYnk6IEFzaHV0b3NoIERp
eGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX2Vp
by5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMgYi90ZXN0cy9pOTE1L2dl
bV9laW8uYwo+IGluZGV4IDg5MmYzNjU3Yy4uMjBmNjZlMDBkIDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2k5MTUvZ2VtX2Vpby5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fZWlvLmMKPiBAQCAtMzAwLDcg
KzMwMCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3dhaXRfZWxhcHNlZChjb25zdCBjaGFyICpwcmVm
aXgsIGludCBmZCwgaWd0X3N0YXRzX3QgKnN0KQo+ICAJICogbW9kZXNldCBiYWNrIG9uKSBhcm91
bmQgcmVzZXRzLCBzbyBtYXkgdGFrZSBhIGxvdCBsb25nZXIuCj4gIAkgKi8KPiAgCWxpbWl0ID0g
MjUwZTY7Cj4gLQlpZiAoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1fZGV2aWQoZmQpKSA8IDUpCj4g
KwlpZiAoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1fZGV2aWQoZmQpKSA8PSA1KQoKVGhhdCBkb2Vz
bid0IGRvIGFueXRoaW5nIGZvciBzbmIuCgo+ICAJCWxpbWl0ICs9IDMwMGU2OyAvKiBndWVzdGlt
YXRlIGZvciAyeCB3b3JzdGNhc2UgbW9kZXNldCAqLwo+ICAKPiAgCW1lZCA9IGlndF9zdGF0c19n
ZXRfbWVkaWFuKHN0KTsKPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
