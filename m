Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <cc7dacb7-a364-7003-1161-e4424e9adde0@intel.com>
References: <20190604162912.28359-1-chris@chris-wilson.co.uk>
 <cc7dacb7-a364-7003-1161-e4424e9adde0@intel.com>
Message-ID: <155967842632.21578.3565278695687684599@skylake-alporthouse-com>
Date: Tue, 04 Jun 2019 21:00:26 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_shared: Fixup vec0 mmio
 base for icl
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDYtMDQgMTk6NDM6MzUpCj4gCj4gCj4g
T24gMDQvMDYvMTkgMDk6MjksIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IEkgdG9sZCB2ZWNzMCB0
byB1c2UgdmVjczEgcmVnaXN0ZXJzLi4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gLS0tCj4gPiAgIHRlc3RzL2k5MTUv
Z2VtX2N0eF9zaGFyZWQuYyB8IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dl
bV9jdHhfc2hhcmVkLmMgYi90ZXN0cy9pOTE1L2dlbV9jdHhfc2hhcmVkLmMKPiA+IGluZGV4IDY3
ZWNkMDk1My4uMDY5OTY0NTQ2IDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X3No
YXJlZC5jCj4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9jdHhfc2hhcmVkLmMKPiA+IEBAIC01NDQs
OSArNTQ0LDExIEBAIHN0YXRpYyB2b2lkIGluZGVwZW5kZW50KGludCBpOTE1LCB1bnNpZ25lZCBy
aW5nLCB1bnNpZ25lZCBmbGFncykKPiA+ICAgICAgICAgICAgICAgbW1pb19iYXNlID0gMHgyMjAw
MDsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgIAo+ID4gKyNkZWZpbmUgR0VOMTFfVkVD
UzBfQkFTRSAweDFjODAwMAo+ID4gKyNkZWZpbmUgR0VOMTFfVkVDUzFfQkFTRSAweDFkODAwMAo+
IAo+IFZFQ1MxIGNvbWluZyBuZXh0Pwo+IAo+ID4gICAgICAgY2FzZSBJOTE1X0VYRUNfVkVCT1g6
Cj4gCj4gVGhlcmUgaXMgYSBjb21tZW50ZWQtb3V0IGNhc2UgZm9yIEJTRCwgd2h5IGlzIHRoYXQ/
CgpCZWNhdXNlIHRoYXQgcmVhbGx5IGRvZXMgcmVxdWlyZSBwcm9iaW5nIGFzIG1heSBydW4gb24g
ZWl0aGVyIGVuZ2luZSwKaS5lLiBpdCBldmVuIGZhaWxzIG9uIGJkdysgd2l0aCBteSBsYXp5IGNv
ZGluZy4gQW5kIGJlaW5nIGxhenkgSSBwdW50ZWQKdGhlIGlzc3VlIGZvciBsYXRlci4gKFdlbGwg
SSBwcm9wb3NlZCBhc2tpbmcgdGhlIGtlcm5lbCBhbmQgSm9vbmFzIHRvbGQKbWUgdG8gcmVhZCBk
ZWJ1Z2ZzIGFuZCBJIGNvbnZlbmllbnRseSBmb3Jnb3QgYWxsIGFib3V0IGl0LikKLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
