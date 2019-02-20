Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190220093625.15245-1-chris@chris-wilson.co.uk>
References: <20190220093625.15245-1-chris@chris-wilson.co.uk>
Date: Wed, 20 Feb 2019 16:21:45 +0200
Message-ID: <87woluwneu.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_exec: Remember
 to ask for permission to reset the GPU
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

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gbm9yZWNv
dmVyeSBpbnRlbnRpb25hbGx5IGlzc3VlcyBhIEdQVSByZXNldCwgYnV0IHdlIHNob3VsZCBvbmx5
IGRvIHNvCj4gYWZ0ZXIgY29uZmlybWluZyB3aXRoIHRoZSBrZXJuZWwgdGhhdCB0aGlzIGNhbiB3
b3JrLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+CgpSZXZpZXdlZC1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5p
bnRlbC5jb20+Cgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIHwgNSArKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aTkxNS9nZW1fY3R4X2V4ZWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKPiBpbmRleCA3
OGNmZTY2YzguLmQ2N2QwZWMyNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfZXhl
Yy5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+IEBAIC0xNTgsNyArMTU4LDEw
IEBAIHN0YXRpYyBib29sIGhhc19yZWNvdmVyYWJsZV9wYXJhbShpbnQgaTkxNSkKPiAgCj4gIHN0
YXRpYyB2b2lkIG5vcmVjb3ZlcnkoaW50IGk5MTUpCj4gIHsKPiArCWlndF9oYW5nX3QgaGFuZzsK
PiArCj4gIAlpZ3RfcmVxdWlyZShoYXNfcmVjb3ZlcmFibGVfcGFyYW0oaTkxNSkpOwo+ICsJaGFu
ZyA9IGlndF9hbGxvd19oYW5nKGk5MTUsIDAsIDApOwo+ICAKPiAgCWZvciAoaW50IHBhc3MgPSAx
OyBwYXNzID49IDA7IHBhc3MtLSkgewo+ICAJCXN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9w
YXJhbSBwYXJhbSA9IHsKPiBAQCAtMTkwLDYgKzE5Myw4IEBAIHN0YXRpYyB2b2lkIG5vcmVjb3Zl
cnkoaW50IGk5MTUpCj4gIAo+ICAJCWdlbV9jb250ZXh0X2Rlc3Ryb3koaTkxNSwgcGFyYW0uY3R4
X2lkKTsKPiAgCX0KPiArCj4gKwkgaWd0X2Rpc2FsbG93X2hhbmcoaTkxNSwgaGFuZyk7Cj4gIH0K
PiAgCj4gIGlndF9tYWluCj4gLS0gCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
