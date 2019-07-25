Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20190723161730.23535-1-chris@chris-wilson.co.uk>
 <20190723161730.23535-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190723161730.23535-2-chris@chris-wilson.co.uk>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 25 Jul 2019 15:41:54 +0100
Message-ID: <CAM0jSHMJZ7bAWdyace01ss49AYRf5kv9QNJv_oBs0f9Cf6J5tQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/gem_ctx_shared: Avoid clflush
 by using WC for readback
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
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMyBKdWwgMjAxOSBhdCAxNzoxNywgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gQXMgd2UgbmV2ZXIgb2ZmaWNpYWxseSB3cml0ZSB0byB0
aGUgc2NyYXRjaCBidWZmZXIsIHRoZSBrZXJuZWwgd2lsbAo+IGxlYXZlIGl0IGluIHRoZSBDUFUg
cmVhZCBkb21haW4gdXBvbiBleGVjdXRpb24uIE91ciBhdHRlbXB0IHRvCj4gaW52YWxpZGF0ZSB0
aGUgQ1BVIGNhY2hlIG9uICFsbGMgaXMgdGhlcmVmb3JlIHNraXBwZWQgYXMgdGhlIGtlcm5lbAo+
IGRvZXNuJ3QgYmVsaWV2ZSB0aGUgYmFja2luZyBzdG9yZSBoYXMgYmVlbiBpbnZhbGlkYXRlZC4g
VXNlIGEgV0MgbW1hcCB0bwo+IGF2b2lkIHRoZSBDUFUgY2FjaGUgZm9yIHJlYWRiYWNrLCBhbmQg
YWRkIGFuIGV4dHJhIHNhbml0eSBjaGVjayB0aGF0IHRoZQo+IHNjcmF0Y2ggYnVmZmVyIGlzIGZv
dW5kIGF0IHRoZSBzYW1lIGxvY2F0aW9uIGFmdGVyIGV4ZWN1dGlvbi4gKFRoaXMKPiBzYW5pdHkg
Y2hlY2sgZG9lcyBub3QgYWZmZWN0IHRoZSBmYWlsdXJlIHJhdGUgb24gYnN3LCB0aGF0IGlzIG9u
bHkgZml4ZWQKPiBhZnRlciByZWFsaXNpbmcgdGhhdCB3ZSBkbyBub3QgY2xmbHVzaCBmb3IgdGhl
IGludmFsaWRhdGUgcHJpb3IgdG8gdGhlCj4gcmVhZCkuCj4KPiBCdWd6aWxsYTogaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExMTg3Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClJldmlld2VkLWJ5OiBN
YXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
