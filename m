Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624A6E902
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 18:25:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119181619.11674-1-stuart.summers@intel.com>
 <20191119181619.11674-2-stuart.summers@intel.com>
In-Reply-To: <20191119181619.11674-2-stuart.summers@intel.com>
Message-ID: <157418792410.12093.8231741606090477200@skylake-alporthouse-com>
Date: Tue, 19 Nov 2019 18:25:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915/gem_mman: mmap to the CPU
 instead of the GTT in some tests
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
To: Stuart Summers <stuart.summers@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTdHVhcnQgU3VtbWVycyAoMjAxOS0xMS0xOSAxODoxNjoxOSkKPiBEbyBub3QgbGlt
aXQgdG8gdGhlIEdUVCBmb3IgdGVzdHMgd2hpY2ggYXJlIG5vdCBzcGVjaWZpY2FsbHkgdGVzdGlu
Zwo+IGNhcGFiaWxpdHkgaW4gdGhlIEdUVC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3Vt
bWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaTkxNS9nZW1fbW1h
bi5jICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gIGxpYi9pOTE1L2dlbV9t
bWFuLmggICAgICAgICAgICB8ICAxICsKPiAgdGVzdHMvaTkxNS9nZW1fY3R4X3NoYXJlZC5jICAg
IHwgMjAgKysrKystLS0tLS0tLS0tLS0tLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19zY2hlZHVs
ZS5jIHwgIDMgKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTcgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pOTE1L2dlbV9tbWFuLmMgYi9saWIvaTkx
NS9nZW1fbW1hbi5jCj4gaW5kZXggYTBlMzRhZWYuLmQzNzg0MGY3IDEwMDY0NAo+IC0tLSBhL2xp
Yi9pOTE1L2dlbV9tbWFuLmMKPiArKysgYi9saWIvaTkxNS9nZW1fbW1hbi5jCj4gQEAgLTQwLDYg
KzQwLDI1IEBACj4gICNkZWZpbmUgVkcoeCkgZG8ge30gd2hpbGUgKDApCj4gICNlbmRpZgo+ICAK
PiArdm9pZCAqZ2VtX21tYXBfaG9zdChpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdWludDY0X3Qg
c2l6ZSwgdW5zaWduZWQgcHJvdCkKPiArewo+ICsgICAgICAgdm9pZCAqcHRyOwo+ICsgICAgICAg
dWludDMyX3QgZG9tYWluOwo+ICsKPiArICAgICAgIGlmIChnZW1faGFzX21hcHBhYmxlX2dndHQo
ZmQpKSB7Cj4gKyAgICAgICAgICAgICAgIHB0ciA9IGdlbV9tbWFwX19ndHQoZmQsIGhhbmRsZSwg
c2l6ZSwgcHJvdCk7Cj4gKyAgICAgICAgICAgICAgIGRvbWFpbiA9IEk5MTVfR0VNX0RPTUFJTl9H
VFQ7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBwdHIgPSBnZW1fbW1hcF9f
Y3B1KGZkLCBoYW5kbGUsIDAsIHNpemUsIHByb3QpOwo+ICsgICAgICAgICAgICAgICBkb21haW4g
PSBJOTE1X0dFTV9ET01BSU5fQ1BVOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGdlbV9zZXRf
ZG9tYWluKGZkLCBoYW5kbGUsIC8qIG5vIHdyaXRlIGhhemFyZCBsaWVzISAqLwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgZG9tYWluLCBkb21haW4pOwoKQW5kIGJlIHZlcnkgY2FyZWZ1bCBwdXR0
aW5nIHRoZSBzZXQtZG9tYWluIGluIGhlcmU7IGFzIHRoZSBsaWVzIGFyZQppbnRlZ3JhbCB0byB0
aGUgdGVzdCBhbmQgbm90IHN1aXRhYmxlIGZvciBsaWJyYXJpZXMuIERvbWFpbiBoYW5kbGluZyBp
cwpzYWRseSBvZiBwYXJhbW91bnQgaW1wb3J0YW5jZSBmb3IgbW9zdCB0ZXN0cy4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
