Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20181231092250.13844-1-chris@chris-wilson.co.uk>
References: <20181231092250.13844-1-chris@chris-wilson.co.uk>
Date: Wed, 02 Jan 2019 15:03:34 +0200
Message-ID: <87pntf43fd.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] i915/gem_busy: Use a non-preemptible
 hanging batch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyaXRlczoKCj4gRW5zdXJl
IHRoYXQgdGhlIGhhbmdjaGVjayBub3RpY2VzIHRoZSBoYW5naW5nIGJhdGNoIGJ5IHVzaW5nIGEK
PiBub24tcHJlZW1wdGlibGUgc3BpbiBiYXRjaCwgYXMgc29tZSBmdXR1cmUgdmVyc2lvbnMgb2Yg
aGFuZ2NoZWNrIG1heQo+IGFsbG93IGEgcHJlZW1wdGlibGUgR1BVIGhvZyB0byBzdXJ2aXZlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
CgpSZXZpZXdlZC1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5j
b20+Cgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9idXN5LmMgfCA1ICsrKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9idXN5LmMgYi90ZXN0cy9pOTE1L2dlbV9idXN5LmMKPiBpbmRleCA3NmI0
NGE1ZDQuLmViM2QzZWYyYiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9idXN5LmMKPiAr
KysgYi90ZXN0cy9pOTE1L2dlbV9idXN5LmMKPiBAQCAtNDI3LDcgKzQyNywxMCBAQCBzdGF0aWMg
Ym9vbCBoYXNfZXh0ZW5kZWRfYnVzeV9pb2N0bChpbnQgZmQpCj4gIAo+ICBzdGF0aWMgdm9pZCBi
YXNpYyhpbnQgZmQsIHVuc2lnbmVkIHJpbmcsIHVuc2lnbmVkIGZsYWdzKQo+ICB7Cj4gLQlpZ3Rf
c3Bpbl90ICpzcGluID0gaWd0X3NwaW5fYmF0Y2hfbmV3KGZkLCAuZW5naW5lID0gcmluZyk7Cj4g
KwlpZ3Rfc3Bpbl90ICpzcGluID0KPiArCQlpZ3Rfc3Bpbl9iYXRjaF9uZXcoZmQsCj4gKwkJCQkg
ICAuZW5naW5lID0gcmluZywKPiArCQkJCSAgIC5mbGFncyA9IElHVF9TUElOX05PX1BSRUVNUFRJ
T04pOwo+ICAJc3RydWN0IHRpbWVzcGVjIHR2Owo+ICAJaW50IHRpbWVvdXQ7Cj4gIAlib29sIGJ1
c3k7Cj4gLS0gCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ2Z4Cg==
