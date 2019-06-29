Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190627102019.9019-1-tvrtko.ursulin@linux.intel.com>
References: <20190627102019.9019-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <156181746757.32289.11457530637113441582@skylake-alporthouse-com>
Date: Sat, 29 Jun 2019 15:11:07 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_switch: Update with
 engine discovery
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNi0yNyAxMToyMDoxOSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEkgY29udmVydGVkIHRo
aXMgb25lIGFzIGFuIGV4YW1wbGUsIG9yIGF0IGxlYXN0IHRvIGRyaXZlIHRoZSBkaXNjdXNzaW9u
LAo+IGhvdyBtb3JlIGNvbXBsZXggdGVzdHMgY2FuIGJlIGNvbnZlcnRlZC4KPiAKPiBJIGhhdmUg
a2VwdCB0aGUgbGVnYWN5IGV4ZWNidWYgYWJpIHRlc3RpbmcgcHJlZml4ZWQgd2l0aCAibGVnYWN5
LSIuCj4gCj4gTmV3IHRlc3RzIHdlcmUgYWRkZWQgdG8gZXhlcmNpc2UgcGh5c2ljYWwgZW5naW5l
cyB2aWEgZW5naW5lIGRpc2NvdmVyeSBhbmQKPiBhbHNvICJhbGwiIHRlc3RzIGhhdmUgYmVlbiB1
cGRhdGVkIGluIHRoZSBzYW1lIHdheS4KPiAKPiBUbyBrZWVwIHRoaW5ncyBzaW1wbGVyIGFuZCBh
dm9pZCBoYXZpbmcgdG8gY3JlYXRlIHNlcGFyYXRlIGNvbnRleHRzIGxlZ2FjeQo+IHRlc3RzIGhh
dmUgdG8gYmUgZmlyc3Qgc2luY2UgdGhlIF9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lIGl0ZXJh
dG9yIHdvdWxkCj4gb3RoZXJ3aXNlIGNvbmZpZ3VyZSB0aGUgZGVmYXVsdCBjb250ZXh0IGFuZCBj
b25mdXNlIHRoZSB0ZXN0Lgo+IAo+IFNvIGxlZ2FjeSB0ZXN0cyBydW4gb24gdGhlIHVuY29uZmln
dXJlZCAod2l0aCBlbmdpbmUgbWFwKSBjb250ZXh0IGFuZCB1c2UKPiBhIG5ldyBoZWxwZXIgZ2Vt
X2ViX2ZsYWdzX3RvX2VuZ2luZSB0byBsb29rIHVwIHRoZSBlbmdpbmUgZnJvbSB0aGUKPiBpbnRl
bF9leGVjdXRpb25fZW5naW5lczIgc3RhdGljIGxpc3QuIFRoaXMgaXMgb25seSB0byBlbmFibGUg
dGhlIGNvcmUgdGVzdAo+IGNvZGUgdG8gYmUgc2hhcmVkLgoKTm90ZSB0aGF0IHRoaXMgbWlzc2Vz
IHRoZSBJOTE1X0VYRUNfREVGQVVMVCBzbG90LiBUaGF0IGEgcmF0aGVyCnNpZ25pZmljYW50IG92
ZXJzaWdodC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
